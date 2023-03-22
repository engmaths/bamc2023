---
title: "Falling liquid film control via linear quadratic regulation"
bookToc: false
---

# Falling liquid film control via linear quadratic regulation

**Oscar Holroyd, Susana N Gomes, Radu Cimpeanu**

11:10 Wednesday in 2Q48.

Part of the *[Optimisation and control for nonlinear dynamics]({{< relref "/sessions/session43" >}})* session.

## Abstract

A novel method for stabilizing falling liquid films with blowing and suction at the base using a linear-quadratic regulator (LQR) is presented. LQR methods allow for rapidly responding feedback control by pre-computing a gain matrix but are only suitable for systems of linear ordinary differential equations (ODEs). In contrast, the Navier-Stokes equations that describe the dynamics of a thin liquid film flowing down an inclined plane are too complex to stabilise with standard control theoretic techniques. To bridge this gap we use reduced-order models — the Benney equation and a weighted-residual integral boundary layer model — derived via asymptotic analysis to derive a multi-level control framework. This framework consists of an LQR feedback control designed for a linearised and discretised system of ODEs approximating the reduced-order system which are then applied to the full Navier-Stokes system. The control scheme is tested in direct numerical simulations (DNS) and compared to analytical predictions regarding linear stability thresholds and minimum required actuator numbers. Comparing the strategy between the two reduced-order models we show that both successfully stabilise a uniform flat film across their respective range of valid parameters, with the more accurate weighted-residual model outperforming the Benney-derived controls. The weighted-residual controls are also found to function far beyond its anticipated limits.


