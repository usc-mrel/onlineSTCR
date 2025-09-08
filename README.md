# online STCR
Online reconstruction of real-time MR images using spatiotemporally constrained reconstruction (online STCR)


## Data

Please download the [fetal real-time raw k-space data](https://zenodo.org/records/15299545) and add to the main folder. 


## Usage

### Running Inputs: 

Clone the repository with the submodules ```mirt``` and ```usc_dynamic_reconstruction```

The [Parallel Computing toolbox](https://www.mathworks.com/products/parallel-computing.html) is required. 

```git clone --recurse-submodules https://github.com/usc-mrel/onlineSTCR```

Set the relevant flags inside 

```
usc_dynamic_reconstruction/recon_online_stcr.m
```

and run 

```
main.m
```

### Outputs: 

Retrospective online STCR reconstruction returns real-time MR image in ```x```, of shape [Nx x Ny x Nframes].

### Notes:

The code is tested with MATLAB 2021a on a server equipped with 4x NVIDIA A100 GPU (40GB memory for each). 
