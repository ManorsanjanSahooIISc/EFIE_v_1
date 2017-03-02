function integ = integrate_rhobyr(node_sa,node_sb,node_sc,node_ta,node_tb,node_tc)

source_centroid = (1/3)*(node_sa + node_sb + node_sc);
test_centroid = (1/3)*(node_ta+node_tb+node_tc);

source_circum_r = circum_radius(node_sa,node_sb,node_sc);

diff_centroids = compute_length(source_centroid,test_centroid);  

p_rho = compute_rho(node_ta,node_tb,node_tc,node_sa,node_sb,node_sc);


if diff_centroids > 10 * source_circum_r
   integ = rhobyr_one_pt_integ(p_rho,node_sa,node_sb,node_sc,test_centroid);

elseif diff_centroids > 3* source_circum_r
   integ = rhobyr_seven_pt_integ(p_rho,node_sa,node_sb,node_sc,test_centroid);
else 
    integ = rhobyr_anal_integration(node_sa,node_sb,node_sc,test_centroid);
end