---
title: "Asymptotic reduction of battery degradation models (SEI growth and lithium plating)"
bookToc: false
---

# Asymptotic reduction of battery degradation models (SEI growth and lithium plating)

**Ferran Brosa Planella**

Tuesday at 1:50 PM in 4Q07.

Part of the *[Industrial mathematics]({{< relref "/sessions/session39" >}})* session.

## Abstract

Understanding the degradation behaviour of lithium-ion batteries is a key step towards a better performance and longer battery life, which are crucial for a successful electrification of transport. However, coupling the standard Doyle-Fuller-Newman (DFN) model with degradation effects is significantly expensive from the computational point of view. This limitation motivates the need of simpler models, but these are usually posed in an ad hoc manner that leads to inconsistencies in the models and multiple formulations of the same model. 

In this work we present a Single Particle Model with electrolyte and a side reaction (SPMe+SR) derived from the full DFN model using asymptotic techniques. The advantage of this approach is that it is systematic and the assumptions on which it is based can be validated a priori, which allows the derivation of robust and physically consistent models. The side reaction included in the model is arbitrary and therefore the SPMe+SR can capture both SEI growth and lithium plating (very common degradation mechanisms), in addition to more complex scenarios which combine multiple reactions. We have implemented the SPMe+SR in PyBaMM (www.pybamm.org) and validated it against a DFN model for multiple scenarios, finding very high accuracy at a much lower computational cost. This opens the door to the application of this model to real-life problems, such as battery design and control.



