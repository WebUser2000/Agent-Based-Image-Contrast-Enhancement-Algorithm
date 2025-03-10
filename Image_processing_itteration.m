% MATLAB Program to process an image based on specified equations

% Step 1: Load an image from the user
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'}, 'Select an Image');
if isequal(filename, 0)
    disp('User  canceled the operation.');
    return;
end
imagePath = fullfile(pathname, filename);
img = imread('D:\Gray_scale\apple1.jpeg');

% Step 2: Convert the image to grayscale if it's not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Step 3: Initialize the matrix A based on the image
A = double(img); % Convert to double for calculations
[m, n] = size(A); % Get the dimensions of the image

% Step 4: Loop through the image and apply the equations
for k = 1:10 % Number of iterations (you can adjust this)
    S = 0; % Initialize S for each iteration
    sq = zeros(m, n); % Initialize sq matrix

    % Calculate sq and S
    for i = 1:m
        for j = 1:n
            P0 = A(i, j); % Current pixel value
            Pq = A(i, j); % In this case, Pq is the same as P0

            % Calculate sq based on the condition
            sq(i, j) = sign(P0 - Pq);
        end
    end

    % Calculate S as the sum of sq
    S = sum(sq(:));

    % Step 5: Update the matrix A based on S
    for i = 1:m
        for j = 1:n
            if S == 0
                A(i, j) = A(i, j); % No change
            elseif S == -1
                A(i, j) = A(i, j) * 0.9; % Decrease by 10%
            elseif S == 1
                A(i, j) = A(i, j) * 1.1; % Increase by 10%
            end
        end
    end
end

% Step 6: Display the original and processed images
figure;
subplot(1, 2, 1);
imshow(uint8(img));
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(A));
title('Processed Image');

% Save the processed image if needed
imwrite(uint8(A), 'processed_image.png');