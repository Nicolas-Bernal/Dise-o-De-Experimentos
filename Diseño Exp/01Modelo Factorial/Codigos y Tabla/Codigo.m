% Leer tabla de Factores y bloques

tabla_NaN = readtable('Tabla1.xlsx');

head(tabla_NaN)
size(tabla_NaN)

% Importante ya que la tabla se cargo con valores NaN

tabla_dt = rmmissing(tabla_NaN);
tail(tabla_dt)

tabla = table2array(tabla_dt);
%%
% ahora buscamos aplicar el modelo lineal general para dise;o de
% experimentos con matrices de proyeccion


 
% Variables Y,X0,X1,X2,X3

Y  = tabla(:, 1);     % Variable respuesta
X0 = tabla(:, 2);     % Intercepto (Media general)
X1 = tabla(:, 3:4);   % Factor 1
X2 = tabla(:, 5:7);   % Factor 2
X3 = tabla(:, 8:13);  % Modelo completo / Interacciones

%%

% Matrices base

N = length(Y);
I = eye(N);             % diag(1,N))
j16 = ones(N, N);       

%% 

% Matrices de Proyección p0,p1,p2,p3

p0 = (1 / N) * j16; 
p1 = X1 * pinv(X1' * X1) * X1';
p2 = X2 * pinv(X2' * X2) * X2';
p3 = X3 * pinv(X3' * X3) * X3';

%%

% Sumas de cuadrados (SST, SSB, SSTB, SSE, SSTO)

SST  = Y' * (p1 - p0) * Y;
SSB  = Y' * (p2 - p0) * Y;
SSTB = Y' * (p3 - p2 - p1 + p0) * Y;
SSE  = Y' * (I - p3) * Y;
SSTO = Y' * (I - p0) * Y;

%%

% Grados de libertad 

gl_T   = rank(p1 - p0);
gl_B   = rank(p2 - p0);
gl_TB  = rank(p3) - rank(p2) - rank(p1) + rank(p0);
gl_E   = rank(I - p3);
gl_Tot = rank(I - p0);

%%

% Cuadrados Medios
CM_T  = double(SST) / gl_T;
CM_B  = double(SSB) / gl_B;
CM_TB = double(SSTB) / gl_TB;
CM_E  = double(SSE) / gl_E;

%%

% Estadístico F calculado para cada efecto
F_T  = CM_T / CM_E;
F_B  = CM_B / CM_E;
F_TB = CM_TB / CM_E;

%%

% Tabla ANOVA

Fuentes = {'Factor T'; 'Factor B'; 'Interacción (TxB)'; 'Error (Residuo)'; 'Total'};

GL = [gl_T; gl_B; gl_TB; gl_E; gl_Tot];

SC = [SST; SSB; SSTB; SSE; SSTO];

CM = [CM_T; CM_B; CM_TB; CM_E; NaN];

F_vals = [F_T; F_B; F_TB; NaN; NaN];

tablaANOVA = table(GL,SC,CM,F_vals,'Rownames',Fuentes, ...
    'VariableNames',{'Grados de libertad','Suma de cuadrados','Cuadrados medios','F_Calculado'});

tablaANOVA




