for i = 1 : size(B,1)
    Xv(i, :) = [ A(B(i,1),1) , A(B(i,2),1), A(B(i,3),1)];
    Yv(i, :) = [ A(B(i,1),2) , A(B(i,2),2), A(B(i,3),2)];
    Zv(i, :) = [ A(B(i,1),3) , A(B(i,2),3), A(B(i,3),3)];
end
Xv =Xv';
Yv = Yv';
Zv = Zv';
Sigma = 1;

for i = 1 : size(Sigma,1)
    
    c(1,i,1) = Sigma(i);
end
patch(Xv,Yv,Zv,c);