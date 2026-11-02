# MAS sin remplazo

<aside>
🎲

Muestreo aleatorio simple (MAS): Es uno de los procedimientos de muestreo conocidos como muestreos de elementos, aquellos donde las unidades elementales (de observación) son las mismas unidades de muestreo.

</aside>

## Características

- Todas las muestras posibles de tamaño $n$ de una población de tamaño $N$, tienen la misma probabilidad de ser seleccionadas.
- Todas las unidades de la población tienen la misma probabilidad de ser escogida y formar parte de la muestra (muestreo equiprobable).
- La selección de las unidades en el MAS se lleva a cabo seleccionando una unidad a la vez, en forma independiente.
- La selección puede ser con reemplazo o sin reemplazo.

En la práctica la selección de las unidades puede hacerse con base en tablas de números aleatorios u otro sistema que permita su obtención al azar.

Por lo general el muestro se hace sin reemplazo.

## Muestreo Aleatorio Simple sin reemplazo

- En el MAS sin reemplazo (o irrestrictamente aleatorio), ninguna unidad de la población puede estar representada en la muestra más de una vez.
- La probabilidad de selección de una muestra especifica está dada por:

$$
P=\frac{n!(N-n)!}{N!}=\frac{1}{\binom{N}{n}}
$$

ya que

$$
\binom{N}{n}=\frac{N!}{n!(N-n)!}
$$

es el número total de muestras posibles de tamaño $n$ que pueden ser seleccionados de la población de tamaño $N$.

- Además se puede calcular la probabilidad de que una unidad cualquiera de la población esté presente en la muestra. Esta probabilidad puede obtenerse dividiendo el número de muestras posibles que contienen la unidad especifica considerada, por el número posible de muestras, es decir:

$$
P(\text{unidad en la muestra})=\frac{\binom{N-1}{n-1}}{\binom{N}{n}}=\frac{n}{N}
$$

## Ejemplo 1.

Se quiere estudiar una población de 14 personas (unidades poblacionales) de las cuales se quiere seleccionar una muestra aleatoria simple sin reemplazo de tamaño 5, el número total de muestras diferentes que se pueden seleccionar es

$$
\binom{14}{5}=\frac{14!}{5!\,9!}=2002.
$$

La probabilidad de seleccionar una muestra compuesta por 5 personas determinadas es

$$
\frac{1}{2002}=0,0004995
$$

Además la probabilidad de que una persona cualquiera pertenezca a la muestra es igual a

$$
\frac{5}{14}=0,36
$$

![image.png](MAS%20sin%20remplazo/image.png)

### Generar una muestra aleatoria simple sin reemplazo

Pasos para seleccionar una muestra aleatoria simple sin reemplazo:

1. Asignar a cada unidad del marco muestral (o elemento de la población) un número del 1 a $N$.
2. Seleccionar aleatoriamente $n$ de esos números mediante el uso de algún proceso aleatorio.

Ejemplo (Seleccionar una muestra aleatoria simple).

**Usando RStudio:**

```r
X=1:N # genera una lista de 1 hasta N
Sample (x,n) # se genera una muestra aleatoria sin reemplazo de tamaño n

x = 1:20
sample(x,8) # se genera una muestra de tamaño 8 sin reemplazo
sample(x,8, replace=TRUE) # se genera una muestra de tamaño 8 con reemplazo
```

## Media poblacional MAS

Generalmente el parámetro más importante a estimar en una población es su media. Veamos algunos ejemplos.

![image.png](MAS%20sin%20remplazo/image%201.png)

### Notacion

![image.png](MAS%20sin%20remplazo/image%202.png)

![image.png](MAS%20sin%20remplazo/image%203.png)

En $\hat{Y}$ al factor $\frac{N}{n}$ que multiplica al total muestral, se le llama factor de expansión, elevación o inflación.

- Su inverso $\frac{n}{N}$, la razón del tamaño de la muestra respecto a la población, se llama fracción de muestreo.

## Media poblacion MAS

En el MAS sin reemplazo,

