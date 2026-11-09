# Muestreo aleatorio simple con reemplazo (MAS)

# Introducción

Apunte sobre el **muestreo aleatorio simple (MAS) con reemplazo** y la estimación de parámetros en subpoblaciones o dominios. Se ordenaron las definiciones, se normalizó la notación y se corrigieron expresiones que podían inducir a error.

**Notación básica:** $N$ es el tamaño de la población, $n$ el tamaño de la muestra; $N_k$ y $n_k$ son, respectivamente, los tamaños de la población y de la muestra que pertenecen al dominio $k$.

## 1. MAS con reemplazo

En un MAS con reemplazo se realizan $n$ selecciones de una población de $N$ unidades. Después de cada selección, la unidad se devuelve a la población; por eso, una misma unidad puede aparecer varias veces.

### Características principales

- Las selecciones son independientes.
- En cada selección, todas las $N$ unidades tienen probabilidad $1/N$ de ser elegidas.
- Una población finita puede tratarse teóricamente como una población infinita para calcular las probabilidades de las selecciones.
- Se consideran **muestras ordenadas**: importa el orden en que aparecen las unidades.

El número de sucesiones posibles de tamaño $n$ es:

$$
N^n
$$

La probabilidad de obtener una sucesión específica es:

$$
P(\text{sucesión específica}) = \frac{1}{N^n}
$$

La probabilidad de que una unidad determinada aparezca **al menos una vez** en la muestra es:

$$
P(\text{inclusión}) = 1 - \left(1 - \frac{1}{N}\right)^n
= 1 - \left(\frac{N-1}{N}\right)^n
$$

### Ejemplo 1. Población de 20 personas y muestra de tamaño 5

Para $N=20$ y $n=5$, el número de sucesiones posibles es:

$$
20^5 = 3\,200\,000
$$

La probabilidad de una sucesión específica es:

$$
\frac{1}{20^5} = \frac{1}{3\,200\,000} = 0.0000003125
$$

La probabilidad de que una persona determinada sea seleccionada al menos una vez es:

$$
1 - \left(\frac{19}{20}\right)^5 \approx 0.2262
$$

Por tanto, dicha persona tiene aproximadamente un **22.62 %** de probabilidad de aparecer en la muestra.

### Cómo seleccionar una muestra con reemplazo

1. Asigne a cada unidad del marco muestral un número entre $1$ y $N$.
2. Genere $n$ selecciones aleatorias, permitiendo que un número salga más de una vez.

En Excel, puede usarse **Análisis de datos → Muestra** y especificar el tamaño de la muestra. En R:

```r
sample(x, n, replace = TRUE) # Muestra de tamaño n con reemplazo
```

![image.png](Muestreo%20aleatorio%20simple%20con%20reemplazo%20(MAS)/image.png)

## 2. Estimación de la media en un MAS con reemplazo

Sea $Y_i$ el valor de la variable de interés para la unidad $i$ de la población. La media poblacional es:

$$
\bar{Y} = \frac{1}{N}\sum_{i=1}^{N} Y_i
$$

La media de la muestra con reemplazo es:

$$
\bar{y} = \frac{1}{n}\sum_{j=1}^{n} y_j
$$

Este estimador es insesgado para la media poblacional:

$$
E(\bar{y}) = \bar{Y}
$$

Definamos la varianza poblacional con divisor $N$ y la varianza finita con divisor $N-1$:

$$
\sigma^2 = \frac{1}{N}\sum_{i=1}^{N}(Y_i-\bar{Y})^2,
\qquad
S^2 = \frac{1}{N-1}\sum_{i=1}^{N}(Y_i-\bar{Y})^2
$$

Por tanto, $\sigma^2 = \frac{N-1}{N}S^2$. La varianza de la media muestral con reemplazo es:

$$
\operatorname{Var}(\bar{y}) = \frac{\sigma^2}{n}
= \frac{N-1}{N}\frac{S^2}{n}
$$

La varianza muestral y su uso para estimar la varianza de la media son:

$$
s^2 = \frac{1}{n-1}\sum_{j=1}^{n}(y_j-\bar{y})^2,
\qquad
\widehat{\operatorname{Var}}(\bar{y}) = \frac{s^2}{n}
$$

El error estándar estimado es:

$$
\widehat{EE}(\bar{y}) = \frac{s}{\sqrt{n}}
$$

**Corrección importante:** el error estándar se calcula dividiendo $s$ por $\sqrt{n}$, no por $n$.

## 3. Estimación en subpoblaciones o dominios

