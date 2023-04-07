%Find Local Minima in a Signal
I=imread("receipt.jpg");
imshow(I)

[S,BW,BWstripes] = processImage(I); % Process the image to obtain a signal
montage({I,BW,BWstripes}) % Show the image


