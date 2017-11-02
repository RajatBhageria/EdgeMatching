function [libraryOfEdgeMaps] = createLibraryForEdgeMapping(images, scale)
%% @param images: a px1 cell array of images 
%% @param scale: a 2x1 matrix of the new dimensions of each image after scaling 
%% @return libraryOfEdgeMaps: a px1 cell array of images 
%% Items in libraryOfEdgeMaps and labelsOfLibrary correspond to each other 

for image = 1:size(images,1)
    %% crop all the images
    images{image,1} = cropEdgeMap(images{image,1});
    
    %% Scale all the images to 100x100
    images{image,1} = imresize(images{image,1},scale);
    
    %% Do cann
    images{image,1} = cannyEdge(images{image,1}); 
end 

%% Return the libraryOfEdgeMaps
libraryOfEdgeMaps = images; 
end