A veces una encuesta busca estimar parámetros para toda la población y también para ciertos subgrupos. Estos subgrupos se denominan **dominios** o **subpoblaciones**.

Pueden identificarse antes del muestreo y muestrearse por separado, o bien extraerse una muestra de la población completa y presentar después resultados para cada dominio. Los dominios pueden corresponder, por ejemplo, a regiones, municipios, edades, sexo o combinaciones de estas variables. En el caso más simple, son excluyentes: cada unidad pertenece a un único dominio.

### Notación para el dominio $k$

- $N_k$: número de unidades de la población en el dominio $k$.
- $n_k$: número de unidades de la muestra en el dominio $k$.
- $y_{ki}$: valor de la variable para la unidad $i$ del dominio $k$.
- $Y_k=\sum_{i=1}^{N_k}Y_{ki}$: total poblacional de la variable en el dominio $k$.
- $\bar{Y}_k=Y_k/N_k$: media poblacional en el dominio $k$.
- $n$: tamaño total de la muestra.

En un MAS sin reemplazo de tamaño fijo $n$, $n_k$ suele ser aleatorio: puede variar de una muestra a otra.

### 3.1 Media del dominio

Si $n_k>0$, la media muestral del dominio es:

$$
\bar{y}_k = \frac{1}{n_k}\sum_{i\in s_k} y_{ki}
$$

Condicionalmente a un valor dado de $n_k$, es un estimador insesgado de $\bar{Y}_k$. Si $n_k=0$, no hay observaciones del dominio y esta media no puede calcularse.

Cuando $N_k$ es conocido y $n_k>1$, la varianza estimada condicional es:

$$
\widehat{\operatorname{Var}}(\bar{y}_k\mid n_k)
= \frac{N_k-n_k}{N_k n_k}s_k^2,
\qquad
s_k^2 = \frac{1}{n_k-1}\sum_{i\in s_k}(y_{ki}-\bar{y}_k)^2
$$

Si $N_k$ se desconoce, puede usarse la siguiente **aproximación**, sustituyendo la fracción de muestreo del dominio por la fracción global $n/N$:

$$
\widehat{\operatorname{Var}}(\bar{y}_k\mid n_k)
\approx \frac{N-n}{N n_k}s_k^2
$$

### 3.2 Total del dominio

Si $N_k$ es conocido, el estimador del total es:

$$
\hat{Y}_k = N_k\bar{y}_k
$$

Su varianza estimada es:

$$
\widehat{\operatorname{Var}}(\hat{Y}_k)
= N_k^2\widehat{\operatorname{Var}}(\bar{y}_k)
$$

Si $N_k$ se desconoce, se puede estimar el total expandiendo a la población la suma observada en el dominio. Defina $y'_i=y_i$ si la unidad $i$ pertenece al dominio $k$, y $y'_i=0$ en caso contrario. Entonces:

$$
\hat{Y}'_k = \frac{N}{n}\sum_{i\in s} y'_i
= N\bar{y}'
$$

La varianza estimada es:

