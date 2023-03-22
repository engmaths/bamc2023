---
title: "Minimal disturbances to cause blackouts in model power grids"
bookToc: false
---

# Minimal disturbances to cause blackouts in model power grids

**Tom S Eaves**

Monday at 11:30 AM in 4Q07.

Part of the *[Mathematics of energy]({{< relref "/sessions/session09" >}})* session.

## Abstract

Power grid networks must balance multiple sources of power generation and consumption. Modern power grids must also balance the supply of renewable energy sources, many of which are intermittent. The load on a power grid network must be constantly adjusted in order to maintain synchronisation of the power supply, which in the UK operates at a target frequency of 50Hz. A power grid can conceptually be viewed as an interlinked network of generators and consumers, in which the conditions at any one node of this network may affect the conditions at all directly connected nodes. In order to maintain synchrony of the network, this interconnected grid of electrical oscillators must be designed carefully, and any potential weak points in the grid eliminated; one common cause of blackouts in power grids is a desynchronisation of one or more nodes from the rest of the grid, leading to a cascading desynchronisation across the network.

This presentation will discuss a Kuromoto-like synchronisation model for power grids developed by Filatrella et al. (2008). For many power grid networks, the developed model is a multi-state system in which a stable synchronised state coexists with stable desynchronised states. The susceptibility of this model to desynchronisation was studied by Ji & Kurths (2014) and Mitra et al. (2017) who computed the relative volume of the basins of attraction of each state of the system. Whilst these studies provide insight into the overall performance of a given power grid, they do not clearly identify the most likely way in which a network may desynchronise. The methodology is also computationally intensive since it samples the entire state space of initial conditions.

In order to identify the most dangerous nodes in a power grid and assess the most likely desynchronisation scenario, this presentation will demonstrate an optimisation procedure for identifying the smallest amplitude perturbation from the synchronised state which is able to cause desynchronisation. The methodology for finding such a minimal disturbance is based on the computation of ‘minimal seeds’ for transition to turbulence in wall-bounded shear flows (see Kerswell, 2018). This presentation will show the minimal disturbances which desynchronise a variety of power grid networks and outline a general procedure for finding such disturbances in any dynamical system evolving on a graph network.

References

Filatrella, G., Nielsen, A. H. & Pederson, N. F. 2008 Analysis of a power grid using a
kuramoto-like model. Eur. Phys. J. B 61, 485–491.

Ji, P. & Kurths, J. 2014 Basin stability of the kuramoto-like model in small networks. Eur.
Phys. J. Special Topics 223, 2483–2491.

Kerswell, R. R. 2018 Nonlinear nonmodal stability theory. Annu. Rev. Fluid Mech. 50,
319–345.

Mitra, C., Choudhary, A., Sinha, S., Kurths, J. & Donner, R. V. 2017 Multiple-node
basin stability in complex dynamical systems. Phys. Rev. E 95, 032317.


