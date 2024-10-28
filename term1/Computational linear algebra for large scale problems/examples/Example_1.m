format rat

A1=[1 3 2; 0 2 3; 2 0 1]
b1=[0; 1; 0]

rank(A1)
rank([A1 b1])

[L,U,P] = LUpiv_rect(A1)

y=L\(P*b1)

x=U\y

format
