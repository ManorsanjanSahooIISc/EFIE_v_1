
function MoM_entry=ana_rowbyR(node1_xyz,node2_xyz,node3_xyz,point_xyz);

dummy=[0 0 0];
MoM_entry=[0 0 0];

copy_node1=node1_xyz;
copy_node2=node2_xyz;
copy_node3=node3_xyz;
area_source=compute_area(node1_xyz,node2_xyz,node3_xyz);
node2_xyz(1:3)=node2_xyz(1:3)-node1_xyz(1:3);  
node3_xyz(1:3)=node3_xyz(1:3)-node1_xyz(1:3);
node1_xyz(1:3)=point_xyz(1:3)-node1_xyz(1:3);	% Forms V01


% Finds unit vector n with direction and find d 
area_array(1)=cross_mult(node2_xyz(2:3),node3_xyz(2:3));
area_array(2)=cross_mult([node2_xyz(3) node2_xyz(1)],[node3_xyz(3) node3_xyz(1)]);
area_array(3)=cross_mult(node2_xyz(1:2),node3_xyz(1:2));

unit_n(1:3)=-area_array(1:3)/(area_source*2);

dot_prod=node1_xyz.*unit_n;
d=sum(dot_prod);

% Finding the point r' on the plane of the source triangle 
centroid_on_plane(1:3)=point_xyz(1:3)-(d*unit_n(1:3));
d=abs(d);



% Calculate the contribution of each edge 
for i=1:3
   flag=1;
   % Prepare process nodes for the loop
   if(i==1)
   	process_nodes(1,1:3)=copy_node1(1:3);
   	process_nodes(2,1:3)=copy_node2(1:3);
   elseif(i==2) 
      process_nodes(1,1:3)=copy_node2(1:3);
      process_nodes(2,1:3)=copy_node3(1:3);
   else
      process_nodes(1,1:3)=copy_node3(1:3);
      process_nodes(2,1:3)=copy_node1(1:3);
   end;
   % Find R_plus 
   control(1:3)=process_nodes(1,1:3)-point_xyz(1:3);
   R_plus=compute_distance(control,dummy);
   % Find R_minus
   control(1:3)=process_nodes(2,1:3)-point_xyz(1:3);
   R_minus=compute_distance(control,dummy);
   % Find P_plus and P_minus 
   P_plus(1:3)=process_nodes(1,1:3)-centroid_on_plane(1:3);
   P_minus(1:3)=process_nodes(2,1:3)-centroid_on_plane(1:3);
   % Find unit_l 
   distance=compute_distance(process_nodes(1,1:3),process_nodes(2,1:3));
   unit_l(1:3)=(process_nodes(1,1:3)-process_nodes(2,1:3))/distance;
   % Find L_plus and L_minus 
   L_plus=dot(P_plus,unit_l);
   L_minus=dot(P_minus,unit_l);
   % Find unit_u 
   unit_u=cross(unit_l,unit_n);
   % Find P0 and R0 
   P0=dot(P_plus,unit_u);
   if(P0<0) 
      P0=P0*-1;
   end;
   sq_R0=(P0*P0)+(d*d);
   if((R_minus+L_minus)>=1.0e-10)
      T1=sq_R0*log((R_plus+L_plus)/(R_minus+L_minus));
   else
      T1=0;
   end;
   
   %if(P0<1.0e-6)
   %  if(sq_R0<1.0e-8)
   %     T1=0;
   %  end;
   %end;
   % Calculate the part terms used in integration
   T2=(L_plus*R_plus)-(L_minus*R_minus);   
	MoM_entry=MoM_entry+(unit_u*0.5*(T1+T2));
end
return;