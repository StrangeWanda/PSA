clc
clear all
linedata
n=max([L(:,1);L(:,2)])
y_mat=zeros(n,n)
hla = zeros(n,n)
for i=1:length(L(:,1))
    row=L(i,:)
    fb=row(1)
    tb = row(2)
    R=row(3)
    X=row(4)
    yhlc=row(5)
    y_mat(fb,tb)=1/(R+1i*X)
    y_mat(tb,fb)=1/(R+1i*X)
    hla(fb,tb)=1i*yhlc
    hla(tb,fb)=1i*yhlc
end
Y_BUS=-y_mat
for i=1:n
    Y_BUS(i,i) = sum(y_mat(:,i)) + sum(hla(:,i))
end
Y_BUS