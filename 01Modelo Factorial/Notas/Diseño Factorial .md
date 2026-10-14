# Diseño Factorial

Modelo sobre parametrizado

## **Problema de Diseño de Experimentos (Dos Factores con Interacción - Enfoque Matricial)**

Se desea evaluar el rendimiento o respuesta de un proceso industrial influenciado por dos factores: el **Factor T** (con 2 niveles: $T_1, T_2$) y el **Factor B** (con 3 niveles: $B_1, B_2, B_3$).
Los datos obtenidos en las réplicas experimentales se registran en la siguiente tabla de doble entrada, con un total de $N = 16$ observaciones:

![image 7.png](image.png)

1. Plantear el modelo lineal clásico de efectos y su equivalente en forma matricial general ($Y = X\beta + \varepsilon$)
2. Definir las matrices de diseño parciales ($X_0, X_1, X_2, X_3$) correspondientes a la media general, los efectos principales de los factores y su interacció
3. Construir las matrices de proyección ortogonal ($P_i$) para cada componente del modelo.
4. Calcular mediante álgebra matricial las Sumas de Cuadrados (SST, SSB, SSTB, SSE y SSTO) necesarias para construir la tabla ANOVA

## El Modelo Matemático de Dos Factores

El modelo que se elige para este experimento es un **modelo lineal de dos vías con interacción**:

$$
Y_{ijk} = \mu + \tau_i + \beta_j + (\tau\beta)_{ij} + \varepsilon_{ijk}
$$

Para resolver esto de forma elegante y automatizada (por ejemplo, en MATLAB), agrupamos todas las ecuaciones escalares en un gran sistema matricial:

$$
Y = X\beta + \varepsilon
$$

Donde $Y$ es el vector columna de tamaño $16 \times 1$ con todas las respuestas del experimento. La matriz de diseño total $X$ se descompone o particiona en bloques para aislar cada fuente de variación:

- **$X_0$**: Matriz del intercepto (una columna de puros $1$), que representa la media general.
- **$X_1$**: Submatriz asociada al Factor T.
- **$ X_2$ / $X_3$**: Submatrices asociadas al Factor B y a la interacción de los factores.

## Las Matrices de Proyección ($P_i$)

En lugar de sumar desviaciones a mano, el álgebra lineal moderna utiliza **matrices de proyección ortogonal** (también llamadas matrices sombrero). Una matriz $P_i$ proyecta ortogonalmente el vector de datos $Y$ sobre el subespacio vectorial generado por las columnas de la matriz $X_i$:

