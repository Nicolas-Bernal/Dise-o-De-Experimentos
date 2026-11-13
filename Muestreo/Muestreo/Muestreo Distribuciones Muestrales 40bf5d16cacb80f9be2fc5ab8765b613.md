# Muestreo Distribuciones Muestrales

La distribución de todas las estimaciones de un parámetro basadas en todas las
muestras posibles que pueden ser generadas por un plan muestral se denomina
distribución muestral del estimador

No todas las muestras posibles tienen la misma probabilidad de selección, depende
del plan de muestreo que se aplique.

- Puede ocurrir que dos estimaciones pueden coincidir, es decir, muestras con
elementos distintos que sin embargo toman valores iguales.
- El número máximo de estimaciones distintas (valores diferentes del estimador)
será igual al número de muestras diferentes.
- Las principales características de la distribución de un estimador, en forma
similar a las características de una población finita, se pueden definir haciendo
uso de la teoría estadística

Definición. La media de la distribución de un estimador 𝜃, se define como

$$
E[\hat{\theta}] = \sum_{i=1}^{v} \hat{\theta}_i \pi_i
$$

donde:

- 𝑣 = número total de valores distintos tomados por el estimador 𝜃
- 𝑖 = i-ésima estimación diferente del parámetro 𝜃.
- 𝜋𝑖 = probabilidad que el estimador tome el valor 𝜃𝑖. Esta probabilidad es igual a la
frecuencia relativa de las estimaciones por tratarse de una variable discreta.

Como nos limitamos a poblaciones finitas, el número posible de muestras a seleccionar
es finito, por tanto el número posible de valores del estimador también es finito,
originándose, una distribución de probabilidad discreta.

Definición. La varianza de la distribución de un estimador 𝜃෠, está dada por.

$$
\mathrm{Var}(\hat{\theta}) = \sum_{i=1}^{v} (\hat{\theta}_i - \mathrm{E}(\hat{\theta}))^2 \pi_i
$$

Definición. La desviación estándar de la distribución de un estimador 𝜃, se
denomina frecuentemente error estándar de estimación y se define

$$
\mathrm{E}(\hat{\theta}) = \mathrm{Var}(\hat{\theta})
$$

Definición. El coeficiente de variación para un estimador 𝜃, está dado por.

$$
\mathrm{CV}(\hat{\theta}) = \frac{\mathrm{EE}(\hat{\theta})}{\mathrm{E}(\hat{\theta})}
$$

El coeficiente de variación para un estimador mide la variabilidad muestral de la
estimación relativa al parámetro estimado.

Definición. El error cuadrado medio de un estimador es una medida de dispersión
con respecto al verdadero parámetro poblacional y se obtiene como

$$
\mathrm{ECM}(\hat{\theta}) = \sum_{i=1}^{v} (\hat{\theta}_i - \theta)^2 \pi_i
$$

Definición. El sesgo de un estimador 𝜃෠, 𝐵 𝜃෠ , se define como la diferencia entre la
media de la distribución muestral y el valor verdadero del parámetro desconocido, es
decir

$$
\mathrm{B}(\hat{\theta}) = \mathrm{E}(\hat{\theta}) - \theta
$$

Un estimador de denomina insesgado si el valor promedio de las estimaciones
obtenidas para todas las muestras posibles es igual al verdadero parámetro
poblacional