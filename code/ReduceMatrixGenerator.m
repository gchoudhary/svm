function [RD, RL, RDL,RIndex , EndIndex]=ReduceMatrixGenerator(label, inst, ratio)
    
% INPUT    1. label - labels of the dataset
%          2. inst -  data
%          3 . ratio - reduction ratio <=1
%Outputs   1. RD - reuced data, subset of inst
%          2. RL- labels corresponding to RD, reduced data
%          3. RDL- [RD, RL], concatinated marix, Reduced data with labels


%%%%%%% Randomizing the order of data %%%%%%
    index = randperm(length(inst(:,1)));
 	inst = inst(index,:);
    label = label(index,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    Rows =length(label);          
    class = unique(label);         %Labels in dataset
    Num_label = length(class);     %Number of labels in dataset
    EndIndex = zeros(Num_label+1,1);
    RIndex = [];
        for i = 1 : Num_label
            Temp_Index = find(label==class(i));
            Temp_Rows = length(Temp_Index);
            Temp_Size = fix(Temp_Rows*ratio);
            if (Temp_Size==0)
                Temp_Size=1;
            end       
            
            Temp=[];
                Temp(1,:) = Temp_Index(1 : Temp_Size);
            RIndex = [RIndex Temp];
            EndIndex(i+1) = EndIndex(i)+Temp_Size;
        end
            
        m = length(RIndex);
        [ M, N ] = size(inst);
        for i = 1:m
            RD(i,:) = inst(RIndex(i),:);
        end
        
         RL = zeros(m,1);
         k = min(label);
         for i = 1:length(EndIndex)-1;
             for j = EndIndex(i,1)+1: EndIndex(i+1,1);
                 RL(j)= k;
             end
             k = k+2;
         end
        RDL = [ RD RL];
end
