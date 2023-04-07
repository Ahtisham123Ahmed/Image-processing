A1=imread("receipt.jpg");
%imshow(A1);
%You can investigate the contrast in an image by viewing its intensity histogram using the imhist function.
A1gs = im2gray(A1);

imhist(A1gs)
%Increasing image contrast brightens brighter pixels and darkens darker pixels. You can use the imadjust function to adjust the contrast of a grayscale image automatically.
A1gsadj = imadjust(A1gs);
imshowpair(A1gs,A1gsadj,"montage")
%imhist(A1gsadj)

