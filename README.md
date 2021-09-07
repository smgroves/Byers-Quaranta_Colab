# Byers-Quaranta_Colab
 Code generated for U01 Supplement between Byers and Quaranta labs

*Note: this code interacts with data from a shared Box folder between Vanderbilt and MD Anderson. Please request access for original data.*

## Goals
This repository contains the code and analysis for the U01 Supplement, which aims to understand the relationship between immune populations in SCLC patients and phenotypic plasticity of SCLC cells. 

## Design. 
We propose a novel quantification of phenotypic plasticity that can be compared across samples. TME immune composition and abundance may constrain this phenotypic plasticity, which has yet to be investigated. Due to the limited availability of patient biopsies, GEMM allografts will be used to evaluate the effect of immune cell infiltration on levels of plasticity within and between untreated and radiation-treated tumors. These comparisons will address several questions, including: **(1) which subpopulation of each allograft is most plastic; (2) is it consistent across allografts? and (3) how does the presence and proportion of immune cells affect plasticity of cancer cells?** We propose analysis of ten cell-line derived and allograft tumors, six patient biopsies, and multiple CDX models representing treatment-sensitive and resistant conditions. Results from analyses of murine models and patient biopsies will allow us to directly compare the overall effect of immune cell infiltration and therapeutic resistance on SCLC plasticity, as well as focus specifically on features of the immune component that may play a more important role in constraining the potential of cancer cells to change their phenotype. Furthermore, comparing the overall plasticity of sensitive and relapsed models will allow us to understand how treatment affects the ability of individual cells to reprogram their phenotypes. 
## Methods and Analysis. 
### RNA velocity. 
The Python package scVelo will be used to calculate RNA velocity for single cell data from cancer and immune cells from four murine cell line-derived tumors and six allografts, six patient biopsies, and single cell data from approximately 4-6 CDX tumors per condition (sensitive, olaparib-relapsed, and cisplatin-relapsed). These analyses will focus specifically on cancer cell populations. RNA velocity uses spliced and unspliced RNA counts to predict future gene expression on a single-cell level. Using this tool, we will build a Markov Chain (MC) model of cell-to-cell transitions in gene expression space, with probability of transition calculated directly from velocity.
### Dimensionality reduction. 
To decrease noise and focus on phenotypic changes along the manifold of the system, we will reduce the dimensionality of the dataset with UMAP. A transition matrix, containing probabilities of moving from one cell state to another in the MC model, will be restricted to transitions along the manifold. 
### Plasticity quantification using two metrics. 
Using the transition matrix, absorbing states of the MC model will be determined. Time to absorption can then be calculated and used to weight distances between cell states to quantify an expected distance of travel for each cell. This is a proxy for the transport term of plastic potential. A constraint term will be calculated using the expected variance of travel, or theoretical pluripotency of each cell. Because these metrics are distances in a common UMAP space, they allow us to compare plasticity across samples, unlike other measures such as pseudotime. We will therefore compare overall plasticity before and after treatment.
### Regression analysis of plasticity on immune cell infiltration. 
Immune component of scRNAseq samples will be identified as in Aim 1. Regression analysis will be conducted using various features of the immune component, such as proportion and/or existence of various immune cell types, and total amount of immune infiltration. Standard modeling techniques will be applied, such as logistic regression on the presence or absence of certain immune cell types, to determine how well immune features predict plasticity of the tumor component. Treatment of patients will be considered when comparing plasticity to regress out the effect of treatment on plasticity. Results from murine samples will be used as guidance for this analysis due to the higher statistical power of sample size.
### Plasticity of cancer cells. 
Because biopsy samples and CDXs are both human, we will be able to directly compare plasticity quantification of cancer cells across these platforms. We will compare overall plasticity levels, as well as investigate which subpopulations are present or absent across samples and identify highly plastic regions of each tumor type. We will also compare results regarding present and absent immune features in the various model systems.
### Identify plastic subpopulations. 
Based on preliminary data, the most plastic subpopulations may change under treatment. Normalized plasticity can be used to find the most plastic subpopulations, and gene ontology enrichment analysis will be used to identify these populations before and after treatment.

## In this repository
In this repository, we are analyzing multiple datasets across several conditions. Currently the data we are analyzing includes:

1. TKO (CMV-driven) mouse allografts (from Sage laboratory).  
    1. 4 radiotherapy sensitive models.
    2. 5 radiotherapy resistant models.
    3. 1 radiotherapy resistant clone.
    4. 1 radiotherapy resistant model after fractionated radiation (5 fractions at 20 Gy).
2. Untreated GEMM allografts (from MD Anderson).
    1. 4 TKO (Rb1; Trp53; Rbl2; R26-luc) allografts (5Bi, 3Li, 2L, 5C)
    2. 2 TKO Motley (Rb1; Trp53; Rbl2; R26-Motley) allografts (MT2, MT4)
3. Untreated cell line GEMM allografts (from MD Anderson).
    1. 1 allograft from a doublet KO cell line (KP1)
    2. 2 allografts from TKO (Rb1; Trp53; Rbl2) cell lines (KP11, Hes1-)
    3. 1 allograft from a Rb1; Trp53; Axin2-lacZ cell line (KP3)
4. Patient biopsies
    1. 6 Pre-treatment biopsies (140A, 138A, 135A, 142A, 145A, 146A)
    2. 3 Post-treatment biopsies (135B, 142B, 145B)
