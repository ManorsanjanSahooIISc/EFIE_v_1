function area=compute_area(node1_xyz,node2_xyz,node3_xyz)

node2_xyz(1:3)=node2_xyz(1:3)-node1_xyz(1:3);
node3_xyz(1:3)=node3_xyz(1:3)-node1_xyz(1:3);

temp = cross(node2_xyz,node3_xyz);


area=sqrt(temp(1)^2 + temp(2)^2 + temp(3)^2)*0.5;
return;