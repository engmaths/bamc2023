---
title: "Extremization to Fine Tune Physics Informed Neural Networks to Solve Boundary Value Problems."
bookToc: false
---

# Extremization to Fine Tune Physics Informed Neural Networks to Solve Boundary Value Problems.

**Abhiram Anand Thiruthummal, Sergiy Shelyag, Eun-jin Kim**

15:10 Monday in 4Q04.

Part of the *[Numerical methods]({{< relref "/sessions/session16" >}})* session.

## Abstract

Differential equations are used to mathematically model various phenomena in the fields of engineering, physics, chemistry, economics and biology. There exist several numerical methods to find the solutions to differential equations (DEs). Traditionally, such methods rely on discretization and numerical approximation of the derivatives involved in the DEs. Recently, however, a novel family of numerical methods have emerged leveraging artificial neural networks to solve DEs, known as Physics Informed Neural Networks (PINNs).
Here we propose a novel method for fast and accurate training of PINNs to find solutions to boundary value problems (BVPs). By combining the training methods of two different types of neural networks, deep neural networks (DNNs) and Extreme Learning Machines (ELMs), we develop a model which has the learning capacity of DNNs and accuracy of ELMs. We showcase the superiority of our proposed method by solving several DEs. The examples we consider include a stiff coupled ODE system where traditional numerical methods fail, Kovasznay flow and Taylor-Green vortex solutions to incompressible Navier-Stokes equations and pure advection solution of 1+1 D compressible Euler equation. 
The imposition of boundary conditions (BCs) in PINNs is a non-trivial problem. Here we use the Theory of Functional Connections (TFC) to exactly impose BCs on PINNs. We propose a modification to the TFC framework named Reduced TFC and show a significant improvement in the training and inference time of PINNs compared to BCs imposed using TFC. Furthermore, Reduced TFC is shown to be able to generalize to more complex boundary geometries which is not possible with TFC. We also introduce a method of applying BCs at infinity for BVPs and numerically solve the pure advection in 1+1 D Euler equations using these BCs.



