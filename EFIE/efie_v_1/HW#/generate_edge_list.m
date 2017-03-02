function [edge2PatchList, patch2EdgeList, edgeList] = generate_edge_list(patchList)
for i = 1 : size(patchList,1)
    tempEdge(1,:) = [patchList(i,1) , patchList(i,2)];
    tempEdge(2,:) = [patchList(i,2) , patchList(i,3)];
    tempEdge(3,:) = [patchList(i,3) , patchList(i,1)];

    if (i == 1)
        tempEdgeList = tempEdge;
    else
    tempEdgeList = edge_validation(tempEdgeList, tempEdge);
    end
end
tempEdge2patchList = zeros(size(tempEdgeList,1),2);

for i = 1 : size(tempEdgeList,1)
    tempEdge2patchList(i , :) = e2p_filler(tempEdgeList(i,:), patchList);
end
j = 1;
for i = 1 : size(tempEdgeList,1)
   if (tempEdge2patchList(i,1) ~= tempEdge2patchList(i,2))
      edgeList(j,:) = tempEdgeList(i,:);
      j=j+1;
     end    
end

for i = 1 : size(edgeList,1)
    edge2PatchList(i , :) = e2p_filler(edgeList(i,:), patchList);
end

for i = 1 : size(patchList,1)
 patch2EdgeList(i,:) = p2e_filler(patchList(i,:),edgeList);
end