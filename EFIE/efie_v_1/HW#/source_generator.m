function [e_mom , e_inc] = source_generator(node_list,patch_list,e_list,e2p_list,w,e_theta,e_phi,theta,phi)
e_mom = zeros(size(e_list,1),1);
k = w/(3*10^8);
e(1) = e_theta*cos(theta)*cos(phi) - e_phi*sin(phi);
e(2) = e_theta*cos(theta)*sin(phi) + e_phi*cos(phi);
e(3) = -e_theta*sin(theta);

for i = 1 : size(e_list,1)
centroid_1 = 1/3*( node_list(patch_list(e2p_list(i,1),1),:)+ node_list(patch_list(e2p_list(i,1),2),:)+ node_list(patch_list(e2p_list(i,1),3),:));
centroid_2 = 1/3*( node_list(patch_list(e2p_list(i,2),1),:)+ node_list(patch_list(e2p_list(i,2),2),:)+ node_list(patch_list(e2p_list(i,2),3),:));
angle_1 = centroid_1(1)*sin(theta)*cos(phi) + centroid_1(2)*sin(theta)*sin(phi) + centroid_1(3)*cos(theta);
angle_2 = centroid_2(1)*sin(theta)*cos(phi) + centroid_2(2)*sin(theta)*sin(phi) + centroid_2(3)*cos(theta);

expminusjkdotr1 = exp(j*k*angle_1)*cos(k*angle_1) -j*exp(j*k*angle_1)*sin(k*angle_1);
expminusjkdotr2 = exp(j*k*angle_2)*cos(k*angle_2) -j*exp(j*k*angle_2)*sin(k*angle_2);

e1 = e*expminusjkdotr1;
e2 = e*expminusjkdotr2;
e_inc(i,:) = [e1 e2];
vertex1 = node_list(patch_list(e2p_list(i,1),1),:)+ node_list(patch_list(e2p_list(i,1),2),:)+ node_list(patch_list(e2p_list(i,1),3),:) - node_list(e_list(i,1),:) - node_list(e_list(i,2),:);
length = compute_length(node_list(e_list(i,1),:) , node_list(e_list(i,2),:));

vertex2 = node_list(patch_list(e2p_list(i,2),1),:)+ node_list(patch_list(e2p_list(i,2),2),:)+ node_list(patch_list(e2p_list(i,2),3),:) - node_list(e_list(i,1),:) - node_list(e_list(i,2),:);

rho_1 = centroid_1 - vertex1;

rho_2 = centroid_2 -vertex2;

e_mom(i,1) = 0.5*length*(-dot(rho_1,e1) + dot(rho_2,e2));
end
