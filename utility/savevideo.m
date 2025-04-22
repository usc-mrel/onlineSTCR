function savevideo(T, name, framerate)
T = abs(T);
VidObj = VideoWriter(name,'Uncompressed AVI'); %set your file name and video compression
VidObj.FrameRate = framerate; %set your frame rate
open(VidObj);
if ndims(T)==4
for f = 1:size(T, 4)  % RGB video
    writeVideo(VidObj,T(:,:,:,f));
end
end
if ndims(T)==3
for f = 1:size(T, 3)  % BW video
    writeVideo(VidObj,T(:,:,f));
end
end
close(VidObj);
% T = abs(T);
end