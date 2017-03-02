function length_a = compute_length(node_x,node_y)
node_a = node_x - node_y;
length_a = (node_a(1)^2 + node_a(2)^2 + node_a(3)^2)^0.5;