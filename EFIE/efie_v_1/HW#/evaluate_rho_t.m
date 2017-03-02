function rho_t = evaluate_rho_t(node_a,node_b,node_c,edge_a,edge_b)

rho_t = edge_a + edge_b - 2/3*(node_a+ node_b + node_c);