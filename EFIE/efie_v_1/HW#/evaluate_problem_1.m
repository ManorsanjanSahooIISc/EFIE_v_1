function [J, node_list ,patch_list , e_list,mom] = evaluate_problem_1(freq,frac,discx,discy)

w = 2*pi*freq;

lamda = 3e8/freq;



[node_list, patch_list] = generate_mesh(frac*lamda,frac*lamda,discx,discy,0);

[e2p_list, p2e_list, e_list] = generate_edge_list(patch_list);

mom = mom_filler(patch_list,node_list,e_list,e2p_list,p2e_list,w);

[e_mom , ~] = source_generator(node_list,patch_list,e_list,e2p_list,w,1,0,0,0);

J = inv(mom)*e_mom;


