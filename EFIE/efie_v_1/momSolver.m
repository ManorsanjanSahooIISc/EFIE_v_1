%% ----------------MOM Solver ---------------------%%
function chargeDensity = momSolver(numEdges, momMatrix, edgeList, numConductor)

potential = zeros(numEdges, numConductor);
    for condNo = 1:numConductor
       
        for patchNo = 1:numEdges
            
            if (edgeList(patchNo,4) == condNo)
                potential(patchNo,condNo) = 1;
            end
        end
   end
chargeDensity = inv(momMatrix) * potential;