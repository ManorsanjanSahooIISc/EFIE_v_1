%% --------- Specifcation of Structure ------------%%
function [length_x,breadth_y,no_of_disc_x,no_of_disc_y,x_location,y_location,z_location] = userInptToGenerateNodePatchist()
length_x = input('Length');
breadth_y = input('Breadth');
no_of_disc_x = input('Enter Number of discretization in x');
no_of_disc_y = input('Enter Number of Discretization in y');

x_location = input('Enter starting location for x');
y_location = input('Enter starting location for y');
z_location = input('Enter starting Location for z');