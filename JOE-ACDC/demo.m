clc
clear 
close all
addpath('utilities');

images_dir='test';
listing = cat(1, dir(fullfile(images_dir, '*.png')));
results_dir = fullfile(images_dir, 'result');
if ~exist(results_dir, 'dir'), mkdir(results_dir); end

for i_img = 1:length(listing)

    Input = imread(fullfile(images_dir,listing(i_img).name));
    [~, img_name, ~] = fileparts(listing(i_img).name);
    img_name = strrep(img_name, '_input', '');
   
    %  Attenuated Color Channel Correction
    CC = ACCC(Input);
    %  Result
    Result = ACDE(CC);

    imwrite(Result, fullfile(results_dir, [img_name, 'Result.jpg']));
end

