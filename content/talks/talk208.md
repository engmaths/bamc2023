---
title: "Data-Driven Mirror Descent with Input-Convex Neural Networks"
bookToc: false
---

# Data-Driven Mirror Descent with Input-Convex Neural Networks

**Subhadip Mukherjee, Hong Ye Tan, Junqi Tang, Andreas Hauptmann, Carola-Bibiane Schönlieb**

12:10 Tuesday in 2Q48.

Part of the *[Advances in applied numerical linear algebra and its applications]({{< relref "/sessions/session22" >}})* session.

## Abstract

Learning-to-optimize is an emerging framework that seeks to speed up the solution of certain optimization problems by leveraging training data. Learned optimization solvers have been shown to outperform classical optimization algorithms in terms of convergence speed, especially for convex problems. Many existing data-driven optimization methods are based on parameterizing the update step and learning the optimal parameters (typically scalars) from the available data. We propose a novel functional parameterization approach for learned convex optimization solvers based on the classical mirror descent (MD) algorithm. Specifically, we seek to learn the optimal Bregman distance in MD by modeling the underlying convex function using an input-convex neural network (ICNN). The parameters of the ICNN are learned by minimizing the target objective function evaluated at the MD iterate after a predetermined number of iterations. The inverse of the mirror map is modeled approximately using another neural network, as the exact inverse is intractable to compute. We derive regret bounds for the proposed learned mirror descent (LMD) approach with an approximate inverse mirror map and perform an extensive numerical evaluation on various convex problems such as image inpainting, denoising, and learning a support vector machine (SVM) classifier on fixed features.


