% test the papamodel_func where n is # recurtion;
el=[1/100:1/100:1]';
figure('name','model gap gene');
for i=0:20
[Hb,Kni,Kr,Gt]=papamodel_func(i);
plot(el,Hb,'m',el,Gt,'r',el,Kr,'g',el,Kni,'b');
legend('model Hb','model Gt','model Kr','model Kni');
axis([0,1,0,1.2]);
pause(0.01)
end

% test the boundary of hb;
recurtion=20;
index=zeros(recurtion,1);
sharpness=zeros(recurtion,1);
for i=1:recurtion
    [Hb,Kni,Kr,Gt]=papamodel_func(i);
    max_Hb=max(Hb);
    min_Hb=min(Hb);
    middle_Hb=(max_Hb+min_Hb)/2;
    temp_value=zeros(100,0);
    for j=1:100
        temp_value(j)=abs(Hb(j)-middle_Hb);  
    end
    index(i)=find(temp_value==min(temp_value));
    sharpness(i)=(Hb(index(i)-1)-Hb(index(i)+1))/2;
end
figure('name','Hb movie');
for k=1:recurtion
    [Hb,Kni,Kr,Gt]=papamodel_func(k);
    plot([1:1:100],Hb,index(k),Hb(index(k)),'o');axis([0,100,0,1]);
    pause(0.05);
end
figure('name','threshold of Hb');
plot([1:1:recurtion],index,'o');
axis([0,50,0,50]);
figure('name','sharpness of Hb');
plot([1:1:recurtion],sharpness,'*');