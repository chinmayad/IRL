%IRL implementaion 

function [entr] = maxentr(theta)
reward=0;
entr=0;
sum1=0;
features = importfile('features.txt', 1, 150);
trajectory=importfile1('trajectory', 1, 1000);
Z=0;
trajectory=trajectory+1;
c=zeros(150,1);
for m=1:1000
x=trajectory(m,:);
tf=isnan(x);
for i=1:length(tf)
    if tf(i)==1
        break
    end
end
actual_tr=x(1:i-1);
%P(k)=exp(reward(trajectory,actual_tr,theta,features));


for i=1:length(actual_tr)
k=actual_tr(i);
lo=(trajectory==k);
c(k)=sum(sum(lo));
sum1=sum1+c(k);
end
c=c/sum1;
end
for m=1:1000
x=trajectory(m,:);
tf=isnan(x);
for i=1:length(tf)
    if tf(i)==1
        break
    end
end
actual_tr=x(1:i-1);
%P(k)=exp(reward(trajectory,actual_tr,theta,features));
reward=0;
for i=1:length(actual_tr)
k=actual_tr(i);

f=features(k,:);
reward=reward+theta'*f'*c(k);
end

P(m)=exp(reward);


Z=Z+P(m);
end
P=P/Z;
entr=-sum(log(P));
end
