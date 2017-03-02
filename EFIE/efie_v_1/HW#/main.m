%% --------- main function for EFIE------------------- %%
clear all; 
close all;
clc; tic;
[nodeList, patchList] = nodePatchGenerator();
if (nodeList == 0)
    return;
end
[edgeToPatchList, patchToEdgeList, edgeList] = generate_edge_list(patchList);
freq = input('Enter frequency');
lambda = c/f;
omega = 2*pi*freq;
z_Matrix = mom_filler(patchList, nodeList, edgeList, edgeToPatchList, patchToEdgeList,omega);


 

toc;