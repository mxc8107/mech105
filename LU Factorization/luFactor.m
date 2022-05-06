function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
sa=size(A);
if sa(1)~=sa(2) %output size
    error("not correct size")
end
v=ones(sa(1),1);
P=diag(v);
L=diag(v);
U=A;
i=0
while (1)
    i=i+1
    if i==sa(1)
        break
    end
    if i~=sa(1)
        [~,r]=max(abs(U(i:end,i)))
        r=sa(1)-(sa(1)-i+1)+r
        U([i,r],:)=U([r,i],:)
        P([i,r],:)=P([r,i],:)
            k=i:sa(1)
            L(k:sa(1),i)=U(k:sa(1),i)/U(i,i)
            U((k+1):sa(1),:)=U(k+1:sa(1),:)-U(i,:).*L(k+1:sa(1),i)
    end
end
L=L
U=U
P=P
end