function [cost] = computeCostOfDifference(croppedEdgeMap, libraryEdgeMap)
% @param: croppedEdgeMap: a cropped and scaled nxm edge map of the query image 
% @return: libraryEdgeMap: a edge map in the library of labeled edge maps 
% @return: cost: the cost between the croppedEdgeMap and croppedEdgeMap

%assuming both input images will be the same size
[n,m] = size(croppedEdgeMap);

[x,y] = meshgrid(1:m,1:n);
lib_points = [x(libraryEdgeMap==1),y(libraryEdgeMap==1)];
query_points = [x(croppedEdgeMap==1),y(croppedEdgeMap==1)];
[~,d] = dsearchn(lib_points, query_points);

cost = sum(d.^2)/size(d,1);


end