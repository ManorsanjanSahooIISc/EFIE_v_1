function charge = evalutate_charge(sigma_mom,patch_list,node_list,no_of_conductors)

charge = zeros(1,no_of_conductors);

for i = 1 : size(patch_list,1)
    delta_charge = zeros(1,no_of_conductors);
    delta_charge(1,patch_list(i,4)) = compute_area(node_list((patch_list(i,1)),:),node_list((patch_list(i,2)),:),node_list((patch_list(i,3)),:))*sigma_mom(i);
    charge = charge + delta_charge; 
end
