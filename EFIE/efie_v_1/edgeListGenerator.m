%% -------- All Edge List Generator -------- %%
function edgeList = edgeListGenerator(patchList)
numPatches = size(patchList);

% patchNodes =  zeros(numPatches,3);
% numNodes = fopen('../workingDirectoryPath/patchList8.txt','r');
%     for i = 1:patchListSize
%         patchNodes(:,i) = fgtl(numNodes);
%     end
% fclose(numNodes);
 %  mesh (nodeList)
%  mesh(patchList)
edgeListSize = numPatches*3;
edgeList = zeros(edgeListSize , 3);

for i = 1:3:edgeListSize
    if (i==1)
        k=1;
    else
    k =  round(i/3) +1;
    end
    for j = 1:3
        if (j==3)
%         edgeList(i,1) = nodeList(patchList(i,j));
%         edgeList(i,2) = nodeList(patchList(i,j-2));
            edgeList(i+j-1,1) = patchList(k,j);
            edgeList(i+j-1,2) = patchList(k,j-2);
            edgeList (i+j-1,3) = k;
        
         else
            edgeList(i+j-1,1) = patchList(k,j);
            edgeList(i+j-1,2) = patchList(k,j+1);
            edgeList (i+j-1,3) = k;
%         i = i+3;
%         edgeList(i,1) = nodeList(patchList(i,j));
%         edgeList(i,2) = nodeList(patchList(i,j+1));
        end
    end
end