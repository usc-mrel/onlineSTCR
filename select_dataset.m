
% Select a dataset to use.
% Pre-selected datasets one good and one bad each.
% -------------------------------------------------------------------------
% Summary of the datasets are here:
% 
% Cardiac:
% 
% . Single Band, (Pseudo) Golden-Angle Spiral Trajectory.
%   SAX images.
%   Resolution: 2.2 mm in plane, Slice Thickness: 8mm
% 
% -------------------------------------------------------------------------

switch area
    
    case 'fetal3'
        path = '/server/sdata/ytian/mri_data/disc/fetal/vol0474_20221028/raw_hawk'; % 31 week, BMI 21 
        name = 'usc_disc_yt_2022_10_28_132538_multi_slice_golden_angle_spiral_ssfp_slice_1_fov_240_n30_slice_01';
end