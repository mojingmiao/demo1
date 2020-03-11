% Multiplicative upates (MU) for non-negative matrix factorization (NMF).
% The problem of interest is defined as
%
%           min f(X, W, H),
%           where 
%           {X, W, H} >= 0.
%
 clc;
 clear;
 close all;
  m = 7;
  n = 6;
  j=4;
  X = rand(m,n);
  W=rand(m,j);                            %初始化WH，为非负数
  H=rand(j,n);
     
%Euclidean distance
while( i<=10000)
    Vhat=W*H;
    f = norm(X - Vhat)^2 ;
    if f<1e-6
        str1=sprintf('the iteration is %d',i);
        str2=sprintf('the Minimum loss function is %d',f);
    disp (str1,str2);
    end
   % update H
       H = H .* (W' * X) ./ (W' * W * H);       
   % update W
       W = W .* (X * H') ./ (W * (H * H'));
    i=i+1;
end
f
disp(W)
disp(H)
N_X= W*H;
disp(N_X)
disp(X)
