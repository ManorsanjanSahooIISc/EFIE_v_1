function mom = mom_filler(patch_list, node_list, e_list, e2p_list, p2e_list,w)
mom = zeros(size(e_list, 1), size(e_list, 1));

k = w/(3*10^8);
for source = 1 : size(patch_list,1)
    for test = 1 : size(patch_list,1)
        
       scalar_integ = epowminusjkrbyr_integration(node_list(patch_list(source,1),:),node_list(patch_list(source,2),:),node_list(patch_list(source,3),:),node_list(patch_list(test,1),:),node_list(patch_list(test,2),:),node_list(patch_list(test,3),:),k);
       [vector_integ , p_rho] = rhoepowminusjkrbyr_integration(node_list(patch_list(source,1),:),node_list(patch_list(source,2),:),node_list(patch_list(source,3),:),node_list(patch_list(test,1),:),node_list(patch_list(test,2),:),node_list(patch_list(test,3),:),k);
       source_area = compute_area(node_list(patch_list(source,1),:),node_list(patch_list(source,2),:),node_list(patch_list(source,3),:));
       test_area = compute_area(node_list(patch_list(test,1),:),node_list(patch_list(test,2),:),node_list(patch_list(test,3),:));
        for i = 1 : 3
            for j = 1 : 3
            
                if (p2e_list(test,i) ~= 0 && p2e_list(source,j) ~= 0)
                    a = find(e2p_list(p2e_list(source,j),:) == source);
                    b = find(e2p_list(p2e_list(test,i),:) == test);
                    flag1 = (-1)^(a+1);
                    flag2 = (-1)^(b+1);
                    [constant_vp, constant_sp] = evaluate_constant(node_list(e_list(p2e_list(source,j),1),:),node_list(e_list(p2e_list(source,j),2),:),node_list(e_list(p2e_list(test,i),1),:),node_list(e_list(p2e_list(test,i),2),:),source_area,test_area,w);
                    rho_t = evaluate_rho_t(node_list(patch_list(test,1),:),node_list(patch_list(test,2),:),node_list(patch_list(test,3),:),node_list(patch_list(test,find(patch_list(test,:)==e_list(p2e_list(test,i),1))),:),node_list(patch_list(test,find(patch_list(test,:)==e_list(p2e_list(test,i),2))),:));
                    r1 = evaluate_r1(node_list(patch_list(source,1),:),node_list(patch_list(source,2),:),node_list(patch_list(source,3),:),node_list(patch_list(source,find(patch_list(source,:)==e_list(p2e_list(source,j),1))),:),node_list(patch_list(source,find(patch_list(source,:)==e_list(p2e_list(source,j),2))),:),p_rho);
                    mom(p2e_list(test,i),p2e_list(source,j))= mom(p2e_list(test,i),p2e_list(source,j)) + flag1*flag2*(constant_vp*dot(rho_t,(-1*scalar_integ*r1 + vector_integ))*test_area + constant_sp*scalar_integ*test_area);
                end         
            end
        end     
    end
end