$$
P_i = X_i (X_i' X_i)^{-1} X_i'
$$

$$
P_0 = X_0 (X_0' X_0)^{-1} X_0'
$$

donde P_0 simplemente es una matrix de 1 en la diagonal principal, otras **$P_i$ ($P_1, P_2, P_3$):** Capturan el espacio acumulado de los factores y sus interacciones a medida que el modelo se vuelve más completo.

## Las Fórmulas de las Sumas de Cuadrados (SS) por Diferencia de Proyecciones

- SST (Suma de Cuadrados del Factor T): $SST = Y'(P_1 - P_0)Y$
- **SSB (Suma de Cuadrados del Factor B):** $SSB = $Y'(P_2 - P_0)Y$
- **SSTB (Suma de Cuadrados de la Interacción):=** $Y'(P_3 - P_2 - P_1 + P_0)Y$
- **SSE (Suma de Cuadrados del Error):** $SSE = Y'(I - P_3)Y$
- **SSTO (Suma de Cuadrados Total):** SSTO = $Y'(I - P_0)Y$

## Modelo Lineal General aplicado a Diseños Experimentales mediante Matrices de Proyección (Excel,Matlab)

Ahora hacemos la tabla en Excel sobre los cada tratamiento, bloques y interacciones

![image.png](image%201.png)

ahora buscamos descargar esta tabla para poder trabajar en ella desde matlab para esto lo hacemos descargando la tabla como un .xlsx creamos una carpeta y dentro esta carpeta sera el espacio de trabajo para matlab el scrip y el excel lo leemos y aplicamos los calculos anterior y pasos donde aplicamos el modelo lineal general para el dise;o propuesto

cada uno de los siguentes bloques en matlab lo que hace es calcular una fila de la tabla ANOVA atraves del modelo propuesto y descompuesto 

```matlab
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
gl_TB  = rank(p3 - p2 - p1 + p0);
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

## Salida del codigo

su meta real es **probar hipótesis sobre las medias** de los diferentes grupos experimentales para saber qué factores están afectando realmente el proceso y cuáles son solo ruido o casualidad.

## Conclusion de la tabla ANOVA

![image.png](image%202.png)

"A partir del análisis de varianza (ANOVA) mediante el enfoque de matrices de proyección con un nivel de significancia tradicional ($\alpha = 0.05$), se concluye lo siguiente:

1. **Efecto del Factor T:** El estadístico F calculado para el Factor T es de $38.612$. Al ser un valor considerablemente alto, se rechaza la hipótesis nula para este factor, lo que demuestra que **el Factor T tiene un efecto altamente significativo** sobre la variable de respuesta del experimento.
2. **Efecto del Factor B:** El Factor B presenta un estadístico F calculado de $23.734$. Esto indica que las diferencias entre los niveles del Factor B generan una variabilidad que supera ampliamente al error residual, por lo que **el Factor B también es estadísticamente significativo** en el proces
3. **Interacción ($T X B$):** La interacción entre ambos factores arroja un valor F de $8.3471$. Al superar los valores críticos de referencia para 4 y 10 grados de libertad, se concluye que **existe un efecto de interacción significativo ($T \times B$)**. Esto significa que el impacto de cambiar los niveles del Factor T depende directamente del nivel en el que se encuentre operando el Factor B."

## Hipotesis para la distribucion F de Fisher

Supongamos que tenemos tres tratamientos: \(T_1,T_2,T_3\).

Por ejemplo, queremos estudiar si tres fertilizantes producen la misma cantidad promedio de maíz.
Cada tratamiento tiene una media poblacional:

$$
\mu_1,\quad \mu_2,\quad \mu_3.
$$

Estas representan la producción promedio verdadera de cada fertilizante, no simplemente el promedio de las observaciones que tomamos.
Nuestra pregunta es:

¿Los tres fertilizantes tienen la misma producción media o existe alguna diferencia?

Para responder, formulamos dos hipótesis.

Hipótesis nula:

$$
 
\boxed{H_0:\mu_1=\mu_2=\mu_3}
$$

Hipótesis alternativa:

$$
\boxed{H_1:\text{al menos dos medias son diferentes}}
$$

la hipótesis alternativa no dice que todas las medias sean diferentes. Basta con que una de ellas difiera de otra.

En el modelo que vimos,

$$
Y_{ij}=\mu+\tau_i+\beta_j+\varepsilon_{ij},
$$

la hipótesis nula es equivalente a:

$$
H_0:\tau_1=\tau_2=\tau_3=0,
$$

si imponemos que,  $\sum_i\tau_i=0$

### F de Fisher(repaso)

Es una distribución de probabilidad continua que describe la relación o cociente entre dos variables aleatorias que siguen una **distribución de chi-cuadrada** ($\chi^2$), cada una dividida entre sus respectivos grados de libertad.

**Parámetros:** Está definida exclusivamente por dos parámetros llamados **grados de libertad**:

• $d_1$ (Grados de libertad del numerador).

• $d_2$ (Grados de libertad del denominador).**Dominio:** Solo toma valores positivos estritos ($x > 0$), ya que representa razones de varianzas (las varianzas nunca son negativas).**Forma:**

• Es una curva **asimétrica sesgada hacia la derecha** (cola positiva larga).

• A medida que los grados de libertad ($d_1$ y $d_2$) aumentan, la curva se vuelve más simétrica y se aproxima a una distribución normal.

**Propiedad de Inversión:**

 Si una variable aleatoria $X$ sigue una distribución $F(d_1, d_2)$, entonces su recíproco $1/X$ sigue una distribución $F(d_2, d_1)$.

en este caso para los anova que estamos haciendo tenemos que 

**Grados de libertad del numerador $df_1 = k - 1$**

**Grados de libertad del numerador $df_2 = N - k$**

## Hipotesis de Homocedasticidad

significa que para un modelo sobre parametrizado de un dise;o de experimento 

$$
Y_{ij}=\mu+\tau_i+\beta_j+\varepsilon_{ij}
$$

nos importa mucho el como de dispersa el error por lo que la homocedasticidad para este modelo es que se cumpla que todos los errores tenga la misma desviacion estandar

$$
\boxed{\operatorname{Var}(\varepsilon_{ij})=\sigma^2
\quad\text{para todo }i,j}
$$

puede suceder algunos casos muy particulares como que suceda que todos tienen medias diferentes pero se dispersan de la misma manera entonces es un analisis diferente unicamente a las medias.

### Como se Plantea la Hispotesis para la homocedasticidad?

cuando queremos comprobar si las varianzas son iguales o diferentes suponemos:

Hipotesis Nula:

$$
\boxed{H_0:\sigma_1^2=\sigma_2^2=\cdots=\sigma_k^2}
$$

Hipotesis Alternativa

$$
\boxed{H_1:\text{al menos una varianza es diferente}}
$$

## Aplicacion a Tabla ANOVA(Ejercicio)

![image.png](image%203.png)

Usando esta Tabla ya calculada para cada uno de los tratamientos tenemos que 

$$
F_{\text{crítico}} = F_{\alpha;Gl-T1, GL-Err} = \text{qf}(\alpha,Gl-T1 ,GL-Err ) \approx Valor-Critico
$$

$T_1$

$$
F_{\text{crítico}} = F_{0.95; 1, 10} = \text{qf}(0.95, 1, 10) \approx 4.96
$$

$T_2$

$$
F_{\text{crítico}} = F_{0.95; 2, 10} = \text{qf}(0.95, 2, 10) \approx \mathbf{4.103}
$$

$T_3$

$$
F_{\text{crítico}} = F_{0.95; 2, 10} = \text{qf}(0.95, 2, 10) \approx \mathbf{4.103}
$$

Pasandolo a R y haciendo graficos de Aceptacion-Rechazo

```r
alpha = 0.05

GLT1 = 1
GLT2 = 2
GLTXB = 2

GLErr = 10

F_T1 = 38.612
F_T2 = 23.734
F_TXB = 16.694

FT1_critico = round(qf(1-alpha,GLT1,GLErr),3)
FT2_critico = round(qf(1-alpha,GLT2,GLErr),3)
FT3_critico = round(qf(1-alpha,GLTXB,GLErr),3)

# Valores Criticos

FT1_critico
FT2_critico
FT3_critico
```

```r
# Grafico de analisis ACEPTACION-RECHAZO
x = seq(0, 40)

plot(x, df(x, df1 = GLT1, df2 = GLErr), type = "l", col = "navy", lwd = 4,main = "Factor-T1",
           xlab = "Valores de F", ylab = "Densidad de Probabilidad")

abline(v = FT1_critico, col = "red", lty = 2, lwd = 2)
abline(v = FT2_critico, col = "blue", lty = 2, lwd = 2)
abline(v = FT3_critico, col = "darkgreen", lty = 2, lwd = 2)

abline(v = F_T1, col = "black", lty = 1, lwd = 2)
abline(v = F_T2, col = "black", lty = 1, lwd = 2)
abline(v = F_TXB, col = "black", lty = 1, lwd = 2)

lines(x, df(x, df1 = GLT2, df2 = GLErr), col = "darkorange", lwd = 3)
lines(x, df(x, df1 = GLTXB, df2 = GLErr), col = "magenta", lwd = 3)

legend("topright", 
       legend = c(
         paste("Crítico T1:", FT1_critico), 
         paste("Crítico T2:", FT2_critico), 
         paste("Crítico TXB:", FT3_critico),
         paste("F_T1 calc:", F_T1),
         paste("F_T2 calc:", F_T2),
         paste("F_TXB calc:", F_TXB)
       ),
       col = c("red", "blue", "darkgreen", "black", "black", "black"), 
       lty = c(2, 2, 2, 1, 1, 1), 
       lwd = 2, bty = "n")
```

![descarga.png](descarga.png)

**Rechazar $H_0$ en el Factor T:**
**Significa:** El **Factor T sí afecta** los resultados. Cambiar los niveles de T produce un cambio real y medible en lo que estás evaluando.

**Rechazar $H_0$ en el Factor B:**

**Significa:** El **Factor B también afecta** los resultados por sí solo. Sus distintos niveles hacen que la variable de respuesta cambie.

**Rechazar $H_0$ en el Factor TXB:**

**Significa:** Los factores **T y B no actúan de forma independiente**, sino que **se potencian o modifican mutuamente**. El efecto del Factor T depende de qué nivel del Factor B estés aplicando (y viceversa)

## INTERACCION.

![image.png](image%204.png)

seguimos con el mismo ejercicio en este caso para hacer las interraciones entre los FACTORES vamos a calcular la media en las observaciones como se puede ver en cada interaccion del excel tiene una media distinta.

![image.png](image%205.png)

luego si observamos las medias de los Factores 

$$
\bar Y_{T1}=\frac{182}{8}=22.75
$$

$$
\bar Y_{T2}=\frac{217}{8}=27.125
$$

$$

27.125-22.75=4.375

$$

luego las medias difieren un 4.375 ya que el Factor 2 es 4.375 unidades mas grando que el Factor 1, esto realmente es algo descriptivo ya que si existe una diferencia entre los Factores a estudiar y en este caso en la interaccion de los Factores

luego analizando la interaccion en palabras formales significa que Existe una interacción cuando el efecto de un factor sobre la respuesta depende del nivel en el que se encuentre el otro factor

analizando la tabla y medias tenemos que.

cuando T1 esta en Nivel 1

- B1 = 20
- B2 = 25
- B3 = 24

cuando T2 estan en Nivel 2

- B1 = 26
- B2 = 23
- B3 = 32

para T1 la media mas alta es  B2 = 25

para T2 la media mas alta es B3 = 32

El comportamiento de B cambia según el nivel de T
