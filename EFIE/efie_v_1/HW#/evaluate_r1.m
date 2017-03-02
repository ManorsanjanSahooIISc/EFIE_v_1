function r1 = evaluate_r1(node_a,node_b,node_c,edge_a,edge_b,rho)

r1 = node_a + node_b +node_c - edge_a - edge_b - rho;