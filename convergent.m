n=10; 
b0=0.04; b1=12.13;
a0=0.06;  a1=6.82;
p=zeros(n,1);  
val1=zeros(n,1);
val2=zeros(n,1); 
p(1,1) = 8.0; 
for k=2:n 
       p(k,1)=(b1*a0+b0*a1-b0*p(k-1,1))/a0;
end 
figure(1),clf,hold on; 
x=0:0.001:200;
y= b1-b0*x;
y2=a1+a0*x; 
plot(x,y,'k',x,y2,'k','LineWidth',1.3)
k=2;
for k=1:n
        val1(k,1)=(b1-p(k,1))/b0;
        val2(k,1)=(p(k,1)-a1)/a0;
end        
line([0 val2(1,1)],[p(1,1) p(1,1)],'LineWidth',1.3);
for k=1:(n-2)
       line([val1(k+1,1) val2(k+1,1)],[p(k+1,1) p(k+1,1)],'LineWidth',1.3);
       line([val2(k,1) val2(k,1)],[p(k,1) p(k+1,1)],'LineWidth',1.3);
end
hold off  
xlabel('Plasma PTH (pg/ml)')
ylabel('Plasma Calcium (mg/dl)')
axis([0 150 0 13])
set(gca,'FontSize',12,'LineWidth',1.3)
