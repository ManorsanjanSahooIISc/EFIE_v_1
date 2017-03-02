function p2e_list_entry = p2e_filler(patch_list_entry,e_list)

[Ia,Ja] = find(e_list(:,1:2)==patch_list_entry(1,1));
[Ib,Jb] = find(e_list(:,1:2)==patch_list_entry(1,2));
[Ic,Jc] = find(e_list(:,1:2)==patch_list_entry(1,3));
k = 1;
p2e_list_entry = [0 0 0];
for i = 1 : size(Ja,1)
    for j = 1 : size(Jb,1)
        for l = 1 :size(Jc,1)
           if ((Ib(j) == Ia(i))&& (size(find(p2e_list_entry == Ia(i)),2)== 0))
                    p2e_list_entry(1,k) = Ia(i);
                    k = k+1;                              
           elseif((Ib(j) == Ic(l))&& (size(find(p2e_list_entry == Ib(j)),2)== 0))
            p2e_list_entry(1,k) = Ib(j);
            k = k+1;
           elseif ((Ic(l) == Ia(i))&& (size(find(p2e_list_entry == Ia(i)),2)== 0))
             p2e_list_entry(1,k) = Ic(l);
            k = k+1;
           end   
        end
    end
end


if size(Ja,1) == 0 
    for j = 1 : size(Jb,1)
        for l = 1 :size(Jc,1)
           if((Ib(j) == Ic(l))&& (size(find(p2e_list_entry == Ib(j)),2)== 0))
            p2e_list_entry(1,k) = Ib(j);
            k = k+1;
            end   
        end
    end
end


if size(Jb,1) == 0
    for i = 1 : size(Ja,1)
       for l = 1 :size(Jc,1)
           if ((Ic(l) == Ia(i))&& (size(find(p2e_list_entry == Ia(i)),2)== 0))
             p2e_list_entry(1,k) = Ic(l);
            k = k+1;
           end   
        end
    end
end

if size(Jc,1) ==0
    for i = 1 : size(Ja,1)
        for j = 1 : size(Jb,1)
           if ((Ib(j) == Ia(i))&& (size(find(p2e_list_entry == Ia(i)),2)== 0))
                    p2e_list_entry(1,k) = Ia(i);
                    k = k+1;                              
           end   
        end
    end
end
