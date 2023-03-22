---
title: "Treatment Planning for Brachytherapy Radiation Problems"
bookToc: false
---

# Treatment Planning for Brachytherapy Radiation Problems

**Jennifer Power**

11:10 Tuesday in 3Q68.

Part of the *[Mathematical medicine]({{< relref "/sessions/session27" >}})* session.

## Abstract

Brachytherapy is a cancer treatment where radioactive seeds are surgically implanted directly onto the tumour and slowly emit radiation, killing the tumour from the inside. An essential aspect of the radiotherapy treatment process is the planning stage. Clinicians carefully create treatment plans to ensure the radiation is directed at the tumour, and not at the healthy tissue as if this is damaged it could cause further health complications. However, for brachytherapy, clinicians do not have a mechanism to develop treatment plans. My research seeks to solve this problem mathematically. The challenge lies in positioning the sources such that the tumour is exposed to the critical dose, but the healthy tissue is not exposed to excessive radiation. This problem is formulated as a PDE-constrained optimisation problem. The PDE constraint is given by a diffusion approximation to the Boltzmann transport equation. A prescribed dose is assigned to the tumour region such that when the objective function is minimised,  the dose in the tumour matches the prescribed dose and the dose outside of the tumour is minimised. This problem is solved numerically using a continuous Galerkin finite element method. 


