# online STCR
Online reconstruction of real-time MR images using spatiotemporally constrained reconstruction (online STCR)


## Data

Please download the [fetal real-time raw k-space data](https://zenodo.org/records/15299545) and add to the main folder. 


## Usage

### Running Inputs: 

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->
1.   Download the [Parallel Computing toolbox](https://www.mathworks.com/products/parallel-computing.html) for MATLAB if not already available.

2.   Clone the repository with the submodules ```mirt``` and ```usc_dynamic_reconstruction``` by typing into your terminal

      ```git clone --recurse-submodules https://github.com/usc-mrel/onlineSTCR```

      This will automatically add folders ```mirt``` and ```usc_dynamic_reconstruction``` in your main path.

3.   Make sure to put the downloaded fetal real-time raw-kspace data in your main path.

4.   Set the relevant parameters and flags inside 

      ```
      usc_dynamic_reconstruction/recon_online_stcr.m
      ```
      including
      
      `Narms_full`: Number of TRs binned for full sampling to estimate coil sensitivity 
      
      `Narms_recon`: Desired temporal resolution (distance between frames)
      
      `Narms_window`: Numbers of TRs binned in 1 frame
      
      `Narms_initial`: Number of TRs binned for initial frame
      
      `lambdaTFD`: Temporal regularization parameter
      
      `lambdatTV`: Spatial regularization parameter
      
      `mu`: Penalty parameter
      
      `step_size_x`: Step size of shrinkage operator 
      
      `Nmaxiter`: Number of iterations per frame. Tune this so that the time to reconstruct 1 frame is less than acquisition time. 
      
      `print_cost`: Choose wheter to print the components of the cost function for each frame (will increase runtime)
      
      `accelerate_flag`: Choose whether to apply Nesterov acceleration in FISTA
      
      `toeplitz_flag`: Choose whether to use Toeplitz trick to reduce gridding and inverse-gridding time.

5. Then run

      ```
      main.m
      ```

### Outputs: 

Retrospective online STCR reconstruction returns real-time MR image in ```x```, of shape [Nx x Ny x Nframes].

If `print_cost = true`, the cost of the online STCR optimization problem of each frame will be printed after every iteration.

### Notes:

The code is tested with MATLAB 2021a on a server equipped with 4x NVIDIA A100 GPU (40GB memory for each). 
