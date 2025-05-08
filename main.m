%% Main online STCR
% Written by Duc Le
% updated 04/22/2025

%   Online spatiotemporally constrained reconstruction (online STCR):
%
%   ||E_n x_n-d_n||_2^2 + lambda_t||x_n-x_n-1||_1 + lambda_s||TV_s x_n||_1
%                  
%
%   "E_n"       sampling matrix includes sensitivity maps, Fourier 
%               transform, and undersampling mask for nth frame
%   "x_n"       nth frame to be reconstructed
%   "x_n-1"     Reconstructed previous frame
%   "d_n"       measured k-space  data of nth frame
%   ||.||_2^2   l2 norm
%   ||.||_1     l1 norm
%   "lambda_t"  temporal constraint weight
%   "lambda_s"  spatial constraint weight
%
%   TV_s        spatial TV operator
%               sqrt( abs(m_x+1 - m_x)^2 + abs(m_y+1 - m_y) + epsilon )
%% -------------------------------------------------------------------------
load("volunteer1.mat")
addpath("usc_dynamic_reconstruction/")
recon_online_stcr; % Run the online STCR code. Refer to the file in usc_dynamic_reconstruction/