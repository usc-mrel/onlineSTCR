 function ob = TV_2D_xy(image_size)
%function ob = TV_2D([mask,] args)
%|
%| Do Total variation differences
%| Inputs:
%|     image_size: vector image size [nx, ny, nframe, nc]
%|     sens: sensitivity map: size([nx, ny, coil])
%| 
%| Inspired and modified from Jeff Fessler's Gnufft object in the
%| Michigan Image Reconstruction Toolbox (MIRT).

%{
nx = image_size(1);
ny = image_size(2);
nframe = image_size(3);
%}

idim = vec(image_size)'; % [nx, ny, nframe];
odim = [idim,2];
% odim(1) = idim(1)*2;

forw = @(arg, x) TV_forw(x);
back = @(arg, y) TV_adj(y);

ob = fatrix2('idim', idim, 'odim', odim, ...
    'does_many', 1, ...
    'forw', forw, 'back', back);

 end

% Function to compute finite spatial differences along dimensions 1 and 2
function diff_result = TV_forw(input_array)
    idim = size(input_array);
    % Compute finite differences along dimension 1 (x-axis)
    diff_x = input_array - circshift(input_array, [0, -1]);
    
    % Compute finite differences along dimension 2 (y-axis)
    diff_y = input_array - circshift(input_array, [-1, 0]);
    
    % Concatenate the differences along both dimensions
    diff_result = cat(length(idim)+1,diff_x,diff_y);
end

% Function to compute the adjoint (backward) of the finite differences
function adjoint_result = TV_adj(forward_diff)
    sz = size(forward_diff);
    sz_adj = sz;
    sz_adj(end) = sz_adj(end)/2;
    
%     forward_diff_x = forward_diff(1:sz(1)/2,1:sz(2),:);
%     forward_diff_y = forward_diff(sz(1)/2+1:sz(1),1:sz(2),:);
    
    
    forward_diff_x = reshape(forward_diff(1:prod(sz)/2),sz_adj);
    forward_diff_y = reshape(forward_diff(prod(sz)/2+1:prod(sz)),sz_adj);
    % Compute the adjoint for dimension 1 (x-axis)
    adjoint_x = forward_diff_x - circshift(forward_diff_x, [0, 1]);
    
    % Compute the adjoint for dimension 2 (y-axis)
    adjoint_y = forward_diff_y - circshift(forward_diff_y, [1, 0]);
    
    % Sum the adjoints along both dimensions
    adjoint_result = adjoint_x + adjoint_y;
end