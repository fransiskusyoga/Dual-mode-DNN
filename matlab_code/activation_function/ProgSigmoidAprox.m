close all

%variables
delta = 0.001;
x= 0.01:0.01:20;          %range of data to be captured
inp = 0.01:delta:2;       %i value variety
rdata = zeros(size(inp));

%on sigmoidAprox
j=1;
for i=0.01:delta:2
    [temp deadzone]= sigmoidAprox8(x, i);
    rdata1(j)= max( abs(temp-sigmoid(x))./sigmoid(x) );
    j = j+1;
end
[min1 j] = min(rdata1);
xpos1 = inp(j);

%on sigmoidAprox8
j=1;
for i=0.01:delta:2
    [temp deadzone]= sigmoidAprox16(x, i);
    rdata2(j)= max( abs(temp-sigmoid(x))./sigmoid(x) );
    j = j+1;
end
[min2 j] = min(rdata2);
xpos2 = inp(j);
figure, title('defect vs bending point');
hold on
P1 = plot(inp,rdata1);M1='with 1/8 grad';
P2 = plot(inp,rdata2);M2='with 1/16 grad';
legend([P1 P2], M1,M2);
hold off

in = -5:0.1:5;
[y deadzone] = sigmoidAprox8(in,xpos1);
figure, plot(in,y,in,sigmoid(in)), title('Optimum plot 1/8');
[y deadzone] = sigmoidAprox16(in,xpos2);
figure, plot(in,y,in,sigmoid(in)), title('Optimum plot 1/16');