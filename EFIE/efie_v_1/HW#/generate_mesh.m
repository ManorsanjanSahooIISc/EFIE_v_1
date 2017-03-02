function [node_list, patch_list] = generate_mesh(length_x,breadth_y,no_of_disc_x,no_of_disc_y,x_location, y_location,z_location)

no_of_nodes = (no_of_disc_x +1) * (no_of_disc_y + 1);
no_of_triangle = (no_of_disc_x * no_of_disc_y )*2;

delta_x = length_x / no_of_disc_x ;
delta_y = breadth_y / no_of_disc_y ;

node_y = y_location;%-1*breadth_y/2 ;
node_z = z_location;

for j = 1 : no_of_disc_y+1
    node_x =x_location;% -.5*length_x;
    for i = 1: no_of_disc_x+1
        node_number = (j-1)*(no_of_disc_x + 1) + i;    
        node_list(node_number,:) = [ node_x,node_y,node_z ];
        node_x = node_x + delta_x;
    end
    node_y = node_y+delta_y ;
end

for j = 1 : no_of_disc_y
    for i = 1 : no_of_disc_x
        patch_list( (((j-1)*no_of_disc_x*2) + 2*i -1), :) = [ (i +(j-1)*(no_of_disc_x + 1)) , (j*(no_of_disc_x + 1) + i ), i+1+(j-1)*(no_of_disc_x + 1)];
        patch_list( ((j-1)*no_of_disc_x*2 + 2*i ), :) = [j*(no_of_disc_x + 1)+i ,j*(no_of_disc_x + 1)+i+1 , (i+1+(j-1)*(no_of_disc_x + 1))];
    end
end     