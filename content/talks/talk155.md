---
title: "LinearParareal: accelerating the time-parallel simulation of linear IVPs"
bookToc: false
---

# LinearParareal: accelerating the time-parallel simulation of linear IVPs

**Kamran Pentland, M Tamborrino, T J Sullivan, J Buchanan, L C Appel**

Poster session



## Abstract

Parareal is a well-studied time-parallel algorithm designed to integrate initial value problems (IVPs) by iteratively combining solutions from cheap (coarse) and expensive (fine) numerical integrators using a predictor-corrector (PC) scheme. To obtain high parallel speedup, a solution must be found in as few iterations as possible, something that Parareal struggles to do for many IVPs. This is because it uses each fine and coarse solution only once before discarding it. In this poster, we present LinearParareal, an easy-to-use time-parallel algorithm that instead uses all of the solution data to construct a linear operator which models the difference between the fine and coarse solutions within the PC scheme. By using this operator, we demonstrate that one can simulate (in parallel) a linear IVP in one iteration, obtaining parallel efficiencies in excess of 80% (whereas Parareal rarely achieves 50%). In addition, solutions are shown to be accurate to (almost) within machine precision of the serially obtained fine solution, i.e. the high accuracy IVP solution. 




