function rho = compute_rho(observer_a,observer_b,observer_c,source_a,source_b,source_c)
observer_centroid = 1/3*(observer_a + observer_b + observer_c);
temp_a = (observer_centroid - source_a);
temp_b = (source_a - source_b);
temp_c = (source_a - source_c);
normal_vector = cross(temp_b,temp_c);
rho = observer_centroid - (dot(temp_a,normal_vector))*normal_vector;