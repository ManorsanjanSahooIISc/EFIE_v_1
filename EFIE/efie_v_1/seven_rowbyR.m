
function MoM_entry=seven_pt_integration(node1_xyz,node2_xyz,node3_xyz,point_xyz);

format long;
source_centroid(1:3)=(node1_xyz(1:3)+node2_xyz(1:3)+node3_xyz(1:3))/3;
area_source=compute_area(node1_xyz,node2_xyz,node3_xyz);

copy_node1=node1_xyz;

node2_xyz(1:3)=node2_xyz(1:3)-node1_xyz(1:3);  
node3_xyz(1:3)=node3_xyz(1:3)-node1_xyz(1:3);
node1_xyz(1:3)=node1_xyz(1:3)-point_xyz(1:3);	% Forms V01


% Finds unit vector n with direction and find d 
area_array(1)=cross_mult(node2_xyz(2:3),node3_xyz(2:3));
area_array(2)=cross_mult([node2_xyz(3) node2_xyz(1)],[node3_xyz(3) node3_xyz(1)]);
area_array(3)=cross_mult(node2_xyz(1:2),node3_xyz(1:2));

unit_n(1:3)=area_array(1:3)/(area_source*2);

dot_prod=node1_xyz.*unit_n;
d=sum(dot_prod);

if d<0
   d=d*-1;
else
   unit_n(1:3)=unit_n(1:3)*(-1);
end;

% Finding the point r' on the plane of the source triangle 
centroid_on_plane(1:3)=point_xyz(1:3)-(d*unit_n(1:3));

MoM_entry=[0 0 0];
% The 7 point integration values 
weight=[0.225 0.13239415278851 0.13239415278851 0.13239415278851 0.12593918054483 0.12593918054483 0.12593918054483];
xsi=[0.3333333 0.0597158 0.470142 0.470142 0.7974269 0.1012865 0.1012865];
eta=[0.3333333 0.470142 0.0597158 0.470142 0.1012865 0.7974269 0.1012865];

for i=1:7
	point(1:3)=((eta(i)*node2_xyz(1:3))+(xsi(i)*node3_xyz(1:3)))+copy_node1(1:3);
	distance=compute_distance(point_xyz,point);
	MoM_entry=MoM_entry+((point-centroid_on_plane)*(1/distance)*weight(i));
end
MoM_entry=MoM_entry*area_source;
return;
