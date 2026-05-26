#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Teoremas integrales",
  authors: (
    "danielpi",
  ),
  date: "14 de mayo, 2026",
)


// Here I put some important equations I used...

#let hatI = $hat(bold(i))$
#let hatJ = $hat(bold(j))$
#let hatK = $hat(bold(k))$


#let ijk(a, b, c) = $#a space hatI #b space hatJ #c space hatK$
#let bf(x) = $bold(upright(#x))$
#let pdv(x, y) = $partial_(#y) space #x$
#let cross(x, y) = {
  $mat(
    #(hatI, hatJ, hatK),
    #x,
    #y,
    delim: "|"
  )$
}

= Integrales de superficie

Una superficie $S$ es suave si puede ser representada
por una ecuación vectorial dada por parámetros:

$
  r(u,v) = vec(x(u,v), y(u,v), z(u,v))
$ <def1>

que se define en $D$ el dominio del parámetro.

Vemos que en la @def1 esto es consistente con una
*combinación lineal*.

Se define la integral de $f$ sobre la superficie
con la región $D$ como

$
  limits(integral.double)_S
  f (x,y,z) dif S =
  limits(integral.double)_D
  f [ r( u,v ) ] dot abs(r_u times r_v) dif A
$

En donde, definimos las derivadas direccionales
respecto a cada uno de los parámetros. Estos parámetros
pueden verse también como coordenadas específicas a
algunos sistemas o formas.

=== Ejemplo
Considere la integración de la superficie de una
esfera unitaria descrita por la ecuación
$x^2 + y^2 + z^2 = 1$. Encuentre su integral de
superficie con la definición dada.



#box(
  [Primero tomamos las derivadas direccionales con
    respecto a la parametrización de la esfera, la cual
    es de la forma:

    $
      x = a sin phi cos theta \
      y = a sin phi sin theta\
      z = a cos phi
    $

  ],

  stroke: black,
  inset: 8pt,
)

Calculamos las derivadas direccionales, las cuales
son:

$
  cases(
    r_phi =
    vec(
      cos phi cos theta,
      cos phi sin theta,
      -sin phi
    ), r_theta =
    vec(
      -sin phi sin theta,
      sin phi cos theta,
      0
    )
    ,
    delim: "{"
  )
$

Calculamos posteriormente el módulo del producto
vectorial para nuestras derivadas direccionales.

== Teorema

Cualquier superficie $S$ con ecuación $z = g(x,y)$ se
puede considerar como una superficie parametrizada con
las ecuaciones paramétricas de

$
  x = x, \ y = y, \ z = g(x,y) \
  "Donde " D = "Dom" f
$

Así se tiene que la integral de superficie puede darse
como la siguiente parametrización:

$
  limits(integral.double)_S f (x,y,z) dif S
  = limits(integral.double)_D f (x,y)
  sqrt([partial_x g]^2 + [partial_y g]^2 + 1)
  quad dif A
$

=== Ejemplo
Evalúe $limits(integral.double)_S y dif S$, donde
$S$ es la superficie $z = x + y^2$, con
$0 <= x <= 1$ y...

== Teorema. Integral de una superficie a trozos.

...

=== Ejemplo
Evalúe $limits(integral.double)_S z dif S$ que es la
región de un cilindro unitario, que limita con un plano
$z = 1+x$.

El plano puede ser reescrito como: $1+cos theta$ y
los parámetros son:

$ cases(x = cos theta, y = sin theta, z = z) $

Sacamos las derivadas direccionales $r_theta,r_z$.

$
  cases(
    r_theta = vec(
      -sin theta,
      cos theta,
      0
    ),
    r_z = vec(
      0,
      0,
      1
    )
  )
$

== Teorema. Campo vectorial.

Para una función vectorial definida en $RR^3$ como
$bold("F") = ijk(x, +y, +z)$, se puede encontrar la
integral de superficie, determinada con la
expresión:

$
  limits(integral.double)_S bf(F) dot bf(n) dif S =
  limits(integral.double)_D
  bf(F)[r(u,v)] dot (bf(r)_u times bf(r)_v ) dif A
$

