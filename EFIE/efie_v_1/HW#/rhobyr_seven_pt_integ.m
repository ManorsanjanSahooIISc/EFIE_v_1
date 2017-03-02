function integ = rhobyr_seven_pt_integ(p_rho,node_sa,node_sb,node_sc,test_centroid)
area = compute_area(node_sa,node_sb,node_sc);
weight=[0.225 0.13239415278851 0.13239415278851 0.13239415278851 0.12593918054483 0.12593918054483 0.12593918054483];
factor = [0 0 0];
for i = 1 : 7
 source_pnt = compute_point(node_sa,node_sb,node_sc,i);
 distance = compute_length(source_pnt,test_centroid);
 factor = factor + (weight(i)/distance)*(source_pnt - p_rho);
end

integ = area*factor;