dogimage=imread("dog.jpg");
imshow(dogimage);
brightdog=imlocalbrighten(dogimage)
imshowpair(dogimage,brightdog,"montage")

