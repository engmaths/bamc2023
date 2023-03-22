---
title: "Generalized robust tracking problem: differential game regularization solution"
bookToc: false
---

# Generalized robust tracking problem: differential game regularization solution

**Vladimir Turetsky, Valery Y Glizer**

Tuesday at 11:10 AM in 4Q04.

Part of the *[Complex systems and control]({{< relref "/sessions/session28" >}})* session.

## Abstract

A robust tracking problem with generalized tracking functional is considered. In this problem, the objective is to drive the system close to prescribed discrete points at prescribed time moments and to prescribed continuous curves at prescribed time intervals, robustly with respect to the L2-bounded disturbance. Such problems arise in various practical applications including robotics and guidance. This objective yields the tracking functional consisting of two terms. The first term is the sum of weighted squared discrepancies between the system states and some given points at a given discrete set of time moments. The second term is the sum of integrals of such discrepancies over a given set of time intervals. This functional is represented by a Lebesgue integral of the discrepancy over a measure that has both discrete and distributed parts.
The tracking problem is embedded into a linear-quadratic differential game which cost does not contain the minimizer’s control effort penalty term. This game is singular, because it cannot be solved either by the Isaacs’s MinMax principle or by the Bellman-Isaacs equation method. For this singular game, the notion of the minimizing sequence of state-feedback controls (instead of the optimal state-feedback control) is proposed. The game is regularized by introducing an auxiliary game where the penalty coefficient for the minimizing player's control expenditure is a small value. This game is a zero-sum differential game with a cheap control of the minimizing player.
By the proper state transformation, the cheap control game is converted to a reduced order differential game which is also a cheap control game. Its solution is based on the solution of the terminal-value problem for the impulsive matrix Riccati differential equation. It is established that the minimizer's optimal state-feedback control in the cheap control game constitutes the minimizing sequence of state-feedback controls in the singular game for a penalty coefficient tending to zero. Numerical illustrative example is presented. 



