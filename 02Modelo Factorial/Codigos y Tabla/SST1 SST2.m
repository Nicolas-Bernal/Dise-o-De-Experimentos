

% Leer tabla de Factores y bloques

tabla_NaN = readtable('02Modelo Factorial\Codigos y Tabla\Diseño Experimentos1(Hoja1).csv');

head(tabla_NaN)
size(tabla_NaN)

% Importante ya que la tabla se cargo con valores NaN

tabla_dt = rmmissing(tabla_NaN);
tail(tabla_dt)

tabla = table2array(tabla_dt);
tabla(1:5,:)
%%
% ahora buscamos aplicar el modelo lineal general para dise;o de
% experimentos con matrices de proyeccion



% Variables Y,X0,X1,X2,X3

Y  = tabla(:, 1);     % Variable respuesta
X0 = tabla(:, 2);     % Intercepto (Media general)
X1 = tabla(:, 3:5);   % Factor 1
X2 = tabla(:, 6:7);   % Factor 2

%X3 = tabla(:, 8:13);  % Modelo completo / Interacciones

X_interaccion = tabla(:, 8:13);

X3_int = [X0, X1, X2, tabla(:, 8:13)];


X3

%% --- CÁLCULO DE TABLA SS1 (T -> B -> TxB) ---


% Subespacios anidados secuenciales
X_T    = [X0, X1];               % Modelo con solo T
X_TB   = [X0, X1, X2];           % Modelo con T + B
X_full = [X0, X1, X2, X3_int];   % Modelo Completo (T + B + TxB)

%%
% Matrices de proyección

p0     = X0 * pinv(X0' * X0) * X0';
p_T    = X_T * pinv(X_T' * X_T) * X_T';
p_TB   = X_TB * pinv(X_TB' * X_TB) * X_TB';
p_full = X_full * pinv(X_full' * X_full) * X_full';

%% 
% Sumas de Cuadrados Secuenciales

SS1_T   = Y' * (p_T - p0) * Y;          % T puro
SS1_B   = Y' * (p_TB - p_T) * Y;        % B ajustado a T (B|T)
SS1_TxB = Y' * (p_full - p_TB) * Y;     % Interacción ajustada a T y B
SSE     = Y' * (I - p_full) * Y;        % Error
SSTO    = Y' * (I - p0) * Y;           % Total

%% 

% Grados de Libertad
gl_T   = rank(p_T - p0);
gl_B   = rank(p_TB - p_T);
gl_TxB = rank(p_full - p_TB);
gl_E   = rank(I)-rank(p_full);
gl_Tot = rank(I - p0);

% Tabla ANOVA SS1
Tabla_SS1 = table(...
    [gl_T; gl_B; gl_TxB; gl_E; gl_Tot], ...
    [SS1_T; SS1_B; SS1_TxB; SSE; SSTO], ...
    [SS1_T/gl_T; SS1_B/gl_B; SS1_TxB/gl_TxB; SSE/gl_E; NaN], ...
    [(SS1_T/gl_T)/(SSE/gl_E); (SS1_B/gl_B)/(SSE/gl_E); (SS1_TxB/gl_TxB)/(SSE/gl_E); NaN; NaN], ...
    'VariableNames', {'GL', 'Suma_Cuadrados', 'Cuadrados_Medios', 'F_Calculado'}, ...
    'RowNames', {'Factor T', 'Factor B (dado T)', 'Interacción (TxB)', 'Error', 'Total'})


%% --- CÁLCULO DE TABLA SS2 (TIPO II) ---

% Subespacios que incluyen el intercepto X0
X_B    = [X0, X2];                     % Intercepto + Bloque
X_T    = [X0, X1];                     % Intercepto + Tratamiento
X_TB   = [X0, X1, X2];                 % Intercepto + Tratamiento + Bloque
X_full = [X0, X1, X2, tabla(:, 8:13)]; % Modelo Completo

% Matrices de proyección
p0     = X0 * pinv(X0' * X0) * X0';
p_B    = X_B * pinv(X_B' * X_B) * X_B';
p_T    = X_T * pinv(X_T' * X_T) * X_T';
p_TB   = X_TB * pinv(X_TB' * X_TB) * X_TB';
p_full = X_full * pinv(X_full' * X_full) * X_full';

% Sumas de Cuadrados Tipo II
SS2_T   = Y' * (p_TB - p_B) * Y;      % Factor T ajustado a B
SS2_B   = Y' * (p_TB - p_T) * Y;      % Factor B ajustado a T
SS2_TxB = Y' * (p_full - p_TB) * Y;   % Interacción
SSE     = Y' * (I - p_full) * Y;      % Error

% Grados de libertad y Cuadrados Medios
gl_T   = rank(p_TB - p_B);           % 2
gl_B   = rank(p_TB - p_T);           % 1
gl_TxB = rank(p_full - p_TB);        % 2
gl_E   = N - rank(X_full);           % 5

CM_T   = SS2_T / gl_T;
CM_B   = SS2_B / gl_B;
CM_TxB = SS2_TxB / gl_TxB;
CM_E   = SSE / gl_E;                 % 1.60

F_T   = CM_T / CM_E;
F_B   = CM_B / CM_E;
F_TxB = CM_TxB / CM_E;

% Construcción de la tabla SS2
Fuentes = {'Factor T (ajustado B)'; 'Factor B (ajustado T)'; 'Interacción (TxB)'; 'Error (Residuo)'};
GL      = [gl_T; gl_B; gl_TxB; gl_E];
SC      = [SS2_T; SS2_B; SS2_TxB; SSE];
CM      = [CM_T; CM_B; CM_TxB; CM_E];
F_vals  = [F_T; F_B; F_TxB; NaN];

tablaSS2 = table(GL, SC, CM, F_vals, 'RowNames', Fuentes, ...
    'VariableNames', {'Grados_de_libertad', 'Suma_de_cuadrados', 'Cuadrados_medios', 'F_Calculado'})