- La media muestral definida como $\bar{y}=\frac{1}{n}\sum_{i=1}^{n}y_i$ es un estimador insesgado de la media poblacional $\bar{Y}$.
- La varianza muestral $s^2=\frac{\sum_{i=1}^{n}(y_i-\bar{y})^2}{n-1}$, es un estimador insesgado de la varianza poblacional finita, $S^2$.
- La varianza de la media muestral es $\operatorname{Var}(\bar{y})=\left(1-\frac{n}{N}\right)\frac{S^2}{n}$.
- El error estándar de estimación de la media muestral es $\operatorname{EE}(\bar{y})=\sqrt{\left(1-\frac{n}{N}\right)\frac{S^2}{n}}$.

Los estimadores de $\operatorname{Var}(\bar{y})$ y el $\operatorname{EE}(\bar{y})$ se obtienen reemplazando $S^2$ y $S$ por sus respectivos estimadores $s^2$ y $s$, siendo el estimador de la varianza un estimador insesgado.

$$
\widehat{\operatorname{Var}}(\bar{y})=\left(1-\frac{n}{N}\right)\frac{s^2}{n},\qquad \widehat{\operatorname{EE}}(\bar{y})=\sqrt{\left(1-\frac{n}{N}\right)\frac{s^2}{n}}.
$$

Existen situaciones donde el objetivo es estimar el total de los valores de una variable. Veamos algunos ejemplos.

![image.png](MAS%20sin%20remplazo/image%204.png)

## Total poblacional MAS

- Un estimador insesgado del total poblacional, $Y$ está dado por

$$
\hat{Y}=N\bar{y}=\frac{N}{n}\sum_{i=1}^{n}y_i,
$$

donde $\frac{N}{n}$ es el factor de expansión y $\sum_{i=1}^{n}y_i$ es el total muestral utilizado en otras ocasiones.

- La varianza y el error estándar del estimador del total $\hat{Y}$ pueden deducirse de la varianza de la media:

$$
\operatorname{Var}(\hat{Y})=N^2\operatorname{Var}(\bar{y})=\left(1-\frac{n}{N}\right)\frac{N^2S^2}{n}=\frac{N(N-n)S^2}{n},
$$

$$
\operatorname{EE}(\hat{Y})=N\operatorname{EE}(\bar{y})=N\sqrt{\left(1-\frac{n}{N}\right)\frac{S^2}{n}}.
$$

Como estimadores de $\operatorname{Var}(\hat{Y})$ y $\operatorname{EE}(\hat{Y})$, se definen:

$$
\widehat{\operatorname{Var}}(\hat{Y})=\frac{N(N-n)s^2}{n},\qquad \widehat{\operatorname{EE}}(\hat{Y})=N\sqrt{\left(1-\frac{n}{N}\right)\frac{s^2}{n}}.
$$

El estimador de la varianza del estimador total es insesgado, al igual que en el caso de la media.

En el caso de la media y total poblacionales, los intervalos de confianza se construyen generalmente haciendo uso de la distribución normal.

![image.png](MAS%20sin%20remplazo/image%205.png)

Algunas ideas:

- Una estimación puntual, por el hecho de ser un solo número, no proporciona información sobre la precisión y confiabilidad de la estimación.
- Debido a la variabilidad del muestreo, virtualmente nunca es el caso de que $\bar{x}=\mu$. La estimación puntual no dice nada sobre qué tan cerca pudiera estar de $\mu$.
- Una alternativa para reportar un solo valor sensible del parámetro que se está estimando es calcular un intervalo completo de valores factibles: un intervalo de confianza (IC).
- Un intervalo de confianza siempre se calcula al seleccionar primero un nivel de confianza, el cual mide el grado de confiabilidad del intervalo.

## Intervalos de confianza para la media y el total poblacional

Algunas ideas:

