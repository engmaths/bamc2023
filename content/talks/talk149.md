---
title: "Structure-Exploiting Preconditioners for Data Assimilation"
bookToc: false
---

# Structure-Exploiting Preconditioners for Data Assimilation

**Jemima Tabeart, John W Pearson, Selime Gürol, Anthony Weaver**

11:30 Tuesday in 2Q48.

Part of the *[Advances in applied numerical linear algebra and its applications]({{< relref "/sessions/session22" >}})* session.

## Abstract

Correlation operators are used in data assimilation algorithms to weight the contribution of prior and observation information. Efficient implementation of these operators is therefore crucial for operational implementations. Diffusion-based correlation operators are popular in ocean data assimilation, but can require a large number of serial matrix-vector products. A parallel-in-time formulation removes this requirement, and offers the opportunity to exploit modern computer architectures. High quality preconditioners for the parallel-in-time approach are well-known, but impossible to apply in practice for the high-dimensional problems that occur in oceanography. In this talk we consider a nested preconditioning approach which retains many of the beneficial properties of the ideal analytic preconditioner while remaining affordable in terms of memory and computational resource.


