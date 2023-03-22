---
title: "SHEEP: Signed Hamiltonian Eigenvector Embedding for Proximity"
bookToc: false
---

# SHEEP: Signed Hamiltonian Eigenvector Embedding for Proximity

**Shazia Babul**

10:30 Wednesday in 2Q49.

Part of the *[Networks and complex systems in society]({{< relref "/sessions/session44" >}})* session.

## Abstract

The relationship between the local and global structure of signed networks (networks with positive/negative edges), is typically understood through the concept of structural balance theory. Structural balance relates local motifs in the graph to clusterability, the ability to partition the network into antagonistic factions (clusters with internal positive edges and negative edges in between).  Identifying the optimal partition of a signed graph into k clusters, where k is unknown, has been shown to be NP hard and many different methods have been proposed to solve this problem numerically. However, there remain many open questions in this field, particularly in the case when a network does not have a natural cluster structure. Here, we present a physically inspired method for signed network embedding, incorporating local, intermediate and global information into a proximity measure between nodes. The method works by constructing a Hamiltonian from the network, modelled as a system of interacting particles with positive (negative) edges mapped to attractive (repulsive) forces. Finding the minimum energy configuration reduces to a computationally efficient eigenvalue problem.  The algorithm is distinct in that it can be used to understand continuous, proximal node relationships; does not require a priori assumptions about the existence of (discreet) clusters; and locates the optimal embedding dimension.  At the global level, we show that the embedding is intrinsically related to structural balance, outputting a “minimum energy” which describes the degree to which the network is polarised.  We also show that the resulting position in the embedding can be used to understand certain continuous node attributes. 