=== Ejemplo
Calcule la integral de superficie $limits(integral.double)_S bf(F) dot
bf(n) space dif S$, donde $bf(F) = ijk(-y, +x, +0)$ y $S$ es la superficie
dada por la parametrización $bf(r) (u,v) = ijk(u, +(v^2-u), +(u+v))$, con
los parámetros definidos en $0 <= u <= 3$ y $0<= v <= 4$.

#box(
  [
    Dados los parámetros, el primer paso prudente sería calcular las
    derivadas $bf(r)_u, bf(r)_v$ que nos dan las direcciones normales a la
    parametrización.

    $
      cases(
        bf(r)_u = ijk(pdv(x, u), +pdv(y, u), +pdv(z, u)),
        bf(r)_v = ijk(pdv(x, v), +pdv(y, v), +pdv(z, v))
      )
    $

    lo que como resultados es $bf(r)_u = ijk(1, -1, +1)$ y $bf(r)_v=
    ijk(0, +2 v, -1)$. Con esto obtenemos el producto vectorial $bf(r)_u
    times bf(r)_v$, definido con el determinante.

    #let ru = (1, -1, 1)
    #let rv = (0, $2v$, 1)

    $
      bf(r)_u times bf(r)_v = cross(ru, rv) \
      = ijk(
        [(-1)(1) - (1)(2v)],
        -[(1)(1) ],
        +[(1)(2v) ]
      )
    $

    $
      bf(r)_u times bf(r)_v =
      ijk(
        -(1+2v),
        -1,
        +2v
      )
    $

    Posteriormente toca evaluar el campo vectorial en
    la parametrización del vector.

    $
      bf(F) = ijk(-y, +x, +0) \
      cases(x = u, y = v^2 - u) \
      |-> bf(F) (u,v) = ijk(
        u-v^2,
        +u,
        +0
      )
    $

    Obtenemos con esto el producto de $bf(F)(u,v)$ y de
    el producto vectorial de los vectores normales.

  ],
  stroke: black,
  inset: 8pt,
)


#box(
  [
    $
      bf(F) (u,v) dot ( bf(r)_u times bf(r)_v ) =
      vec(u-v^2, u, 0) dot vec(-1-2v, -1, 2v) \
      = -(u-v^2)(2v+1) - u \
      = (v^2 - u)2v + (v^2 - u) - u \ ...
    $

    $ = 2 v^3 - 2 u v + v^2 - 2 u $

    Al final, esto es lo que se integra con los límites de los
    parámetros establecidos.

    $
      limits(integral)_0^4 limits(integral)_0^3
      2 v^3 - 2 u v + v^2 - 2 u dif u dif v
    $

    Por conveniencia, usando una calculadora simbólica, tenemos que
    el resultado final es de:

    $
      therefore limits(integral.double)_S bf(F) dot bf(n) dif S = 340
    $
  ],
  stroke: black,
  inset: 8pt,
)

= Teorema de la divergencia

De la misma forma, puede reescribirse
la integral de superficie si es que
conocemos la divergencia de un
campo vectorial y podemos pasar
de una superficie frontera
$S$ a su volumen contenido, el
cual puede o no ser descrito por una
frontera continua, y es denotado
por la región $E$.

$
  limits(integral.double)_(S)
  bf(F) dot dif bf(S) =
  limits(integral.triple)_(E)
  nabla dot bf(F) dif V
$

= Teorema de Stokes: rotacional

El teorema de Stokes puede considerarse como
una versión superior al t. de Green. El t.
de Stokes relaciona una integral de superficie
$S$ con una integral de línea alrededor de la
curva de frontera de $S$. Es una frontera $C$.

$
  limits(integral.cont bf(F))_(C) dot T dif C =
  limits(integral.double)_(S)
  (nabla times bf(F)) dot hat(n) dif S
$ <stokes>

Vemos que en la @stokes el asunto es la necesidad de
integrar el flujo normal a una curva frontera de
una superficie suave $S$ cuya frontera
$C = partial S$.

// #lorem(60)


/*
== In this paper
#lorem(20)

=== Contributions
#lorem(40)

= Related Work
#lorem(500)
 */
