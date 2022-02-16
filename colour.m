I = imread('C:\Users\ACER\Desktop\enchroma.jpg');
figure(1)
imshow(I)
redthresh = 0.05;       %set red threshold
greenthresh = 0.025;    %set green threshold

red  = imsubtract(I(:,:,1), rgb2gray(I));   %next two lines extract the red parts of the image using thresholding
red = im2bw(red, redthresh);                        %output image has red parts as white in the binary image
red = im2uint8(red);                                %converts the image to a uint8 class if its not already in it
      
green  = imsubtract(I(:,:,2), rgb2gray(I)); %similarly as above for green color
green = im2bw(green, greenthresh);
green = im2uint8(green);
                
temp = imsubtract(green, red);                      %next two lines compute the common region where there is both red and green color
temp = imsubtract(green, temp);
temp = logical(temp);                               %converts the image class to logical

boundary = bwboundaries(temp);

figure(2)
imshow(I)
hold on;
visboundaries(boundary,'Color','black')
