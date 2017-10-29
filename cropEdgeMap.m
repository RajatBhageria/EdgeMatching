function [croppedEdgeMap] = cropEdgeMap(edgeMap)
% @param edgeMap: a nxm edge map 
% @return croppedEdgeMap: a pxq edge map with zero padding 

[n,m] = size(edgeMap); 

minI = n; 
maxI = 0; 

minJ = m; 
maxJ = 0; 

for i = 1:n
    for j = 1:m
        currentPixelVal = edgeMap(i,j);
        if (currentPixelVal==1)
            if (i <= minI)
                minI = i; 
            end
            if (i >= maxI)
                maxI = i; 
            end 
            if (j <= minJ)
                minJ = j; 
            end 
            if (j >= maxJ)
                maxJ = j; 
            end 
        end 
    end 
end 

xmin = minJ;
width = maxJ - minJ;

ymin = minI; 
height = maxI - minI; 

rect = [xmin, ymin, width, height]; 
% 
% figure;scatter(minJ,minI);
% hold on; scatter(minJ,-height); 
% hold on ; scatter(maxJ,-height); 
% hold on; scatter(width, maxI); 

croppedEdgeMap = imcrop(edgeMap, rect); 
end


