A1 = imread("dog.jpg");
imshow(A1)
sz = size(A1)

Amax = max(Ig,[],"all") %Using the "all" option finds the maximum across all values in the array. The brackets are required; they are placeholders for an unused inpu
Amin = min(Ig,[],"all") %You can find the smallest value in an array using the min function.


%Many common tasks can be completed more quickly using functions in Image Processing Toolbox. For example, to extract all three color planes of an image array, you can use imsplit instead of indexing into each plane individually.
[R,G,B] = imsplit(A1);
%You can display all three color planes at once using montage.
montage({R,G,B})