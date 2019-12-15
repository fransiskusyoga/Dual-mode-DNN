close all

%Integal variables
delta = 0.001;
x= 0.01:delta:2;
rdata = zeros(size(x));

%integral on sigmoidAprox
j=1;
for i=0.01:delta:2
    fun =@(x) abs(sigmoidAprox8(x, i)-sigmoid(x));
    q = integral(fun, 0 , 20);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1/4 and 1/8 gradien');
[minInt1 j] = min(rdata);
xInt1 = x(j);

%integral on sigmoidAprox
j=1; 
for i=0.01:delta:2
    fun =@(x) abs(sigmoidAprox16(x, i)-sigmoid(x));
    q = integral(fun, 0 , 20);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1/4 and 1/16 gradien');
[minInt2 j] = min(rdata);
xInt2 = x(j);

%plot optimum result
in = -5:0.1:5;
y = sigmoidAprox8(in,xInt1);
figure, plot(in,y,in,sigmoid(in)), title('Optimum plot 1/8');
y = sigmoidAprox16(in,xInt2);
figure, plot(in,y,in,sigmoid(in)), title('Optimum plot 1/16');