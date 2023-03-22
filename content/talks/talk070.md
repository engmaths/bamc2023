---
title: "Supervised learning control of kinetic collective dynamics"
bookToc: false
---

# Supervised learning control of kinetic collective dynamics

**Sara Bicego, Dante Kalise, Giacomo Albi**

11:50 Wednesday in 2Q48.

Part of the *[Optimisation and control for nonlinear dynamics]({{< relref "/sessions/session43" >}})* session.

## Abstract

The modelling of multi agent systems (MAS) can be seen as the result of a suitable combination of with-in population interactions and external influences. We address how to successfully condition high dimensional MAS towards a designed cooperative goal (e.g. consensus) by means of dynamic optimization.
The problem reads as the minimization of a cost functional subject to individual-based dynamics; thus, its solution easily becomes unfeasible as the number of agents grows. A natural way of circumventing this difficulty is by passing from a microscopic viewpoint to a macroscopic one, that is from an agent-to-agent description of the trajectories to the evolution of the system represented as a density in space and time.

Although mean field optimal control problems are designed to be independent of the number of agents, they are feasible to solve only for moderate intrinsic dimensions of the agents' space. For this reason, we propose a procedure for approaching the solution from suboptimality by means of a Boltzmann scheme. We consider the quasi-invariant limit of binary interactions as approximation of the mean field PDE governing the dynamics of the agents’ distribution. This considerably tackles down the numerical complexity of the original problem, which is now reduced to a collection of many 2-agents sub-systems. The need for an efficient solver of the binary OCP motivates the use of Neural Networks.


