%(1)Create an Image Datastore
%The imageDatastore function creates an image datastore for all the image files in a folder but won't load them into memory until they are requested.
folder_path='D:\image processing matlab onramp\localfolder'
imds=imageDatastore(folder_path)
img=read(imds);
imshow(img)

%You can access the datastore's properties by using a period (.).
%ds.Folders
%The above code accesses the Folders property of the datastore ds.
imds_properties=imds.Files
imds_properties1=imds.Folders
%You can use the numel function to find the total number of elements in an array.
nFiles=numel(imds_properties)
%Image datastores have several functions that operate on them. For example, you can import all the images by using the readall function.
%Try reading and displaying one image from ds by using the read function.
%img = read(ds);
%imshow(img)

%(2)Read and Classify an Image

%The readimage function loads the nth image from an image datastore into the MATLAB workspace.
%img = readimage(ds,n);

