function [cost] = computeCostOfDifference(croppedEdgeMap, libraryEdgeMap)
% @param: croppedEdgeMap: a cropped and scaled nxm edge map of the query image 
% @return: libraryEdgeMap: a edge map in the library of labeled edge maps 
% @return: cost: the cost between the croppedEdgeMap and croppedEdgeMap

lib_points = (libraryEdgeMap==1);
query_points = (croppedEdgeMap==1);
[~,d] = dsearchn(lib_points, query_points);

cost = sum(d);


end

