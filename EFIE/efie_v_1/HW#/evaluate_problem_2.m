function [x admittance] = evaluate_problem_2()

[node_list, patch_list] = generate_mesh(74.2e-3,1e-3,40,1,0);

[e2p_list p2e_list e_list] = generate_edge_list(patch_list);


for i = 1: 20
i
lamda = 74.2e-3/(i*.1);    
freq = 3e8/lamda;
w = 2*pi*freq;
mom = mom_filler(patch_list,node_list,e_list,e2p_list,p2e_list,w);
e_mom = zeros(size(mom,2),1);
e_mom(40,1) = 1e-3;
J = inv(mom)*e_mom;
admittance(i,1) = J(40,1)*1e-3;
x(i,1) = 74.2e-3/lamda;
end
