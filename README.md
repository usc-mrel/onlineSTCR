# online STCR
Online reconstruction of real-time MR images using spatiotemporally constrained reconstruction (online STCR)


## Data

Please download the [fetal real-time raw k-space data](https://zenodo.org/records/15299545) and add to the main folder. 


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
