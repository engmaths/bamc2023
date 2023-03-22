---
title: "Extended Pair Correlation Functions for Multiplex Medical Imaging"
bookToc: false
---

# Extended Pair Correlation Functions for Multiplex Medical Imaging

**Joshua A Bull, Helen M Byrne**

Tuesday at 1:50 PM in 4Q56.

Part of the *[New mathematical approaches in the life sciences]({{< relref "/sessions/session41" >}})* session.

## Abstract

Imaging platforms for generating highly multiplexed histological images are being continually developed and improved. Technologies such as Multiplexed Ion Beam Imaging (MIBI) and Imaging Mass Cytometry (IMC) permit extremely high resolution imaging of tens or hundreds of different markers across the same tissue slice. While deep learning approaches provide powerful cell segmentation and classification tools for this data, they do not provide interpretable statistical analyses of the resulting cell locations and labels. There is therefore demand for an array of mathematical and statistical tools which can quantify spatial correlation between cells of different types present in multiplex images. Here, we consider methods for interpreting and analysing multiplex histological images that are based on the existing Pair Correlation Function (PCF).

The PCF is a spatial statistic that can be used to identify positive and negative spatial correlation between points, across a range of length scales. A common extension, the cross-PCF, describes correlations between pairs of points of different classes, which in the context of multiplex imaging may correspond to cells of different types (see, e.g., [1]). However, while the cross-PCF describes colocalisation between different cell types it has limitations which obstruct its wider application to multiplexed histology. For instance, we may want to instead categorise cells according to their marker expression, a continuous label, or identify simultaneous correlation between 3 or more types of cell simultaneously. Further, while PCFs are spatially resolved, they average the information from across a region or image which means that areas of particularly high (or low) correlation between cells within the analysis region cannot be straightforwardly identified.

In this talk, we present extensions to the PCF which permit deeper analysis of multiplex images to address each of these limitations. These include the weighted-PCF (wPCF), which extends the cross-PCF to describe spatial correlation between points with continuous (rather than categorical) labels, such as cells labelled with stain intensity or cell size [2]. We conclude that these extended PCFs can provide a rich array of spatial analysis methods to augment standard statistical descriptors. Finally, we propose that such statistics provide a means of directly comparing spatially resolved mathematical models against multiplex imaging data.

 

[1] P. Weeratunga, L. Denney, J. A. Bull, E. Repapi et al. 2022. Unbiased single cell spatial analysis localises inflammatory clusters of immature neutrophils-CD8 T cells to alveolar progenitor cells in fatal COVID-19 lungs. medRxiv preprint. https://doi.org/10.1101/2022.12.21.22283654

[2] J. A. Bull and H. M. Byrne, 2022. Quantification of spatial and phenotypic heterogeneity in an agent-based model of tumour-macrophage interactions. biorXiv preprint. https://doi.org/10.1101/2022.05.26.493564 



