function [nodeList, patchList] = nodePatchGenerator()
Statement = ('Press 1 to generate own nodePatchList, Press 2 for given nodePatchList');
Instruction = input(Statement);
if (Instruction == 1)
    [length_x,breadth_y,no_of_disc_x,no_of_disc_y,x_location,y_location,z_location] = userInptToGenerateNodePatchist();
    [nodeList, patchList] = generate_mesh(length_x, breadth_y, no_of_disc_x, no_of_disc_y, x_location, y_location, z_location);

elseif (Instruction == 2)
    [nodeList, patchList] = givenNodePatchList();

else
    x = fprintf('You have entered wrong option, try once more!');
    disp(x);
    nodeList = 0;
    patchList = 0;
    return ;
end