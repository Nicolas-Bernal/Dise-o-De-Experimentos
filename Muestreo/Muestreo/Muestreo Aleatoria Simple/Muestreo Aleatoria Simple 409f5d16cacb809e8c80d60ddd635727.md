# Muestreo Aleatoria Simple

## 📌 ¿Qué es el Muestreo Aleatorio Simple (MAS)?

El **Muestreo Aleatorio Simple** es el diseño de muestreo probabilístico más básico y fundamental. Consiste en extraer una muestra de tamaño $n$ de una población de tamaño $N$, de manera que **todas las muestras posibles de tamaño $n$ tengan exactamente la misma probabilidad de ser seleccionadas**.

## Características clave

- **Equiprobabilidad:** Cada elemento de la población tiene la misma probabilidad de inclusión en la muestra ($\frac{n}{N}$).
- **Independencia:** La selección de un individuo no afecta ni condiciona la probabilidad de selección de otro (especialmente en muestreo con reemplazo).
- **Tipos:**
    - *Con reemplazo:* Un elemento seleccionado puede volver a ser elegido en extracciones posteriores.
    - *Sin reemplazo:* Un elemento seleccionado no puede volver a ser elegido (es el más común en la práctica).

## 📊 Propiedades y Evaluación de Estimadores

Cuando estimamos un parámetro poblacional desconocido ($\theta$) a través de un estadístico o estimador muestral ($\hat{\theta}$), necesitamos medir qué tan bueno, preciso y confiable es ese estimador mediante los siguientes conceptos:

### 1. Estimador ($\hat{\theta}$) y su Distribución

El estimador es cualquier función de los datos de la muestra (como la media muestral $\bar{x}$ o la proporción $\hat{p}$) diseñada para aproximar el verdadero valor del parámetro poblacional ($\theta$).

### 2. Esperanza Matemática ($\operatorname{E}(\hat{\theta})$)

Representa el valor promedio que tomaría el estimador si repitiéramos el proceso de muestreo una y otra vez bajo las mismas condiciones.

$$
\operatorname{E}(\hat{\theta})=\sum_{i=1}^{v}\hat{\theta}_i\pi_i
$$

*(Donde $\hat{\theta}_i$ son los posibles valores del estimador y $\pi_i$ sus respectivas probabilidades). Si $\operatorname{E}(\hat{\theta})=\theta$, decimos que el estimador es **insesgado**.*

### 3. Sesgo ($\operatorname{B}(\hat{\theta})$)

Mide la diferencia sistemática entre el valor esperado del estimador y el verdadero valor del parámetro poblacional:

$$
\operatorname{B}(\hat{\theta})=\operatorname{E}(\hat{\theta})-\theta
$$

Idealmente, buscamos que el sesgo sea cero (estimadores insesgados).

### 4. Varianza del Estimador ($\operatorname{Var}(\hat{\theta})$)

Mide la dispersión o variabilidad de los valores del estimador entre las distintas muestras posibles:

$$
\operatorname{Var}(\hat{\theta})=\sum_{i=1}^{v}\left(\hat{\theta}_i-\operatorname{E}(\hat{\theta})\right)^2\pi_i
$$

Una varianza baja indica que las muestras tienden a dar resultados muy cercanos entre sí.

### 5. Error Estándar ($\operatorname{EE}$) y Coeficiente de Variación ($\operatorname{CV}$)

- **Error Estándar ($\operatorname{EE}$):** Es la raíz cuadrada de la varianza ($\sqrt{\operatorname{Var}(\hat{\theta})}$). Mide la precisión absoluta del estimador.
- **Coeficiente de Variación ($\operatorname{CV}$):** Mide la precisión relativa al tamaño de la estimación:

$$
\operatorname{CV}(\hat{\theta})=\frac{\operatorname{EE}(\hat{\theta})}{\operatorname{E}(\hat{\theta})}
$$

### 6. Error Cuadrático Medio ($\operatorname{ECM}$)

Es la medida definitiva de la calidad global de un estimador, ya que **combina tanto su variabilidad (precisión) como su sesgo (exactitud)**:

$$
\operatorname{ECM}(\hat{\theta})=\sum_{i=1}^{v}\left(\hat{\theta}_i-\theta\right)^2\pi_i
$$

*(Matemáticamente, también se demuestra que $\operatorname{ECM}(\hat{\theta})=\operatorname{Var}(\hat{\theta})+[\operatorname{B}(\hat{\theta})]^2$.)*

[MAS sin remplazo](Muestreo%20Aleatoria%20Simple/MAS%20sin%20remplazo%20e5ee3216775d435a8dd7bc9f36931196.md)

[Muestreo aleatorio simple con reemplazo (MAS)](Muestreo%20Aleatoria%20Simple/Muestreo%20aleatorio%20simple%20con%20reemplazo%20(MAS)%2040cf5d16cacb80e99834e05c013770b7.md)