---
title: "Summation-by-parts operators for implicit finite difference approximations"
bookToc: false
---

# Summation-by-parts operators for implicit finite difference approximations

**You-Wei Ho, Edward James Brambley**

12:10 Monday in 4Q05.

Part of the *[Acoustics]({{< relref "/sessions/session08" >}})* session.

## Abstract

Computational aeroacoustics (CAA) simulations often use finite-difference schemes to perform high-resolution simulations at relatively fewer points per wavelength, using so-called dispersion relation preserving (DRP) optimised derivatives. However, DRP schemes currently only work well for symmetric derivatives in the interior of a domain, and it is still an open problem how to optimise a stable asymmetric finite-difference scheme for use near boundaries. In contrast, finite-difference schemes with the summation-by-part (SBP) property and boundary conditions imposed using simultaneous approximation terms (SATs) are known to be totally stable. In this talk, we derive implicit finite difference schemes with block-norm SBP boundary closures up to eighth-order accuracy for the first time. We show that a helper matrix factors the present SBP scheme into a banded linear system of lower bandwidth that can be solved more efficiently. Any remaining coefficients are then tuned to minimise the truncation error of the scheme. The numerical accuracy, stability properties, and computation cost of the proposed implicit SBP schemes are illustrated through a numerical model of a one-dimensional wave propagating between reflective walls.


