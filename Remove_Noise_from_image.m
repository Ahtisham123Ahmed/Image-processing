A1=imread("receipt.jpg");
imshow(A1);
%You can investigate the contrast in an image by viewing its intensity histogram using the imhist function.

A1gs = im2gray(A1);
A1gsadj = imadjust(A1gs);
gBinary = imbinarize(A1gsadj,"adaptive", "ForegroundPolarity","dark");
%imshowpair(A1gsadj,gBinary,"montage")
%o reduce the impact of this noise on the binary image, you can preprocess the image with an averaging filter.
%Use the fspecial function to create an n-by-n averaging filter.
F = fspecial("average",3)
%You can apply a filter F to an image I by using the imfilter function.
A1_fltr = imfilter(A1gsadj,F);
A1_smooth_filter=imbinarize(A1_fltr,"adaptive","ForegroundPolarity","dark");
imshowpair(gBinary,A1_smooth_filter,"montage")

%If you look closely, you can see that filtering introduced a small, unwanted dark outline to parts of the binary image border. The reason is that the default setting of imfilter sets pixels outside the image to zero.
%To adjust this behavior, use the "replicate" option.
Ifltr = imfilter(A1gsadj,F,"replicate");
BWsmooth = imbinarize(Ifltr,"adaptive","ForegroundPolarity","dark");
%row sum procedure
A1gsadj_row_sums = sum(A1gsadj, 2);
plot(A1gsadj_row_sums)
BWsmooth_row_sums = sum(BWsmooth, 2);
%plot(A1gsadj_row_sums)

%------------------------------------------------------------------------------------%

%In a receipt image, the background is anything that is not text. By using a structuring element larger than a typical letter, each "window" captures what's behind the text and not the text itself.
%You can create a structuring element by using the strel function.
SE = strel("disk",8)
%To perform a closing operation on an image I with structuring element SE, use the imclose function.
A1gsadj_close_background=imclose(A1gsadj,SE);
imshow(A1gsadj_close_background)
image_without_bg= (A1gsadj_close_background-A1gsadj);
imshow(image_without_bg)
%-----------------------------------------------------------------------------------------%
%Did you notice anything strange about gsSub?
%The subtraction in the previous task inverted the intensities, so the text appears white and the background black. To restore the original order, invert the image again.
%First, generate the binary image using imbinarize. Then invert the result using the NOT operator (~). 
BWsub = ~imbinarize(image_without_bg);
imshow(BWsub)
%Enhancing Patterns 
%The background subtraction process you used doesn't remove the grid in the background of this receipt. The grid pattern is too thin to be included in the background generated by the closing operation.
%Morphological operations are useful not only for removing features from an image but also for augmenting features. You can use morphology to enhance the text in the binary image and improve the row sum signal.
%Morphological opening expands the dark text regions, while closing diminishes them. Increasing the size of the structuring element increases these effects.
%You can create a rectangular structuring element using strel with a size array in the format [height width]

SE = strel("rectangle",[3 25]);
 %in the previous section, to isolate the background, you eliminated the dark text by emphasizing the bright regions. To do this, you used imclose to close the image.
%Here, emphasize the dark text instead, so perform the opposite operation and open the image using imopen.
BWstripes=imopen(BWsub,SE);
imshow(BWstripes)
%You can analyze whether the opening operation has improved the image processing algorithm by plotting the row sum.
SUM_STRIPES=sum(BWstripes,2);
plot(SUM_STRIPES)
%The improvement is more noticeable if you plot the original row sum signal alongside the opened image row sum.
BWsub_SUM=sum(BWsub,2);
hold on
plot(BWsub_SUM)
hold off
