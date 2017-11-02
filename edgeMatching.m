function [label, accuracyScore] = edgeMatching(query)
% @param query: a nxmx3 image 
% @return label: a string label of the image that has the most similar edge as the query image 
% @return accuracyScore: a score between 0 and 1 of the accuracy of the label to the query

%% Find the edge map of the query image 
edgeMap = cannyEdge(query); 

%% Crop the query image
croppedEdgeMap = cropEdgeMap(edgeMap); 

%% Scale down the query image to a given scale 
scale = [200,200];
croppedEdgeMap = imresize(croppedEdgeMap, scale); 

%% Import the images for the library 
imagefiles = dir('library/*.jpg');      
nfiles = length(imagefiles);
images = cell(nfiles,1); 
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(strcat('library/',currentfilename));
   images{i} = currentimage;
end

%% Get the edge maps for the library and label everything 
%libraryOfEdgeMaps is a px1 cell array of cropped and scaled edge maps 
%labelsOfLibrary is a px1 vector of labels for each edge map in the libraryOfEdgeMaps
[libraryOfEdgeMaps] =  createLibraryForEdgeMapping(images, scale);
labelsOfLibrary = {"Accupril", "Accupril",  "Advil C&S", "Iboprufen", "Iboprufen", "Iboprufen", "Vicodin", "Vicodin", "Vicodin"}; %emember px1 not 1xp! 
labelsOfLibrary = string(labelsOfLibrary);
%% Loop over all the images in our library and find the one with the smallest cost 
minCost = 1000000000; 
maxCost = 0; 
bestMatchLabel='';
for index = 1:size(libraryOfEdgeMaps,1)
    libraryEdgeMap = libraryOfEdgeMaps{index};
    cost = computeCostOfDifference(croppedEdgeMap,libraryEdgeMap); 
    %if the cost of this image is lowest, assign it to the closest edge map
    %seen so far 
    if (cost < minCost)
        minCost = cost; 
        bestMatchLabel = labelsOfLibrary(index,1); 
    end 
    % find the maxCost to find the accuracy score 
    if (cost > maxCost)
        maxCost = cost; 
    end 
end 

%% Return the label of the library image with it's accuracy score 
label = bestMatchLabel;
%accuracy score should be between 0 and 1
accuracyScore = cost / maxCost; 
end