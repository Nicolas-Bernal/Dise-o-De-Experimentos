# Diseño Factorial 2

![imagen1.PNG](imagen1.png)

1. Se usa el dise;o de bloques completo al azar (DBCA):

$$
Y_{ijk} = \mu + \tau_i + \beta_j + \varepsilon_{ijk}
$$

- $Y_{ijk}$: Variable de respuesta correspondiente a la $k$-ésima réplica del $i$-ésimo tratamiento en el $j$-ésimo bloque
- $\mu:$ Media general o constante.
- $\tau_i:$ Efecto del $i$-ésimo tratamiento (tipo de luz, para $i = 1, 2, 3$).
- $\beta_j$: Efecto del $j$-ésimo bloque (tipo de reactivo, para $j = 1, 2$).
- $\varepsilon_{ijk}$: Error aleatorio asociado a la observación.

1. El modelo matricial es: 

![imagen2.PNG](imagen2.png)

3.  La tabla ANOVA Calculada en Matlab es la siguente:

```matlab
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

X3 = [X0, X1, X2, tabla(:, 8:13)];

X3
%%

% Matrices base

N = length(Y);
I = eye(N);             % diag(1,N))
j16 = ones(N, N);       

%% 

% Matrices de Proyección p0,p1,p2,p3

% Construcción de subespacios anidados (acumulados con la constante X0)
X_T   = [X0, X1];          % Espacio del Tratamiento
X_TB  = [X0, X1, X2];      % Espacio de Tratamiento + Bloque

p0    = X0 * pinv(X0' * X0) * X0';
p1    = X_T * pinv(X_T' * X_T) * X_T';
p2    = X_TB * pinv(X_TB' * X_TB) * X_TB';
p3    = X3 * pinv(X3' * X3) * X3';

%%

SST  = Y' * (p1 - p0) * Y;      % Efecto Tratamiento (T)
SSB  = Y' * (p2 - p1) * Y;      % Efecto Bloque ajustado a T (B|T)
SSTB = Y' * (p3 - p2) * Y;      % Efecto Interacción ajustado (TxB|T,B)
SSE  = Y' * (I - p3) * Y;      % Error
SSTO = Y' * (I - p0) * Y;      % Total
%%

% Grados de libertad 

gl_T   = rank(p1 - p0);
gl_B   = rank(p2 - p1);
gl_TB  = rank(p3 - p2);
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

```

![imagen3.PNG](imagen3.png)

1. Escriba la tabla de medias de celda:

$$
\bar{Y}_{ij\cdot} = \frac{\text{Suma de datos en la celda } (T_i, B_j)}{\text{Número de datos en la celda } (n_{ij})}
$$

![imagen4.PNG](imagen4.png)

1. Las tablas de analisis de varianza SS1 & SS2

SS1:

```matlab
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
```

![imagen5.PNG](imagen5.png)

SS2:

```matlab
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
```

![imagen6.PNG](imagen6.png)

1. Observaciones frente a los estadisticos generados, ademas una hipotesis por filas y otra por columnas 

1. Prueba de Hipótesis para las Filas (Factor Tratamiento T)

- **Hipótesis:**
    - $H_0$: Las medias de todos los Tratamientos son iguales $\mu_1 = \mu_2 = \mu_3$.
    - $H_1$: Al menos uno de los Tratamientos produce una media diferente.

**Estadístico de prueba:**
•  $F_{\text{calculado}} = 19.65$ *(tomando la prueba ajustada Tipo II)*.  
• $F_{\text{crítico}}(0.05, 2, 5) = 5.79$ **Decisión y Conclusión:**
• Como $F_{\text{calculado}} (19.65) > F_{\text{crítico}} (5.79)$, **se rechaza la hipótesis nula (H_0)**.

• **Interpretación:** Existe evidencia estadística suficiente para afirmar que los tratamientos aplicados en las filas tienen un efecto significativo diferente sobre la variable de respuesta.

**2. Prueba de Hipótesis para las Columnas (Factor Bloque B)**
• **Hipótesis:**
    ◦ $H_0$: Las medias de ambos Bloques son iguales $\mu_{\cdot 1} = \mu_{\cdot 2}$.
    ◦ $H_1$: Las medias de los Bloques son diferentes $\mu_{\cdot 1} \neq \mu_{\cdot 2}$.

**Estadístico de prueba:**
• $F_{\text{calculado}} = 232.76$
• $F_{\text{crítico}}(0.05, 1, 5) = 6.61$ **Decisión y Conclusión:**
• Como $F_{\text{calculado}} (232.76) > F_{\text{crítico}} (6.61)$, **se rechaza la hipótesis nula $H_0$**.

• **Interpretación:** El agrupamiento por bloques fue altamente efectivo, ya que la variabilidad entre las columnas es estadísticamente significativa y controla de manera importante el error experimental.

**3. Interpretación General de la Interacción $T \times B$**
• **Prueba de Interacción:**
    ◦ $F_{\text{calculado}} = 8.62$ con $F_{\text{crítico}}(0.05, 2, 5) = 5.79$. Como $8.62 > 5.79$, **la interacción entre Tratamiento y Bloque también resulta significativa**.   

• **Interpretación Final:**
El comportamiento del Factor Tratamiento depende del Bloque en el que se aplique. Por lo tanto, no basta con analizar los factores por separado; el efecto conjunto entre los tratamientos y las condiciones del bloque altera significativamente la respuesta esperada