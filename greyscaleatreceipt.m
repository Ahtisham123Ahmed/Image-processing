A1=imread("receipt.jpg");
imshow(A1)
sz=size(A1)
%You can convert an image to grayscale using the im2gray function.
A1gs = im2gray(A1);
imshow(A1gs);
%This negligible loss of information has a benefit: gs is one third the size of I, having only two dimensions instead of three. 
sz=size(A1gs)
%If you need your converted grayscale images later, you can save them to a file. Try using imwrite to save gs to the file A1gs.jpg.
imwrite(A1gs,"img.jpg")
