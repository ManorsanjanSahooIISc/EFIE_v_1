function point = compute_point(node_sa,node_sb,node_sc,i)
xsi=[0.3333333 0.0597158 0.470142 0.470142 0.7974269 0.1012865 0.1012865];
eta=[0.3333333 0.470142 0.0597158 0.470142 0.1012865 0.7974269 0.1012865];
point = node_sa + xsi(i)*(node_sb-node_sa) + eta(i)*(node_sc - node_sa);
