# Diseño De Experimentos

## 1. ¿Qué es el diseño de experimentos?

El diseño de experimentos, conocido en inglés como *Design of Experime nts* (DOE), es una rama de la estadística que estudia cómo planificar, ejecutar y analizar experimentos científicos con el propósito de obtener información confiable sobre un fenómeno. Su objetivo principal es determinar cómo influyen una o varias condiciones sobre una variable de interés, distinguiendo, en la medida de lo posible, los efectos reales de esas condiciones de la variabilidad natural presente en las observaciones.

Para comprender su importancia, imaginemos que un investigador desea determinar qué fertilizante permite obtener un mayor crecimiento en una especie de planta. Una primera aproximación podría consistir en aplicar fertilizante a una planta y comparar su crecimiento con el de otra planta que no lo recibe. Sin embargo, las plantas podrían encontrarse en suelos con diferente fertilidad, recibir cantidades distintas de luz o agua, o presentar diferencias genéticas. Por tanto, si la primera planta crece más, no necesariamente significa que el fertilizante sea la causa de esa diferencia.

El diseño de experimentos surge precisamente de la necesidad de abordar este tipo de problemas de manera sistemática. No basta con realizar mediciones: es necesario establecer previamente qué se va a comparar, cuáles son las condiciones de estudio, cómo se asignarán los tratamientos, cuántas observaciones se realizarán y qué métodos estadísticos permitirán interpretar los resultados.

En consecuencia, el diseño experimental conecta tres componentes fundamentales del conocimiento científico: la formulación de preguntas, la planificación de la obtención de datos y el análisis matemático de la evidencia.

## 2. ¿Por qué surge la necesidad del diseño de experimentos?

La naturaleza presenta una característica que dificulta la investigación: los fenómenos no dependen habitualmente de una sola variable. El crecimiento de una planta, por ejemplo, puede depender de la cantidad de agua, la temperatura, la composición del suelo, la disponibilidad de nutrientes, la intensidad luminosa y las características genéticas del organismo.

Esta multiplicidad de factores crea un problema fundamental. Cuando dos grupos presentan resultados diferentes, ¿cómo puede determinarse si la diferencia se debe al tratamiento estudiado o a otras condiciones?

Históricamente, los científicos realizaban experimentos agrícolas y biológicos mucho antes de que existiera una teoría moderna del diseño experimental. La estación de investigación agrícola de Rothamsted, fundada en 1843, acumuló durante décadas información sobre cultivos, fertilizantes y suelos. Estos experimentos permitieron estudiar procesos agrícolas a largo plazo, pero también plantearon desafíos importantes relacionados con la variabilidad del terreno, las condiciones ambientales y la interpretación de los resultados.

