function e2p_list_entry = e2p_filler(e_list_entry, patch_list)

[Ia, Ja] = find(patch_list(:,1:3) == e_list_entry(1,1));
[Ib, Jb] = find(patch_list(:,1:3) == e_list_entry(1,2));
%e2p_list_entry = [0 0];
k = 1;
for i = 1 : size(Ja,1)
    for j = 1 : size(Jb,1)        
        if (Ib(j) == Ia(i))
            e2p_list_entry(1,k) = Ia(i);
            k = k+1;
        end
    end
end