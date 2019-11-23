# Trabajo Final R

_Autor:_

>Pavel Ramirez

<script>
   $(document).ready(function() {
     $head = $('#header');
     $head.prepend('<img src=\"Recursos/logoEAE.png\" style=\"float: right;width: 300px;\"/>')
   });
</script>


## Versión básica

Entrega final de la asignatura R del Máster en Big Data & Analytics, impartida por el profesor Carlos J. Gil Bellosta

### Contenido del documento

El proyecto consta de tres partes:

Comparativa de dos fuentes de recursos de Regex:
RPubs
Riptutorial
Comparativa de dos fuentes de recursos de Markdown:
RStudio
R4ds
Estudio descriptivo del dataset contenido en R ChickWeight



El contenido mínimo del documento en su versión básica es el siguiente:

1. Una sección en el que indiquen dos páginas con recursos sobre expresiones regulares discutidas (cuál es mejor, cuál es peor, por qué).
1. Una sección en la que se indiquen dos páginas con recursos sobre markdown y discutirlas como antes.
1. Una sección en la que se carguen, estudien, representen gráficamente unos datos de tu elección. No se trata de hacer un análisis estadístico (está fuera de alcance) pero sí un estudio descriptivo mínimo de los aspectos más relevantes de los datos. Este estudio tiene que contener, al menos:

    1. Un gráfico generado con `ggplot2`.
    2. Una tabla.

Y finalmente, por supuesto, el documento tiene que tener su tabla de contenidos y una estructura y texto... propia de un documento similar a todos los documentos normales que circulan por el mundo. 

*Importante:* No muestres el código de R en el documento salvo que por algún motivo lo consideres relevante y me puedas convencer de ello.


## Versión avanzada


Además de la versión básica (o alternativamente a ella, en algunos casos) se valorarán por encima del 50% añadidos como los siguientes:

1. Presentar un repo en GitHub en lugar de un `.zip` (10%) (Si optas por usar GitHub, no tienes que subir una carpeta comprimida: basta con que me hagas llegar la URL del proyecto, que tiene que contener esencialmente las cosas que arriba indico que debería contener el fichero comprimido).
1. Usar un gráfico de ggplot2 que use facetas (5%)
1. Usar algún tema de `ggplot2` distinto del básico (5%)
1. Usar gráficos dinámicos (basados o no en `ggplot2`) (10%)
1. Usar algún paquete específico para crear tablas más atractivas visualmente que las que se usan por defecto (10%)
1. Usar datos obtenidos a través de alguna API, haciendo _web scraping_ o similar (+15%)
1. Usar algún tipo de formato o tema especial (particularmente si lo adaptas tú) de Rmarkdown (5%)
