close all

%Integal variables
delta = 0.001;
x= 0.01:delta:2;
rdata = zeros(size(x));

%integral on sigmoidAprox
j=1;
for i=0.01:delta:2
    fun =@(x) abs(funAprox_2_4(x, i)-tanh(x));
    q = integral(fun, 0 , 100);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1/2 and 1/4 gradien');
[minInt1 j] = min(rdata);
xInt1 = x(j);

%integral on sigmoidAprox
j=1; 
for i=0.01:delta:2
    fun =@(x) abs(funAprox_2_8(x, i)-tanh(x));
    q = integral(fun, 0 , 100);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1/2 and 1/4 gradien');
[minInt2 j] = min(rdata);
xInt2 = x(j);

%integral on sigmoidAprox
j=1; 
for i=0.01:delta:2
    fun =@(x) abs(funAprox_1_2(x, i)-tanh(x));
    q = integral(fun, 0 , 100);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1 and 1/2 gradien');
[minInt3 j] = min(rdata);
xInt3 = x(j);

%integral on sigmoidAprox
j=1; 
for i=0.01:delta:2
    fun =@(x) abs(funAprox_1_4(x, i)-tanh(x));
    q = integral(fun, 0 , 100);
    rdata(j)=q;
    j = j+1;
end
figure, plot(x,rdata), title('1 and 1/4 gradien');
[minInt4 j] = min(rdata);
xInt4 = x(j);

%plot optimum result
in = -8:0.1:8;
y = funAprox_2_4(in,xInt1);
figure, plot(in,y,in,tanh(in)), title('Optimum plot 1/2 and 1/4');
y = funAprox_2_8(in,xInt2);
figure, plot(in,y,in,tanh(in)), title('Optimum plot 1/2 and 1/8');
y = funAprox_1_2(in,xInt3);
figure, plot(in,y,in,tanh(in)), title('Optimum plot 1 and 1/2');
y = funAprox_1_4(in,xInt4);
figure, plot(in,y,in,tanh(in)), title('Optimum plot 1 and 1/4');