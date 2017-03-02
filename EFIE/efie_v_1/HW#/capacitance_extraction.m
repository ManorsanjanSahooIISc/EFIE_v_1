function [capacitance, z_mom , v_mom , sigma_mom ] = capacitance_extraction(node_list,patch_list)

no_of_conductors = evaulate_no_of_conductors(patch_list(:,4));

z_mom = mom_filler(patch_list,node_list);

v_mom = source_generator(patch_list(:,4),no_of_conductors);
k = 4*pi*8.857e-12;
sigma_mom = k*inv(z_mom)*v_mom;

capacitance = zeros(no_of_conductors,no_of_conductors);
for i = 1: no_of_conductors
    capacitance(i,:) = evalutate_charge(sigma_mom(:,i),patch_list,node_list,no_of_conductors);
end