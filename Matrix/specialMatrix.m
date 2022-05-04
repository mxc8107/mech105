function [A] = specialMatrix(n,m)
if nargin~=2
error('must have two inputs')%if there aren't two inputs, you can't run function
for row=1:n
    for column=1:m
        if row==1
            A(row,column)=column;%does the first row
        elseif row>1 && column==1
            A(row,column)=column+(row-1);%does the first column
                else row>=2;
            A(row,column)= A(row,column-1)+A(row-1,column);%does the middle section
            end
        end
end
end
