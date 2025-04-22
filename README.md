# onlineSTCR
Online reconstruction of real-time MR images using spatiotemporally constrained reconstruction (online STCR)


## Data

Shorter example SMS and Single-Band (SB) data acquired at ramped-down 0.55T are included in the directory. SB slices 2 (apical slice), 5 (mid slice), and 8 (basal slice) correspond to one SMS acquisition, each for ~ 2 seconds. The full acquisitions (~15 seconds) for these datasets can be found here: 

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.12737931.svg)](https://doi.org/10.5281/zenodo.12737931)

The datasets contain the raw data for real-time cardiac MRI acquired at 0.55T scanner. The data is stored as a MATLAB struct: k-space contains the raw data [Nsample x Narms x Ncoil], and kspace_info contains relevant acquisition-related information.

## Usage

### Running Inputs: 
Set the relevant flags inside and run 

```
recon_online_stcr.m
```

### Outputs: 

Online reconstruction return real-time MR image in ```x```, of shape [Nx x Ny x Nframes].

### Notes:

The code is tested with MATLAB 2021a on a server equipped with 4x NVIDIA A100 GPU (40GB memory for each). 