El desarrollo de la estadística experimental moderna respondió a la necesidad de obtener conclusiones más sólidas a partir de experimentos donde no era posible controlar absolutamente todas las condiciones. [https://www.rothamsted.ac.uk/history-rothamsted-research](https://www.rothamsted.ac.uk/history-rothamsted-research)

El problema puede expresarse de la siguiente manera: si una variable observada depende tanto de los tratamientos aplicados como de factores que no se controlan completamente, resulta necesario construir procedimientos que permitan separar ambas fuentes de variación.

Por ejemplo, si un grupo de plantas recibe fertilizante A y otro recibe fertilizante B, una diferencia en el crecimiento podría deberse al fertilizante, pero también a que un grupo recibió más luz o fue cultivado en una zona del terreno con mayor humedad. Un experimento bien diseñado busca evitar que estas diferencias ajenas al tratamiento distorsionen la comparación.

De este modo, el diseño experimental no nace únicamente para realizar cálculos estadísticos, sino para resolver un problema previo: **cómo producir datos que permitan responder correctamente una pregunta científica**.

## 3. Origen histórico y desarrollo del diseño experimental moderno

Uno de los principales protagonistas del desarrollo moderno del diseño de experimentos fue Ronald Aylmer Fisher (1890-1962), matemático, estadístico y genetista británico. Fisher es reconocido por sus contribuciones a la genética y a la estadística, y su trabajo tuvo una influencia decisiva en la forma de planificar y analizar experimentos científicos.

En 1919 comenzó a trabajar en la estación experimental agrícola de Rothamsted, donde estudió grandes conjuntos de datos procedentes de experimentos agrícolas. Allí encontró una situación característica de la investigación científica: los investigadores tenían observaciones valiosas, pero necesitaban métodos más eficientes para separar los efectos de los tratamientos de la variación natural de los datos.

El terreno agrícola no es perfectamente uniforme. Dos parcelas pueden diferir en fertilidad, drenaje o humedad. De manera semejante, los organismos biológicos presentan diferencias individuales incluso cuando pertenecen a una misma especie y se encuentran bajo condiciones aparentemente similares.

A partir de estos problemas, Fisher contribuyó a desarrollar principios como la aleatorización, la replicación y el bloqueo, además de impulsar el análisis de varianza y los diseños factoriales. Sus trabajos de la década de 1920 y su libro *The Design of Experiments*, publicado en 1935, fueron fundamentales para consolidar esta disciplina. [https://pubmed.ncbi.nlm.nih.gov/25311906/](https://pubmed.ncbi.nlm.nih.gov/25311906/)

Es importante precisar que Fisher no inventó la experimentación científica ni fue la única persona involucrada en el desarrollo de la estadística. Existían antecedentes importantes, incluidos los trabajos agrícolas anteriores a su llegada a Rothamsted y las contribuciones de otros estadísticos. Su importancia consiste en haber desarrollado y articulado herramientas que permitieron planificar experimentos de forma rigurosa y analizar sus resultados con una base probabilística.

### Los tres principios fundamentales

**Aleatorización.** Consiste en asignar los tratamientos a las unidades experimentales mediante un procedimiento aleatorio. Por ejemplo, si se dispone de treinta plantas, no se deberían asignar necesariamente las primeras quince al fertilizante A y las últimas quince al fertilizante B. Una asignación aleatoria ayuda a evitar que las características de las plantas queden sistemáticamente asociadas a un tratamiento.

**Replicación.** Consiste en aplicar cada tratamiento a varias unidades experimentales independientes. Si se utiliza una sola planta por fertilizante, una diferencia individual podría confundirse con un efecto del tratamiento. Si se utilizan varias plantas, es posible estimar mejor la variabilidad entre unidades y evaluar la incertidumbre de la comparación.

**Bloqueo.** Consiste en agrupar unidades experimentales que comparten alguna característica relevante y realizar comparaciones dentro de esos grupos. Por ejemplo, si un terreno presenta zonas con diferentes condiciones de humedad, se pueden establecer bloques según la ubicación y distribuir los tratamientos dentro de cada bloque. De esta manera, parte de la variabilidad asociada al terreno puede controlarse estadísticamente.

Estos principios no eliminan toda incertidumbre, pero permiten construir experimentos más informativos y obtener estimaciones más confiables de los efectos estudiados.

## 4. Diferencia entre diseñar un experimento y construir un modelo

El diseño de experimentos y la modelación matemática están estrechamente relacionados, pero no son conceptos equivalentes.

La **modelación matemática** consiste en representar un fenómeno mediante ecuaciones, funciones o estructuras matemáticas. Un modelo permite describir relaciones entre variables, explicar comportamientos, estimar parámetros o realizar predicciones.

Por ejemplo, un investigador puede construir un modelo que relacione la temperatura con la velocidad de crecimiento de una bacteria. Ese modelo podría desarrollarse utilizando datos históricos, observaciones de campo o mediciones obtenidas mediante un experimento.

El **diseño de experimentos**, en cambio, se ocupa principalmente de planificar cómo se obtendrán los datos necesarios para responder una pregunta. Decide qué condiciones se modificarán, cuáles se mantendrán controladas, qué unidades recibirán cada tratamiento y cuántas observaciones serán necesarias.

La diferencia se puede resumir mediante dos preguntas:

- Modelación: ¿qué relación matemática describe o representa el fenómeno?
- Diseño experimental: ¿cómo debemos organizar el estudio para obtener datos que permitan investigar esa relación?

Por ejemplo, supongamos que se desea estudiar el efecto de la temperatura sobre el crecimiento de una bacteria.

Un modelo posible sería:

$$
Y_i=\beta_0+\beta_1X_i+\varepsilon_i
$$

En esta expresión, $Y_i$ representa el crecimiento observado, $X_i$ la temperatura, $\beta_0$ el intercepto, $\beta_1$ la pendiente y $\varepsilon_i$ el error aleatorio.

Sin embargo, la ecuación por sí sola no determina cómo se realizará el estudio. El investigador todavía debe decidir qué temperaturas utilizará, cuántas muestras analizará en cada temperatura, cómo distribuirá las muestras y qué condiciones mantendrá constantes.

Estas decisiones corresponden al diseño experimental. Después de obtener los datos, el modelo puede ajustarse para estimar los parámetros y analizar los resultados.

También es importante reconocer que un modelo puede construirse con datos observacionales, sin intervención experimental. En ese caso, las relaciones encontradas no necesariamente permiten establecer causalidad. Un experimento bien diseñado, cuando es viable y ético, puede aportar evidencia más sólida sobre el efecto de una intervención, especialmente si los tratamientos se asignan aleatoriamente.

En síntesis, el diseño de experimentos organiza la obtención de la evidencia y la modelación proporciona una representación matemática de las relaciones que se desean estudiar. Ambos procesos se complementan.

## 5.  modelo estadístico

Para comprender cómo se construyen las fórmulas del diseño experimental, es necesario comenzar por una idea sencilla: una medición observada contiene tanto el comportamiento que queremos estudiar como una parte de variación que no podemos explicar completamente.

Supongamos que se mide la altura de varias plantas sometidas a un mismo tratamiento. Aunque todas reciban la misma cantidad de fertilizante, probablemente no tendrán exactamente la misma altura. Algunas crecerán más y otras menos debido a diferencias biológicas, pequeñas variaciones ambientales y errores de medición.

Una forma de representar esta situación consiste en escribir:

$$
Y_i=\mu+\varepsilon_i
$$

Donde:

- $Y_i$ es la observación correspondiente a la unidad experimental $i$.
- $\mu$ es la media poblacional o el valor promedio que se pretende estimar bajo las condiciones estudiadas.
- $\varepsilon_i$ representa la desviación aleatoria de la observación respecto a ese valor medio.

Esta ecuación constituye una de las ideas básicas de los modelos estadísticos. No significa que el error sea necesariamente una equivocación del investigador: el término representa la variación que el modelo no explica.

En un modelo de tratamientos, la expresión puede ampliarse:

$$
Y_{ij}=\mu+\tau_i+\varepsilon_{ij}
$$

Aquí, $\tau_i$ representa el efecto asociado al tratamiento $i$, mientras que $\varepsilon_{ij}$ corresponde a la variación de la observación $j$ dentro de ese tratamiento.

Esta formulación introduce una distinción esencial: las diferencias observadas pueden contener una parte sistemática, asociada a los tratamientos, y una parte aleatoria, relacionada con las diferencias individuales y otras fuentes de variabilidad.

En los modelos clásicos se suelen establecer restricciones para identificar los parámetros. Por ejemplo, en un modelo de un factor se puede utilizar la condición:

$$
\sum_{i=1}^{a}\tau_i=0
$$

Bajo esta convención, $\mu$ representa la media general y los efectos $\tau_i$ expresan desviaciones respecto a ella.

La forma exacta del modelo depende del experimento, pero la lógica es la misma: construir una expresión que separe el comportamiento general, los efectos de interés y la variabilidad no explicada.

## 6. ¿Cómo se conecta el diseño experimental con la regresión lineal?

La regresión lineal proporciona una base matemática importante para comprender muchos diseños experimentales.

En una regresión lineal simple, se representa una variable de respuesta $Y$ mediante una relación con una variable explicativa $X$:

$$
Y_i=\beta_0+\beta_1X_i+\varepsilon_i
$$

El objetivo es estimar los parámetros $\beta_0$ y $\beta_1$ a partir de los datos.

El procedimiento clásico de mínimos cuadrados elige los valores de los parámetros que minimizan la suma de los cuadrados de los residuos:

$$
SSE=\sum_{i=1}^{n}(Y_i-\widehat{Y}_i)^2
$$

El residuo es la diferencia entre el valor observado y el valor estimado por el modelo:

$$
e_i=Y_i-\widehat{Y}_i
$$

Al elevar estas diferencias al cuadrado y sumarlas, se obtiene una medida de la variación que el modelo no logra explicar.

Esta idea también aparece en el diseño experimental. La diferencia consiste en que las variables explicativas pueden representar tratamientos, niveles de factores, bloques y combinaciones de factores, en lugar de representar exclusivamente variables numéricas continuas.

Por ejemplo, para estudiar dos fertilizantes, se puede representar la aplicación de cada uno mediante variables indicadoras. Si $X_i=0$ identifica al fertilizante A y $X_i=1$ identifica al fertilizante B, el modelo:

$$
Y_i = \beta_0 + \beta_1 X_i + \varepsilon_i
$$

puede interpretarse como una comparación entre dos medias.

Con esta codificación, $\beta_0$ representa la media del grupo A y $\beta_1$ representa la diferencia entre la media del grupo B y la media del grupo A. Por tanto, la media estimada del grupo B es $\beta_0 + \beta_1$.

Esta equivalencia demuestra que los modelos utilizados en experimentación pueden entenderse como modelos lineales que incorporan variables indicadoras para representar factores categóricos.

Cuando existen varios tratamientos o factores, se construye una matriz de diseño que codifica las condiciones experimentales. La estructura matemática permite estimar los efectos y comparar modelos mediante sus sumas de cuadrados.

Por eso, el paso de la regresión lineal al análisis de varianza y posteriormente a los diseños factoriales no constituye un salto arbitrario: se trata de una ampliación de las herramientas del modelo lineal

[Dise**ño Factorial**](https://app.notion.com/p/Dise-o-Factorial-3f6f5d16cacb800a946dcd2c3f97ad8b?pvs=21)