$$
\widehat{\operatorname{Var}}(\hat{Y}'_k)
= N^2\frac{N-n}{Nn}s'^2,
\qquad
s'^2 = \frac{1}{n-1}\sum_{i\in s}(y'_i-\bar{y}')^2
$$

### Ejemplo 2. Medias y totales por sector

Se realizó un MAS sin reemplazo de 40 familias de una población de 1,000. Se registró el ingreso mensual, medido en salarios mínimos, y el sector donde vive cada familia. Se desea estimar el ingreso promedio y el ingreso total de las familias del norte y del sur.

- $N_1$ y $N_2$: números de familias en el norte y el sur.
- $\bar{Y}_1$ y $\bar{Y}_2$: ingresos promedio poblacionales de cada sector.
- $Y_1$ y $Y_2$: ingresos totales poblacionales de cada sector.

La imagen conserva la información del ejemplo original:

![image.png](Muestreo%20aleatorio%20simple%20con%20reemplazo%20(MAS)/image%201.png)

## 4. Proporciones y totales de atributos en subpoblaciones

Supongamos que se estudia un atributo binario: $y=1$ si la unidad tiene el atributo y $y=0$ si no lo tiene.

### Notación

- $N_k$: número de unidades de la población en el dominio $k$.
- $n_k$: número de unidades de la muestra en el dominio $k$.
- $A_k$: número de unidades de la población del dominio $k$ que tienen el atributo.
- $a_k$: número de unidades de la muestra del dominio $k$ que tienen el atributo.
- $P_k=A_k/N_k$: proporción poblacional del atributo en el dominio.
- $p_k=a_k/n_k$: proporción muestral del atributo en el dominio.
- $q_k=1-p_k$: proporción muestral sin el atributo.

Si $n_k>0$, $p_k$ estima condicionalmente la proporción poblacional $P_k$. Para $N_k$ conocido y $n_k>1$, la varianza estimada es:

$$
\widehat{\operatorname{Var}}(p_k\mid n_k)
= \frac{N_k-n_k}{N_k}\frac{p_kq_k}{n_k-1}
$$

Cuando $N_k$ es desconocido, puede aproximarse usando la fracción de muestreo global:

$$
\widehat{\operatorname{Var}}(p_k\mid n_k)
\approx \frac{N-n}{N}\frac{p_kq_k}{n_k-1}
$$

### Total de unidades con el atributo

Si $N_k$ es conocido, el total estimado de unidades con el atributo es:

$$
\hat{A}_k = N_kp_k
$$

Su varianza estimada es:

$$
\widehat{\operatorname{Var}}(\hat{A}_k)
= N_k^2\widehat{\operatorname{Var}}(p_k)
= N_k(N_k-n_k)\frac{p_kq_k}{n_k-1}
$$

Si $N_k$ es desconocido, sea $a_k$ el número de unidades de la muestra que pertenecen al dominio y tienen el atributo. El estimador expandido es:

$$
\hat{A}'_k = \frac{N}{n}a_k
$$

Defina además $p'_k=a_k/n$ y $q'_k=1-p'_k$. La varianza estimada es:

$$
\widehat{\operatorname{Var}}(\hat{A}'_k)
= N(N-n)\frac{p'_kq'_k}{n-1}
$$

### Ejemplo 3. Intención de voto por nivel educativo

En un MAS sin reemplazo de 300 personas de una población de 5,000 se registró el nivel educativo y si la persona tenía intención de votar. Se considera $y=1$ para una respuesta afirmativa y $y=0$ en caso contrario. Los tamaños de los dominios son conocidos:

| Dominio | Nivel educativo | $N_k$ | $n_k$ | $a_k$ |
| --- | --- | --- | --- | --- |
| 1 | Universitario | 1,000 | 80 | 50 |
| 2 | Secundario | 1,500 | 100 | 60 |
| 3 | Primario o ninguno | 2,500 | 120 | 70 |
| **Total** |  | **5,000** | **300** | **180** |

La proporción estimada y el total estimado en cada dominio se obtienen con $\hat{p}_k=a_k/n_k$ y $\hat{A}_k=N_k\hat{p}_k$:

| Dominio | $\hat{p}_k$ | $\hat{q}_k$ | $\hat{A}_k=N_k\hat{p}_k$ |
| --- | --- | --- | --- |
| Universitario | 0.6250 | 0.3750 | 625 |
| Secundario | 0.6000 | 0.4000 | 900 |
| Primario o ninguno | 0.5833 | 0.4167 | 1,458.33 |

La suma de los totales estimados es aproximadamente **2,983 personas** con intención de votar. Los valores no enteros son esperables en una estimación.

Para ilustrar la incertidumbre, las varianzas estimadas de las proporciones, aplicando la fórmula para $N_k$ conocido, son aproximadamente:

| Dominio | $\widehat{\operatorname{Var}}(p_k)$ | Error estándar estimado $\sqrt{\widehat{\operatorname{Var}}(p_k)}$ |
| --- | --- | --- |
| Universitario | 0.002729 | 0.0522 |
| Secundario | 0.002263 | 0.0476 |
| Primario o ninguno | 0.001944 | 0.0441 |

## 5. Resumen de fórmulas clave

- **Número de muestras ordenadas con reemplazo:** $N^n$.
- **Probabilidad de incluir una unidad al menos una vez:** $1-(1-1/N)^n$.
- **Varianza de la media con reemplazo:** $\operatorname{Var}(\bar{y})=\sigma^2/n$.
- **Error estándar estimado de la media:** $s/\sqrt{n}$.
- **Media estimada del dominio:** $\bar{y}_k=\sum_{i\in s_k}y_{ki}/n_k$.
- **Total estimado del dominio si $N_k$ es conocido:** $\hat{Y}_k=N_k\bar{y}_k$.
- **Proporción estimada del atributo:** $\hat{p}_k=a_k/n_k$.
- **Total estimado del atributo si $N_k$ es conocido:** $\hat{A}_k=N_k\hat{p}_k$.

![image.png](Muestreo%20aleatorio%20simple%20con%20reemplazo%20(MAS)/image%202.png)

![image.png](Muestreo%20aleatorio%20simple%20con%20reemplazo%20(MAS)/image%203.png)