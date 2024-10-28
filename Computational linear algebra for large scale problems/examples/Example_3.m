format rat

A3=[1 2 0 1; 1 1 5 2; 1 2 -2 5]
b3=[5; 7; 11]

rank(A3)
rank([A3 b3])

pause

[L,U,P] = LUpiv_rect(A3)

y=L\(P*b3)

%x=U\y
%%%%%%%%%%%%%%%%%%%%%%
% U = 1              2              0              1       
%        0             -1              5              1       
%        0              0             -2              4       

%  y = 5       
%        2       
%        6        
				% U sol=y
				%  z=2w-3
				%  y=11w-17
				%  x=-23w+39
				%  sol=[-23w+39; 11w-17;  2w-3; w]
sol_bar=[39; -17; -3; 0]
				% sol=sol_bar + [-23w; 11w;  2w; w]
%%%%%%%%%%%%%%%%%%%%%%

A3*sol_bar - b3
