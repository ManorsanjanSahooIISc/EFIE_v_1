function [integ , p_rho] = rhoepowminusjkrbyr_integration(node_sa,node_sb,node_sc,node_ta,node_tb,node_tc,k)

test_centroid = (1/3)*(node_ta+node_tb+node_tc);

% integration of (epowjkr-1)/r

area = compute_area(node_sa,node_sb,node_sc);
weight=[0.225 0.13239415278851 0.13239415278851 0.13239415278851 0.12593918054483 0.12593918054483 0.12593918054483];
factor = [0 0 0];

p_rho = compute_rho(node_ta,node_tb,node_tc,node_sa,node_sb,node_sc);

for ind = 1 : 7
 source_pnt = compute_point(node_sa,node_sb,node_sc,ind);
 distance = compute_length(source_pnt,test_centroid);
 rho = source_pnt - p_rho;
 if distance < 1e-12
        factor = factor + weight(ind)*(-j*k)*rho;
 else
     factor = factor + weight(ind)*((exp(-j*k*distance)-1)/distance)*rho;
     
 end
end

integ1 = area*factor;

integ2 = integrate_rhobyr(node_sa,node_sb,node_sc,node_ta,node_tb,node_tc);

integ = integ1 + integ2;