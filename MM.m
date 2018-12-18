%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathermatical morphology
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Erosion and Dilatation


%% Question 1
% 'Define erosion and dilatation from an ensemblist point of view and an
% functional point of view. Give some properties related to these
% operators'


%% Question 2
% 'Operate in a binary image and a greyscale image with the MatLab com-
% mands imerode and imdilate. What are the e?ects on binary and grayscale images?
% Justify. Try with different structuring elements (different shapes,
% different sizes)'

image = imread('cameraman.tif');
se = offsetstrel('ball',3,3);

figure(1);
imshow(image);

image_erod = imerode(image,se);
figure(2);
imshow(image_erod);

image_dil = imdilate(image,se);
figure(3);
imshow(image_dil);

%Erode LE BLANC

%% Question 3
% 'Extract internal and external edges of a binary image, and the morphological gradian

image = imread('Images1.jpg');
se = ones(3); 

int_edge = image-imerode(image,se);
ext_edge = imdilate(image,se)-image;
 
figure(4);
imshow(int_edge);
figure(5);
imshow(ext_edge);

morph_grad = imdilate(image,se)-imerode(image,se);
figure(6);
imshow(morph_grad);


%% Question 4
% 'Write an algorithm that show, in the map of Europe, the
% distance of each pixel w.r.t. the sea'

image = imread('EuropeBW.bmp');
image = not(image);
figure;
imshow(image);

final_image = zeros(size(image));

for i=0:30
    se = ones(10*i);
    image_erod = imerode(image,se);
    final_image = final_image + 0.1*image_erod;   
end

figure;
imshow(final_image);
figure;
imagesc(final_image);
colorbar


%% Question 5
% 'Find an algorithm that detect objects of ?image2.jpg?'


%% Morphological Filters

%% Question 6

image = imread('Images2.jpg');
image = not(image);

se1 = strel('disk',9); 

% se3 = ones(3)
% closed = closing(image,se3);
% figure(1);
% imshow(closed);

im_dilate =imdilate(image,se1);

opened = imopen(image,se1);
closed = closing(image,se1);

figure;
imshow(opened);

% figure;
% imshow(closed);
% 
white_hat = image - opened;
black_hat = closed - image;
% 
figure;
imshow(black_hat);


%% Question 7

image = imread('Images2.jpg');
im_sandp = imnoise(image,'salt & pepper');

imshow(im_sandp);

%% 8
image = imread('pleiades.bmp');
grayscale = rgb2gray(image);
im_sandp2 = imnoise(grayscale,'salt & pepper');
figure;
imshow(image);
figure;
imshow(im_sandp2);

se = strel('disk',1);
se2 = strel('disk',2);

eroded = imerode(im_sandp2,se);
dilated = imdilate(im_sandp2,se);

%finalImage = gray2rgb(imdilate(eroded,se2));

figure;
imshow(eroded);
figure;
imshow(dilated);
figure;
imshow(imdilate(eroded,se));

% on peut aussi faire la petite technique am?ricaine qui consiste ? faire
% une ouverture sur chaque composante RGB wallah

%%

image = imread('pleiades.bmp');
im_sandp2 = imnoise(image,'salt & pepper');

se = strel('disk',1);
se2 = strel('disk',2);

figure;
imshow(imopen(im_sandp2,se2));


%% Q9
image = imread('cameraman.tif');
se1 = strel('disk',15); 

opened = imopen(image,se1);
closed = closing(image,se1);

white_hat = image - opened;
black_hat = closed - image;

figure(13);
imshow(white_hat);
figure(14);
imshow(black_hat);

%% Q10

BW = imread('Diplo1.gif');
%BW = not(BW);
BW3 = bwmorph(BW,'skel',Inf);
figure;
imshow(BW3);

%% Q11

BW = imread('blood1.png');
figure;
imshow(BW);
se = strel('disk',4);
blood = imopen(BW,se);
blood = blood>80;
blood = not(blood);
figure;
imshow(blood);
blood = imfill(blood,'holes');
figure;
imshow(blood);
blood = not(blood);
blood = imclose(blood,se);

BW2 = bwmorph(blood,'skel',Inf);
figure;
imshow(blood);
figure;
imshow(BW2);
