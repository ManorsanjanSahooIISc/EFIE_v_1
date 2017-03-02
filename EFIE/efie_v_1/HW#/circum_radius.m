function circum_r = circum_radius(node_x,node_y,node_z)


length_a = compute_distance(node_x,node_y);
length_b = compute_distance(node_y,node_z);
length_c = compute_distance(node_z,node_x);

circum_r = (length_a * length_b * length_c)/((length_a + length_b + length_c)*(length_a + length_b - length_c)*(length_a - length_b + length_c)*(length_c + length_b - length_a))^0.5;
