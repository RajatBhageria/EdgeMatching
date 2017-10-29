function [libraryOfEdgeMaps] = createLibraryForEdgeMapping(images, scale)
%% @param images: a px1 cell array of images 
%% @param scale: a 2x1 matrix of the new dimensions of each image after scaling 
%% @return libraryOfEdgeMaps: a px1 cell array of images 
%% Items in libraryOfEdgeMaps and labelsOfLibrary correspond to each other 

%% crop all the images 
images{1:size(images,1)} = cropEdgeMap(images{1:size(images,1)});

%% Scale all the images to 100x100
images{1:size(images,1)} = images{imresize(images{1:size(images,1)}, scale)};

%% Return the libraryOfEdgeMaps
libraryOfEdgeMaps = images; 
end

