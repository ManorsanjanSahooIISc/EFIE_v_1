close all;
clear all;
clc;

nodeList = load('../workingDirectoryPath/nodeList_3D.txt');
patchList = load('../workingDirectoryPath/patchList_3D.txt');

edgeList = edgeListGenerator(patchList);
sharedEdgeList = sharedEdgeListGenerator(edgeList);
numsharedEdgeLists = size(sharedEdgeList);
edgeListLength = zeros (numsharedEdgeLists,1);
for i = 1:numsharedEdgeLists
sharedEdgeListLength = sqrt((nodeList(sharedEdgeList(i,1),1) - nodeList(sharedEdgeList(i,2),1))^2 + (nodeList(sharedEdgeList(i,1),2) - nodeList(sharedEdgeList(i,2),2))^2 + (nodeList(sharedEdgeList(i,1),3) - nodeList(sharedEdgeList(i,2),3))^2);
edgeListLength(i) = sharedEdgeListLength;
end
 momMatrix = momFiller(sharedsharedEdgeLists,numsharedEdgeLists,nodeList,patchList);
% 
% chargeDensity = momSolver(numsharedEdgeLists, momMatrix, sharedEdgeListList, numConductor);
% 
% capMat = capacitanceMatrix(numConductor, patchList, nodeList, numPatchs, chargeDensityMatrix);

 