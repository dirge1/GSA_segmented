function [MI]=enty_measure(train,g)
%tar_x真实二变量互信息，W计算二变量互信息（用于验证计算正确性），ZL二次变量增量信息
%U1,U2,S,R信息分解结果，Rz，flag最大变量位置，T全部多变量互信息分解，TT全部多变量互信息总和
for i=1:size(train,1)-1
    x{i}=train(i,:);
    MI(i)=bi_mutual_information(x{i},g);%记录每个源变量和目标变量的互信息
end
end