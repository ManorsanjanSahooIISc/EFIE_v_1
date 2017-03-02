function integ = rhobyr_one_pt_integ(p_rho,source_a,source_b,source_c,observer_centroid)
source_centroid = 1/3*(source_a + source_b + source_c);
length = compute_length(source_centroid,observer_centroid);
area = compute_area(source_a,source_b,source_c);
integ = (area/length)*(source_centroid-p_rho);