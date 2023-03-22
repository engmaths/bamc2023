---
title: "Inferring genetic networks controlling cell fate decisions from data"
bookToc: false
---

# Inferring genetic networks controlling cell fate decisions from data

**Arianna Ceccarelli, Alicja Brozek, Andreas C S Joergensen, Mark Hintze, Michalis Barkoulas, Vahid Shahrezaei**

11:50 Wednesday in 2Q50/51.

Part of the *[Epidemiology and statistical learning]({{< relref "/sessions/session45" >}})* session.

## Abstract

The nematode Caenorhabditis elegans is widely used as a model organism in studies of development due to its highly predictable pattern of cell divisions. We focused on a population of epidermal stem cells, known as seam cells, that generate skin and neurons. The genes involved in seam cell patterning have been recently identified, however the architecture of the underlying gene regulatory network has not yet been clarified. Here, we focus on the transcription factors elt-1, egl-18 and ceh-16, which are thought to be at the core of the seam cell fate decision making network. Using single molecule FISH we quantified mRNA expression in single cells, both in wild-type and mutants, in order to identify how the genes influence each other. Firstly, the interactions were identified and quantified using a modified version of the Modular Response Analysis (MRA) algorithm. This variation allows the MRA to test links when mutants involve loss of gene functions rather than gene knock down. We then built ODE models, derived from all hypothesised links, and we fit their parameters using an algorithm for sparse Approximate Bayesian Computation using the Gibbs sampling algorithm. Our inference algorithm performs sparse sampling, discarding all the unnecessary parameters, hence, it filters out all the non-essential connections. The ODE modelling confirmed the MRA results and model predictions were further validated using a double mutant worm. Taken together, the experimental and computational analyses agree on the description of the relationship between these three genes in seam cells, as specified in the presented network. More generally, we propose a reliable approach to infer gene networks from the data that can be used in a range of future studies in the area.


