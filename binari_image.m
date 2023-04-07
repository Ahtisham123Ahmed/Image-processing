A1=imread("receipt.jpg");
%imshow(A1);
%You can investigate the contrast in an image by viewing its intensity histogram using the imhist function.
A1gs = im2gray(A1);

imhist(A1gs)
%Increasing image contrast brightens brighter pixels and darkens darker pixels. You can use the imadjust function to adjust the contrast of a grayscale image automatically.
A1gsadj = imadjust(A1gs);
imshowpair(A1gs,A1gsadj,"montage")
imhist(A1gsadj)
%When applied to arrays, logical operators like < and > generate arrays of the same size that contain logical values 1 (true) or 0 (false).

%You can use logical operators to threshold the intensity values of a grayscale image, creating a binary image.
BW_Logicoperator=A1gsadj>125;
imshow(BW_Logicoperator)

%To automate the threshold selection process, you can use the imbinarize function, which calculates the "best" threshold for the image.
BW_Auto=imbinarize(A1gsadj);
imshow(BW_Auto)
%You can have imbinarize look at smaller regions of the image and pick the best threshold for that region by passing the "adaptive" option as the second argument to imbinarize.
BW_adaptive=imbinarize(A1gsadj,"adaptive");
imshowpair(BW_Logicoperator,BW_adaptive,"montage")

%That doesn't seem to have helped. The text now appears completely washed out in black. What happened?
%By default, the foreground of an image is assumed to be bright and the background dark. But for receipts, the foreground is the dark text, and the background is bright.
%In imbinarize, you can designate whether the foreground is bright or dark by setting the "ForegroundPolarity" option.
gBinary = imbinarize(A1gsadj,"adaptive", ...
    "ForegroundPolarity","dark");
imshowpair(A1gsadj,gBinary,"montage")

