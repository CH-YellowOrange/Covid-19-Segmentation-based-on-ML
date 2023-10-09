function [OI]=IterationThreshold(II,TF)
%������ֵ��
%��ʼ��ֵΪƽ��ֵ��֮����е���ֱ���ȶ�
%IIΪ����ͼ��OIΪ���ͼ��
%TFΪ��٣�Ϊ��ʱ������ֵ������Ϊ1��Ϊ��ʱ������ֵ������Ϊ0

T0=mean(mean(II));
[x,y]=size(II);
OI=II;
tOriginal=T0;
b=1;
while(b)
    ifg=0;
    ibg=0;
    fnum=0;
    bnum=0;
    for i=1:x
        for j=1:y
            temp=II(i,j);
            if(temp>=tOriginal)
                ifg=ifg+1;
                fnum=fnum+double(temp);
            else
                ibg=ibg+1;
                bnum=bnum+double(temp);
            end
        end
    end
    zo=fnum/ifg;
    zb=bnum/ibg;
    if(tOriginal==(uint16((zo+zb)/2)))
        b=0;
    else
        tOriginal=uint16((zo+zb)/2);
    end
end
T0=tOriginal;
for i=1:x
    for j=1:y
        if II(i,j)>T0
            OI(i,j)=1*TF;
        end
        if II(i,j)<=T0
            OI(i,j)=0*TF;
        end
    end
end
end