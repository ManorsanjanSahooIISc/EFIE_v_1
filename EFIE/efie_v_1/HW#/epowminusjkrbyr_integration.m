function integ = epowminusjkrbyr_integration(node_sa,node_sb,node_sc,node_ta,node_tb,node_tc,k)

test_centroid = (1/3)*(node_ta+node_tb+node_tc);

% integration of (epowjkr-1)/r

area = compute_area(node_sa,node_sb,node_sc);
weight=[0.225 0.13239415278851 0.13239415278851 0.13239415278851 0.12593918054483 0.12593918054483 0.12593918054483];
factor = 0;
for i = 1 : 7
 source_pnt = compute_point(node_sa,node_sb,node_sc,i);
 distance = compute_length(source_pnt,test_centroid);
 if distance < 1e-12
        factor = factor + weight(i)*(-j*k);
 else
     factor = factor + weight(i)*((exp(-j*k*distance)-1)/distance);
     
 end
end

integ1 = area*factor;

integ2 = integrate_onebyr(node_sa,node_sb,node_sc,node_ta,node_tb,node_tc);

integ = integ1 + integ2;
