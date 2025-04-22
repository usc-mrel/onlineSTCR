function y = display_trans(x)
y = crop_half_FOV(imrotate(fliplr(gather(x)), 90));
end

