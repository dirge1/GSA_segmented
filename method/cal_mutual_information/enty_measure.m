function [MI]=enty_measure(train,g)
%tar_x��ʵ����������Ϣ��W�������������Ϣ��������֤������ȷ�ԣ���ZL���α���������Ϣ
%U1,U2,S,R��Ϣ�ֽ�����Rz��flag������λ�ã�Tȫ�����������Ϣ�ֽ⣬TTȫ�����������Ϣ�ܺ�
for i=1:size(train,1)-1
    x{i}=train(i,:);
    MI(i)=bi_mutual_information(x{i},g);%��¼ÿ��Դ������Ŀ������Ļ���Ϣ
end
end