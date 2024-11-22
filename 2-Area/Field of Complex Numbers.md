---
tags:
  - 𝔉-note
  - 𝔑-type-theory
  - 𝔗-analysis
  - 𝔗-algebra
---
# Definition (Complex Numbers) ^cb8f19

Colloquially, the data for a complex number is a pair of real numbers. 

$$
& mono("type") CC\
& into_CC : RR times RR -> CC\
$$

Of course, we get an inverse operation: 

$$
from_CC : {x:CC} :: match x space {into_CC (y) => y}
$$

We also define how to extract the real and imaginary part of a complex number. 

$$
& mono("re")_CC:= {x: CC}:: x map from_CC map mono("fst")\
& mono("im")_CC:= {x: CC}:: x map from_CC map mono("snd")
$$

And the complex conjugate: 

$$
(overline(@))_CC &:= {x : CC} :: (mono("re") x,- mono("im") x) map into_CC
$$

# Definition (Complex Operations)

Continue from the [[#^cb8f19|last section]] , we define more operations on complex numbers. 

We define the operation of multiplication and addition on $CC$

$$
#let xi = $x_(mono("i"))$
#let xr = $x_(mono("r"))$
#let yi = $y_(mono("i"))$
#let yr = $y_(mono("r"))$
(dot)_CC := & {x,y:CC} :: \
& mlet (xr,xi) := x map from_CC\
& mlet (yr,yi) := y map from_CC\
& (xr dot yr - xi dot yi, xi dot yr + xr dot yi) map into_CC\
\
(+)_CC := & {x,y:CC} :: \
& mlet (xr,xi) := x map from_CC\
& mlet (yr,yi) := y map from_CC\
& (xr + yr, xi + yi) map into_CC
$$

We define the operation of division and subtraction on $CC$

$$
#let xi = $x_(mono("i"))$
#let xr = $x_(mono("r"))$
#let yi = $y_(mono("i"))$
#let yr = $y_(mono("r"))$
(slash)_CC &:= {x, y : CC} :: \
    &mlet (xr, xi) := x map from_CC\
    &mlet (yr, yi) := y map from_CC\
    &match (yr, yi) space { (0,0) => mono("return") null }\
    &mlet z := (xr dot yr + xi dot yi, xi dot yr - xr dot yi) map into_CC\
    &into_CC (((yr^2 + yi^2)^(-1/2), 0)) dot z map some\
\
(-)_CC &:= {x,y:CC} :: \
    & mlet (xr,xi) := x map from_CC\
    & mlet (yr,yi) := y map from_CC\
    & (xr - yr, xi - yi) map into_CC\
\
(-@)_CC &:= {x : CC} :: \
    & mlet (xr,xi) := x map from_CC\
    & (-xr, -xi) map into_CC
$$

Also a very special thing: 

$$
|@|_CC := {x: CC} :: mlet (x_(mono("r")),x_(mono("i"))) := x map from_CC ; (x_(mono("r"))^2 + x_(mono("i"))^2)^(1/2)\
$$

# Exercise (Complex Plane)

This is an exercise set imported from [@Book:Complex-Analysis-Stein] . 

> The geometric interpretation of $p(z_1,z_2)$ where $p : forall {z_1, z_2 : CC} :: forall {z} :: |z - z_1| equiv |z - z_2|$
> ::::::
> It represents points that have equal distance to $z_1$ and $z_2$
> Therefore, it is a straight line on complex plane, vertical to the line passing $z_1$ and $z_2$ . 
> And passing $(z_1 + z_2) slash 2$ . 

> The geometric interpretation of $p: forall {z: CC} :: 1 slash z = overline(z) map some$
> ::::::
> It represents points around a circle. 

> The geometric interpretation of $p : forall {z: CC} :: mono("re")(z) = 3$
> ::::::
> It represents a straight line parallel to the imaginary direction. 
> And passing $into_CC (3, 0)$

> The geometric interpretation of $p(r)$, where $p: forall {r: RR} :: forall {z: CC} :: mono("re")(z) >= r$
> ::::::
> The right half plane whose boundary is vertical to the real direction and start from $r$ . 

> The geometric interpretation of $p(a,b,r)$, where $p: forall {a,b: CC} :: forall {r: RR} :: forall {z: CC} :: mono("re")(a dot z + b) >= r$
> ::::::
> It represents a half plane in the direction towards $overline(a)$ direction (boundary vertical to that). 
> It passes $a_(mono(r)) dot z_(mono(r)) - a_(mono(i)) dot z_(mono(i)) + b_(mono(r)) >= r$ . 

