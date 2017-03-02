function integ = tstintegrate(node_sa,node_sb,node_sc,test_centroid)

sorce_centroid = (1/3)*(node_sa + node_sb + node_sc);


integ(1,1) = one_pt_integ(node_sa,node_sb,node_sc,sorce_centroid,test_centroid);
integ(1,2) = seven_pt_integ(node_sa,node_sb,node_sc,test_centroid);
integ(1,3) = anal_integration(node_sa,node_sb,node_sc,test_centroid);


