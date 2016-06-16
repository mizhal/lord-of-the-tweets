# Algoritmos

Reconocimiento de algoritmos interesantes para aprovechar la información.

## Medidas de influencia en Domains

### Algoritmo HITS

[Algoritmo HITS](https://es.wikipedia.org/wiki/Algoritmo_HITS)

Presenta una manera de calcular una medida de autoridad y otra de "centralidad" para páginas web. 

Autoridad sería la capacidad de generar contenido propio interesante (en nuestro contexto siempre en un Domain).

Centralidad es la capacidad de "enlazar" contenido interesante, una especie de "Medida de Curator".

Aplicado a nuestro problema de twitter, se redefinen los términos de página web a Profile y el grafo de enlaces pasa a ser el grafo de TwitterTouchs. De momento no sé si puede ser interesante explotar algo del grafo de TwitterLinks.

El algoritmo parece sencillo.

La utilidad podría ser esta: Mediante analisis del texto (términos de dominios) se separarían un grupo muy pequeño de Profiles que tendrían mucha información y muy clara del dominio concreto (ya sean agregadores como RubyNews o Profiles que sean realmente muy coherentes en un tema determinado). Después podemos usarlos como semillas con el HITS para asignar la relevancia en el dominio a otros Profiles conectados con ellos.

## Determinacion de TwitterClusters

La idea es aprovechar tanto el grafo estático o declarado (TwitterLinks) como las interacciones (TwitterTouchs).

El mecanismo de clusterización puede realizarse mediante un proceso iterativo en el que los pesos de los arcos del grafo van "decayendo" o "aumentando" en funcion de ciertas propiedades de la estructura. Una vez terminado, se eliminan los arcos con poco peso de tal manera que solo los clusters queden conectados.

Esta estrategia parece mejor que usar valores fijos para los arcos. 

En las zonas centrales de los clusters los pesos serán probablemente altos, pero en las periferias de los clusters existen Profiles muy poco conectados con otros clusters, que quizás interactuan poco con el resto del Cluster central pero tienen alta dependencia de él.
Si se usan valores fijos y algún tipo de umbral para "eliminar" arcos, estos Profiles ocultos de los clusters no se harán visibles.

La estrategia debería normalizar el peso de los arcos de tal manera que reste relevancia a los nodos altamente conectados y suba la relevancia de los levemente conectados solo a uno o pocos clusters.