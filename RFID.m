data=[];
data=importdata('signal.txt');
plot(data);
x=1;k=1;i=1;begin=1;
signal1=2500;signal2=5000;signal3=9450;signal4=10350;
reader1=[];index1=[];reader2=[];index3=[];
tag1=[];tag2=[];index2=[];index4=[];

% get the 1ST signal from READER
for a=1:signal1;
    if data(a)<0.3;
        i=a;
        break;
    end
end

while i<signal1,
    if data(i)>0.4;
        index1(x)=i;
        x=x+1;
        for j=i:signal1;
            if data(j)<0.3;
                index1(x)=j;
                i=j;
                x=x+1;
                break;
            end
            if j==signal1;
                break;
            end
        end
    else
        i=i+1;
    end
end

for z=1:size(index1,2)-1;
    if index1(z+1)-index1(z) > 100;
        begin=z+2;
        break;
    end
end

for z=begin:2:size(index1,2)-1;
    if index1(z+1)-index1(z) > 60;
        reader1(k)=1;
    else
        reader1(k)=0;
    end
    k=k+1;
end

% get the 1ST signal from TAG
x=1;k=1;begin=1;t1_i=begin;
for a=signal1+100:signal2;
    if data(a)<0.62;
        i=a;
        break;
    end
end

while i<signal2,
    if data(i)<0.63;
        index2(x)=i;
        x=x+1;
        for j=i:signal2;
            if data(j)>0.64;
                index2(x)=j;
                i=j;
                x=x+1;
                break;
            end
            if j==signal2;
                break;
            end
        end
    else
        i=i+1;
    end
end

for z=1:size(index2,2)-1;
    if index2(z+1)-index2(z) > 22;
        begin=z+2;
        break;
    end
end

t1_i=begin;
while t1_i < size(index2,2),
    if index2(t1_i+1)-index2(t1_i) < 10;
        tag1(k)=0;
        t1_i=t1_i+2;
    elseif index2(t1_i+1)-index2(t1_i) >= 13;
        tag1(k)=1;
        t1_i=t1_i+1;
    else
        tag1(k)=2; 
    end
    k=k+1;
end

% get the 2ND signal from READER
x=1;k=1;begin=1;i=1;

for a=signal2:signal3;
    if data(a)<0.3;
        i=a;
        break;
    end
end

while i<signal3,
    if data(i)>0.4;
        index3(x)=i;
        x=x+1;
        for j=i:signal3;
            if data(j)<0.3;
                index3(x)=j;
                i=j;
                x=x+1;
                break;
            end
            if j==signal3;
                break;
            end
        end
    else
        i=i+1;
    end
end

for z=1:size(index3,2)-1;
    if index3(z+1)-index3(z) > 100;
        begin=z+2;
        break;
    end
end

for z=begin:2:size(index3,2)-1;
    if index3(z+1)-index3(z) > 60;
        reader2(k)=1;
    else
        reader2(k)=0;
    end
    k=k+1;
end
figure;
plot(reader2);

% get the 2ND signal from TAG
x=1;k=1;begin=1;t2_i=begin;
for a=signal3+50:signal4;
    if data(a)<0.62;
        i=a;
        break;
    end
end

while i<signal4,
    if data(i)<0.63;
        index4(x)=i;
        x=x+1;
        for j=i:signal4;
            if data(j)>0.64;
                index4(x)=j;
                i=j;
                x=x+1;
                break;
            end
            if j==signal4;
                break;
            end
        end
    else
        i=i+1;
    end
end

for z=1:size(index4,2)-1;
    if index4(z+1)-index4(z) > 22;
        begin=z+2;
        break;
    end
end

t2_i=begin;
while t2_i < size(index4,2),
    if index4(t2_i+1)-index4(t2_i) < 10;
        tag2(k)=0;
        t2_i=t2_i+2;
    elseif index4(t2_i+1)-index4(t2_i) >= 13;
        tag2(k)=1;
        t2_i=t2_i+1;
    else
        tag2(k)=2; 
    end
    k=k+1;
end

reader1=num2str(reader1);
tag1=num2str(tag1);
reader2=num2str(reader2);
tag2=num2str(tag2);
disp('R->T: ')
disp(reader1)
disp('T->R: ')
disp(tag1)
disp('R->T: ')
disp(reader2)
disp('T->R: ')
disp(tag2)
