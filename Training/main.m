% %MAIN FUNCTION - Run fungsi utama main() ini untuk menjalankan program
% %
% % Inputs:
% %    input training set - sub-image sliding window 15x15, sampel 9116 buah
% %    input test set - gambar grayscale dengan ukuran bebas
% %    
% % Target:
% %    Target training set - gambar berwarna dengan ukuran 120x100
% %
% % m-files dibutuhkan: main.m, train.m, logisticSigmoid.m, dLogisticSigmoid.m
% % MAT-files tersedia: nilai-nilai pre-trained hidden weights dan output weights
% %
% % Nama anggota: 13214008 Naufal Ridho H, 13214012 Fransiskus Yoga Esa, 13214034 Ferriady Setiawan
% % EL4138 Perancangan Sistem VLSI
% % Institut Teknologi Bandung, Teknik Elektro
% % Tanggal: 3-December-2017
% 
% %------------- CODE --------------
% 
% clear all; close all; clc
% %%%% Paramet nerual network  dan data%%%%%%%%%s
% % Menentukan jumlah hidden units
% numberOfHiddenUnits = 80;
% % Menentukan learning rate
% learningRate = 0.1;
% % Menentukan fungsi activation function yang digunakan
% activationFunction = @logisticSigmoid    %(x) 1./(1+exp(-x));
% dActivationFunction = @dLogisticSigmoid  %(x) 1./(2+exp(x)+exp(-x));
% % Menentukan batch size dan epoch yang digunakan
% batchSize = 9116;
% epochs = 100;
% %%menentukan besar kernel input
% h_in = 15;
% w_in = 15;
% 
% fprintf('%d hidden units.\n', numberOfHiddenUnits);
% fprintf('Learning rate: %d.\n', learningRate);
% 
% %%%% Meng-load Dataset Wajah %%%%%%%%%%%
% % Membuat data training %%
% % Membaca gambar
% color_image = imread('1.jpg');
% gray_image = rgb2gray(color_image);
% [h_img w_img]= size(gray_image);
% % Menghitung jumlah pixelyang valid
% valid_x = w_img-w_in+1;
% valid_y = h_img-h_in+1;
% %inisialisasi data input dan supervisor
% train_in = [];
% train_out = zeros(3,valid_x*valid_y);
% for i=1:valid_x
%     for j=1:valid_y
%         temp = gray_image([j:j+h_in-1],[i:i+w_in-1]);
%         train_idx = (i-1)*valid_y+j;
%         train_in = [train_in;temp(:)'];
%         pos_x = uint16(i+(w_in+1)/2);
%         pos_y = uint16(j+(h_in+1)/2);
%         train_out(1,train_idx) = color_image(pos_y,pos_x,1);
%         train_out(2,train_idx) = color_image(pos_y,pos_x,2);
%         train_out(3,train_idx) = color_image(pos_y,pos_x,3);
%     end
% end
% train_in = im2double(train_in');
% train_out = double(train_out);
% train_out = train_out/255;
% 
% %%% Prosees training %%%%%%%%%%%%%%%%%%
% [hiddenWeights, outputWeights] = train(activationFunction, dActivationFunction, ...
%       numberOfHiddenUnits, train_in, train_out, epochs, batchSize, learningRate);
%  
% %%% Menyimpan workspace MAT %%%
% % Untuk menyimpan hidden weights dan output weights %
% % sehingga tidak perlu melakukan training ulang nantinya %
% filename = 'data_sigmoidpartial.mat';
% save(filename);
%load hidden weights dan output weights yang telah ditrain
clear all; load('data_sigmoidpartial.mat');

%%% Proses Testing %%%%%%%%%%%%%%%%%%%%
% Membuat data testing %%
% Membaca gambar
test_image = imread('1.jpg');
test_gray = rgb2gray(test_image);
test_gray = double(test_gray)/255;
[h_imgtest w_imgtest]= size(test_gray);
% Menghitung jumlah pixel yang valid
valid_x_test = w_imgtest-w_in+1;
valid_y_test = h_imgtest-h_in+1;
%inisiasi data input dan supervisor
test_out = ones(valid_y_test,valid_x_test,3);
for i=1:valid_x_test
    for j=1:valid_y_test
        temp = test_gray([j:j+h_in-1],[i:i+w_in-1]);
        temp = double(temp(:));
		%forward
		hiddenActualInput = hiddenWeights*temp;
		hiddenOutputVector = activationFunction(hiddenActualInput);
		outputActualInput = outputWeights*hiddenOutputVector;
		outputVector = activationFunction(outputActualInput);
        test_out(j,i,:) = outputVector;
    end
end
 
% test_out_hsv = rgb2hsv(test_out);
%test_out_hsv(:,:,2) = 1.5*test_out_hsv(:,:,2)
% test_out_rgb = hsv2rgb(test_out_hsv);
%test_out_rgb(:,:,3) = 0.5*test_out_rgb(:,:,3);
image8Bit = uint8(255 * test_out);
figure;
subplot(1,4,1), imshow(test_image);
subplot(1,4,2), imshow(test_gray);
subplot(1,4,3), imshow(test_out);
subplot(1,4,4), imshow(image8Bit);