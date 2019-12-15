%%Read the first data
%read image in grayscale
inputImg = imread('1.jpg');
inputImg = rgb2gray(inputImg);
%take first data in a row of aray
imgSlice  = inputImg([50:65],[50:65]);
imgSlice = imgSlice(:);
%%Create the mif file
%file name
file_name = strcat('data\test_data.mif');
fid = fopen(file_name,'wt');
%make header mif file
fprintf(fid, 'DEPTH = 256;\n');
fprintf(fid, 'WIDTH = 8;\n');
fprintf(fid, 'ADDRESS_RADIX = HEX;\n');
fprintf(fid, 'DATA_RADIX = HEX;\n');
fprintf(fid, 'CONTENT\n');
fprintf(fid, 'BEGIN\n');
sizeSlice = size(imgSlice,1);
ln_depth = ceil(log2(sizeSlice))/4;
for i=0:sizeSlice-1
    addr = dec2hex(i,ln_depth);
    txt_temp = dec2hex(imgSlice(i+1),2);
    fprintf(fid, '%s : %s;\n', addr, txt_temp);
end
fprintf(fid, 'END;\n');
fclose(fid);