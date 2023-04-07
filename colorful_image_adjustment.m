A1 = imread("dog.jpg");
imshow(A1)
brightA1=imlocalbrighten(A1);
imshowpair(A1,brightA1,"montage")