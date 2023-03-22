---
title: "Quantifying Cytoskeletal Dynamics and Remodeling from Live-imaging Microscopy Data"
bookToc: false
---

# Quantifying Cytoskeletal Dynamics and Remodeling from Live-imaging Microscopy Data

**Kairui Li**

14:30 Monday in 3Q68.

Part of the *[Cell and tissue mechanics]({{< relref "/sessions/session15" >}})* session.

## Abstract

The shape of biological cells emerges from dynamic remodeling of the cell’s internal scaffolding, the cytoskeleton. Hence, correct cytoskeletal regulation is crucial for the control of cell behaviour, such as cell division and migration. A main component of the cytoskeleton is actin. Interlinked actin filaments span the body of the cell and contribute to a cell’s stiffness. The molecular motor myosin can induce constriction of the cell by moving actin filaments against each other. Capturing and quantifying these interactions between myosin and actin in living cells is an ongoing challenge. For example, live-imaging microscopy can be used to study the dynamic changes of actin and myosin density in deforming cells. These imaging data can be quantified using Optical Flow algorithms, which locally assign velocities of cytoskeletal movement to the data. Extended Optical Flow algorithms also quantify actin recruitment and degradation. However, these measurements on cytoskeletal dynamics may be influenced by noise in the image acquisition, by ad-hoc parameter choices in the algorithm, and by image pre-processing steps. Existing Optical Flow algorithms do not provide tools to estimate uncertainty on inferred velocity fields or remodeling rates that follow from these dependencies. This hinders our progress on understanding actin and myosin dynamics. To address this, we aim to combine Optical Flow algorithms with Gaussian Process regression. Our new method will not be subject to manual parameter optimisation. It will be able to assign velocity values at higher spatial resolution than previous methods and allow for uncertainty quantification of inferred quantities. We test our methods using data on actin and myosin densities in larval epithelial cells of Drosophila pupae. The development of our new method will be a starting point for identifying differences in cytoskeletal movement and remodeling under experimental perturbations. Our method will be applicable to other datasets in which flow fields are present.