- Los niveles de confianza más frecuentemente utilizados son 90, 95, 99%.
- Mientras más alto es el nivel de confianza, más fuerte es la creencia de que el valor del parámetro que se está estimando queda dentro del intervalo.
- El ancho del intervalo proporciona información sobre la precisión de una estimación de intervalo.
- Si el nivel de confianza es alto y el intervalo resultante es bastante angosto, el conocimiento del valor del parámetro es tiende a ser preciso.
- Un intervalo de confianza amplio transmite el mensaje de que existe gran cantidad de incertidumbre sobre el valor de lo que se está estimando.

Teniendo en cuenta esto, se pueden establecer intervalos de confianza aproximados del $100(1-\alpha)\%$ para la media y el total de poblaciones en el MAS sin reemplazo, como sigue,

$$
\bar{y}\pm t_{n-1,\,1-\alpha/2}\,\operatorname{EE}(\bar{y})
$$

y,

$$
\hat{Y}\pm t_{n-1,\,1-\alpha/2}\,\operatorname{EE}(\hat{Y})
$$

donde $t_{n-1,\,1-\alpha/2}$ es el percentil $100(1-\alpha/2)\%$ de la distribución $t$ con $n-1$ grados de libertad.

Cuando el tamaño de la muestra es “suficientemente grande” ($n>30$), el percentil de la distribución $t$ puede reemplazarse por el correspondiente percentil de la distribución estándar $z$.

## Estimación de la proporción y del total de elementos en la población con un atributo específico

- La proporción poblacional, $P$, y el número total de unidades en la población con el atributo deseado, $A$, pueden estimarse con $p$ (proporción en la muestra) y $\hat{A}$, que se definen:

$$
p=\frac{a}{n},\qquad \hat{A}=Np=\frac{N}{n}a
$$

donde $a$ es el número de elementos en la muestra con el atributo deseado.

- La varianza y el error estándar de estimación de la proporción muestral están dado por:

$$
\operatorname{Var}(p)=\frac{N-n}{N-1}\frac{PQ}{n}
$$

$$
\operatorname{EE}(p)=\sqrt{\frac{N-n}{N-1}\frac{PQ}{n}}
$$

Con estimadores

$$
\widehat{\operatorname{Var}}(p)=\frac{N-n}{N}\frac{pq}{n-1},\qquad \widehat{\operatorname{EE}}(p)=\sqrt{\frac{N-n}{N}\frac{pq}{n-1}}
$$

donde $\widehat{\operatorname{Var}}(p)$ es un estimador insesgado de $\operatorname{Var}(p)$.

La varianza y el error estándar del estimador del total de unidades con la característica, son:

$$
\operatorname{Var}(\hat{A})=N^2\frac{N-n}{N-1}\frac{PQ}{n}
$$

$$
\operatorname{EE}(\hat{A})=N\sqrt{\frac{N-n}{N-1}\frac{PQ}{n}}
$$

Teniendo como estimadores de estos parámetros:

$$
\widehat{\operatorname{Var}}(\hat{A})=N(N-n)\frac{pq}{n-1}
$$

$$
\widehat{\operatorname{EE}}(\hat{A})=N\sqrt{\frac{N-n}{N}\frac{pq}{n-1}}
$$

Si se cumple el requisito anterior, los límites de confianza para la proporción poblacional y para el número de elementos con el atributo deseado, estarán dados por:

$$
p\pm t_{n-1,\,1-\alpha/2}\,\widehat{\operatorname{EE}}(p)
$$

y,

$$
\hat{A}\pm t_{n-1,\,1-\alpha/2}\,\widehat{\operatorname{EE}}(\hat{A})
$$

Cuando el tamaño de muestra no cumple el límite mínimo establecido, los intervalos construidos con la distribución normal no son muy buenos (límites inferiores negativos o superiores mayores que 1). En estos casos se hace necesario hacer uso ya sea de la distribución hipergeométrica o de la distribución binomial

## Ejercicio en Excel

### a) Media muestral y b) estimación del total poblacional

![image.png](MAS%20sin%20remplazo/image%206.png)

### c) Proporción muestral y total de familias con niños

![image.png](MAS%20sin%20remplazo/image%207.png)