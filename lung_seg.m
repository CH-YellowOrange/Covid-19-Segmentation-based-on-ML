function I1=lung_seg(img)
[~,~,z]=size(img);

if z>1
    I=rgb2gray(img);
else
    I=img;
end

tI=IterationThreshold(I,1);%ȫ����ֵ
se=strel('disk',5);
tI=~tI;%ȡ��
tI=imclose(tI,se);%������
tI=~tI;%ȡ��
tI=getConnectionArea(tI);%��ȡ�����ͨ����
hI=imfill(tI,'holes');%�׶����
[x_hI,y_hI] = size(hI);
lung_white = [];

for i=1:x_hI
    for j=1:y_hI
        if hI(i,j)>0
            lung_white = [lung_white,I(i,j)];
        end
    end
end

thresh=segmentation2(lung_white);
tI=im2bw(I,thresh(3));
tI=~tI;%ȡ��
se=strel('disk',5);
tI=imclose(tI,se);%������
tI=~tI;%ȡ��
tI=getConnectionArea(tI);%��ȡ�����ͨ����
hI=imfill(tI,'holes');%�׶����
tI=hI-tI;%��Ĥ���
I1=deleteConnectionArea(tI,3000);
end