---
title: "A methodology for time-series medical data classification using echo state network"
bookToc: false
---

# A methodology for time-series medical data classification using echo state network

**Zonglun Li, Alexey Zaikin, Oleg Blyuss**

Wednesday at 11:30 AM in 2Q50/51.

Part of the *[Epidemiology and statistical learning]({{< relref "/sessions/session45" >}})* session.

## Abstract

Data explosion leads to data proliferation of various types and formats. Among them, time-series data have played a vital role in medical research, not least with the rapid development of machine learning techniques. Patients generally come with sparse but disparate time points due to the nature of disease and the diversity of individual behaviours. Nowadays, most machine learning tasks in relation to time series data are carried out using deep recurrent neural networks such as LSTMs. However, deep neural networks tend to consume enormous computational power as most, if not all, weights in the network need to be trained through back-propagation. Echo state network is an efficient model for processing temporal data due to its low training cost. The reservoir maps input signals into a high-dimensional dynamical system and the readout layer extracts patterns from it. Therefore, we will develop a new methodology that can classify time-series data using the echo state network. Besides, since sample-taken times are available in many datasets of this type, we will also explore the possibility of accommodating this variable in the model, which to the best of our knowledge, has not been discussed under the current deep neural network framework.


