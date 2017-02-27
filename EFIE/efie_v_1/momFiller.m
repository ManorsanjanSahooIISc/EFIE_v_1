%% --------MOM Filler-----------------------%%
function momMatrix = momFiller(edge,numEdges,node,patch)

momMatrix = zeros(numEdges,numEdges);
for i = 1:numEdges
    edgeLength = sqrt((node(edge(i,1),1) - node(edge(i,2),1))^2 + (node(edge(i,1),2) - node(edge(i,2),2))^2 + (node(edge(i,1),3) - node(edge(i,2),3))^2);
    for j = 1:numEdges
        
    end
%     momMatrix = 
end