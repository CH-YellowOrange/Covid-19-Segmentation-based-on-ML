function OI=getConnectionArea(II)
%�����ͨ��������ȡ
%IIΪ�����ֵͼ��OIΪ���ͼ��
    L=bwlabel(II,4);
    OI=II;
    stats = regionprops(L);
    Ar = cat(1, stats.Area);
    ind=find(Ar==max(Ar));
    if sum(sum(L))~=0
        OI(L~=ind(1))=0;%������������Ϊ0
    end
end