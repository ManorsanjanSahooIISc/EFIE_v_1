y = 377*abs(J);
A = [9 26 43 60 77 94 108];
B = [54 57 60 63 66];
frac = 1;  
for i = 1: size(A,2)
    Z(i,1) = i*frac/size(A,2);
    Z(i,2) = y(A(1,i));
end

for i = 1 : size(B,2)
    Z1(i,1) = i*frac/size(B,2);
   
    Z1(i,2) = y(B(1,i));

end

