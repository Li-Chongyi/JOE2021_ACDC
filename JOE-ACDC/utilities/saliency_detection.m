function sm = saliency_detection(img)

HSV = rgb2hsv(img);

H = double(HSV(:,:,1)); Hm = mean(mean(H));
S = double(HSV(:,:,2)); Sm = mean(mean(S));
V = double(HSV(:,:,3)); Vm = mean(mean(V));

sm = (H-Hm).^2 + (S-Sm).^2 + (V-Vm).^2;