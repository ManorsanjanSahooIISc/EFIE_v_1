function integ = onebyr_one_pt_integ(node_sa,node_sb,node_sc, source_centroid, test_centroid)

length = compute_length(source_centroid,test_centroid);
area = compute_area(node_sa,node_sb,node_sc);

integ = area/length;
