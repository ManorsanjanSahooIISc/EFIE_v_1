function [constant_vp, constant_sp]= evaluate_constant(source_a,source_b,test_a,test_b,source_area,test_area,w)

length_source = compute_length(source_a,source_b);
length_test = compute_length(test_a,test_b);
mu = 4*pi*1e-7;
epcilon = 8.857e-12;

K = length_source*length_test/(source_area*test_area);
constant_vp = i*w*mu/(16*pi)*K;
constant_sp = K/(i*w*4*pi*epcilon);