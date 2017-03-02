y = 377*abs(J);
A = [9 26 43 60 74];

B = [37 40 43 46 49];
frac = 0.15;  
for i = 1: size(A,2)
    Z(i,1) = i*frac/size(A,2);
    Z(i,2) = y(A(1,i));
    Z(i,3) = y(B(1,i));
end

