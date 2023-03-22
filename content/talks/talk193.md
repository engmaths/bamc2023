---
title: "Neural variance reduction for stochastic differential equations"
bookToc: false
---

# Neural variance reduction for stochastic differential equations

**Piers Hinds**

Poster session



## Abstract

Numerical integration of stochastic differential equations (SDEs) together with the Monte Carlo (MC) method can be used to solve the related parabolic partial differential equation (PDE). This is a particularly useful strategy when the PDE needs only to be solved at one point and/or the dimension of the PDE problem is large, causing traditional grid-based methods to grow too computationally expensive. Such situations often arise in mathematical finance, when one wants to compute the price of a financial option. In these cases, methods of variance reduction play an important role in minimizing the error of the MC technique, thus reducing computational demands on the approximation of option prices. To this end, we propose the use of neural SDEs, with control variates parameterized by neural networks, in order to learn approximately optimal control variates and hence reduce variance as trajectories of the SDEs are being simulated. We consider SDEs driven by Brownian motion and, more generally, by Lévy processes including those with infinite activity. For the latter case, we prove optimality conditions for the variance reduction. Several numerical examples from option pricing are presented.


