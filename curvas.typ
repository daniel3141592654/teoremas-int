#import "template.typ": *
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Ajuste de curvas",
  authors: (
    "Semicircle Daniel",
  ),
  date: "28 de mayo, 2026",
)

= Polinomial

Para relaciones no lineales, tenemos las siguientes:

+ $ln y = ln alpha_(1) + beta_1 x$
+ $log y = beta_2 log x + log alpha_2$


Usamos el modelo linealizado, que lo conseguimos transformando al usar la función
de *logaritmo*.

=== Ejemplo
Tenemos la linearización de $log y = beta log x + alpha$:

#let table1 = ```md

| $x$ | $y$ | $\log x$ | $\log y$ |
| --: | --: | -------: | -------: |
|   1 | 0.5 | 0.000    | -0.301   |
|   2 | 1.7 | 0.301    |  0.226   |
|   3 | 3.4 | 0.477    |  0.534   |
|   4 | 5.7 | 0.602    |  0.753   |
|   5 | 8.4 | 0.699    |  0.922   |
```

#cmarker.render(table1, math: mitex)

Usamos mínimos cuadrados para calcular la pendiente $a_1$ y el intercepto $a_0$:

$
  cases(
    a_1 = (n sum x_i y_i - sum x_i sum y_i)/(n sum x_i^2 - (sum x_i )^2 ),
    a_0 = dash(y) - a_1 dash(x)
  )
  /* No olvidar que acá los promedios son con el dash!!! */
$

= Runge-Kutta de orden 4

El método clásico de Runge-Kutta consiste en un cálculo con el uso de 4 constantes definidas como sigue.

$
  y_(i+1) = y_i + 1/6 ( k_1 + 2 k_2 + 2 k_3 + k_4 ) h
$

$
  cases(
    k_1 = f(x_i, y_i),
    k_2 = f( x_i + 1/2 h, y_i + 1/2 k_1 h ),
    k_3 = f( x_i + 1/2 h, y_i + 1/2 k_2 h),
    k_4 = f( x_i + h, y_i + k_3 h)
  )
$
