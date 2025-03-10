% Read a grayscale image  
img = imread('D:\Gray_scale\apple1.jpeg'); % Replace with your image filename  

% Convert the image to double for calculations  
P0 = double(img);  

% Create a shifted version of the original image Pq  
% For example, let's shift the image 1 pixel to the right  
Pq = circshift(P0, [0, 1]);  

% Ensure Pq and P0 are the same size  
Pq(end, :) = P0(end, :); % Fill the last row of Pq with the last row of P0  

% Compute sq, the sign of the difference  
sq = sign(P0 - Pq);  

% Calculate S as the summation of the elements of sq  
S = sum(sq(:)); % Sum all elements in sq  

% Display results  
disp('Matrix sq:');  
disp(sq);  
disp(['Sum S: ', num2str(S)]);  

% Optional: Display the original and processed images  
figure;  
subplot(1, 3, 1);  
imshow(uint8(P0));  
title('Original Grayscale Image');  

subplot(1, 3, 2);  
imshow(uint8(Pq));  
title('Shifted Image (Pq)');  

subplot(1, 3, 3);  
imshow(sq, []);  
title('Sign Matrix (sq)');

for i=1:length(img)
img(i)=img(i)+100;
end
imshow(img)