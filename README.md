# Stable White Matter Microstructure after Two Years of Follow-Up in Early Schizophrenia Patients.

This repository contains the analysis code used in the above report. It was conducted on a pair of datasets:  the Johns Hopkins Schizophrenia Center dataset recruited in Boston, MA, and the TOPSY dataset recruited in London, Ontario, Canada. Data was preprocessed with the following [Snakemake](https://snakemake.readthedocs.io/en/stable/) pipelines:

* [snakedwi](https://github.com/akhanf/snakedwi/tree/v0.2.1): Preprocessing, image correction, and registration of diffusion weighted imaging
* [snaketract](https://github.com/pvandyken/snaketract): [mrtrix](https://mrtrix.readthedocs.io/en/latest/)-based pipeline deriving tractography from diffusion weighted images.
* [snakeanat](https://github.com/pvandyken/snakeanat): Wrapping [fastsurfer](https://github.com/Deep-MI/FastSurfer) and [ciftify](https://github.com/Deep-MI/FastSurfer) to calculate the cortical mesh and HCP preprocessing derivatives
* [templategen](https://github.com/pvandyken/templategen): Uses [greedy](https://greedy.readthedocs.io/en/latest/) for rapid calculation of a common template space
* [snakemodel](https://github.com/pvandyken/snakemodel): Incorporation of [TBSS](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide) and (NBS)[https://www.nitrc.org/projects/nbs] into a snakemake pipeline

The primary analysis file is `stats.ipynb`, which contains all the code used to generate figures for the manuscript.