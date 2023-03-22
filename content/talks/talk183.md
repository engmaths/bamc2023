---
title: "Incipient wave breaking within higher-order spectral methods"
bookToc: false
---

# Incipient wave breaking within higher-order spectral methods

**Tatjana Kokina, J N Steer, S A Hasan, F Dias**

Monday at 12:10 PM in 2Q42.

Part of the *[Advances in water waves and free-surface flows]({{< relref "/sessions/session01" >}})* session.

## Abstract

Higher-order spectral methods (HOSM) exploit the Fourier transform to efficiently solve the free surface boundary conditions of large periodic domains, including largescale multi-directional ocean wave fields. The HOSM models nonlinear wave-wave interactions using an arbitrary order of expansion in wave steepness about the still water level. While high-order expansions give the HOSM great accuracy in modelling steep waves and their nonlinear effects, increasingly large wavenumber domains are required to do so. Inherently, the HOSM cannot model overturning waves and therefore different filtering techniques have often been used to imitate the dissipative effects of breaking. To implement a local, phase-resolved model of wave breaking in the HOSM, incipient breaking waves must first be identified, and their accuracy assessed. The main aim of this study was to determine if wave breaking onset could be accurately identified within a HOSM and the numerical parameters required to model such steep waves accurately. Several unidirectional focused groups, defined by the crest steepness at focus and spectral bandwidth, were simulated using a HOSM. The ratio, B of particle velocity, U to local crest speed, c was evaluated at each crest in the HOSM. It was found that the B ratio measured in the steepest HOSM crests converged as the numerical expansion levels were increased. It was noted HOSM was displaying unphysical results in the surface elevation once the suspected breaking was happening, hence the HOSM test cases will be compared to a boundary integral equation method (BIEM), a strongly non-linear solver capable of modelling wave overturning. This comparison is currently ongoing, and the overturning cases are being assessed in terms of the error between the HOSM and BIEM breaking ratio. 


