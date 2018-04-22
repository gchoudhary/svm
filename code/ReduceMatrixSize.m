function [RIndex , EndIndex, RD, RL, RDL]=ReduceMatrixSize(label, inst, ratio)
    Rows=length(label); 
    class = unique(label);
    Num_label = length(class);
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
