function [L,U,P] = LUpiv_rect(A);

  [m,n] = size(A);
  p=min(m,n);
  piv = 1:m;
  for k=1:p-1
      [maxv,r] = max(abs(A(k:m,k)));  
      q = r+k-1;
      piv([k q]) = piv([q k]);
      A([k q],:) = A([q k],:);

    if A(k,k) ~= 0
      A(k+1:m,k) = A(k+1:m,k)/A(k,k);
      A(k+1:m,k+1:n) = A(k+1:m,k+1:n) - A(k+1:m,k)*A(k,k+1:n);
    end
  end

  if p<m
    [maxv,r] = max(abs(A(n:m,n)));  
    q = r+n-1;
    piv([n q]) = piv([q n]);
    A([n q],:) = A([q n],:);

    if A(n,n) ~= 0
      A(n+1:m,n) = A(n+1:m,n)/A(n,n);
    end
  end
  L = eye(m,n) + tril(A,-1);
  L=L(1:m,1:p);
  U = triu(A);
  U=U(1:p,1:n);
  P = eye(m);
  P = P(piv,:);
