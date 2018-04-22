    clc;
    clear all;
    close all;
    file1 = fopen('results_TSVM.txt','a+');
    file2 = fopen('results_c_mu.txt','a+');
     
    ratio = 0.1
%------------------------------------------------%
 for load_file = 30
    switch load_file
        case 1
            file = 'tic',            
               muvs=2^-6;
               cvs1=10^-5;
               cvs2=10^-5;
            test_start = 672; 
        case 2
            file = 'iono',           
              muvs=2^1;
              cvs1=10^-3;
              cvs2=10^-3;
            test_start = 247;     
         case 3
             file = 'bupa',             
               muvs=2^1;
               cvs1=10^-5;
               cvs2=10^-5;
             test_start = 242;   
         case 4
            file= 'votes'
              muvs=2^-7;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 307;  
         case 5
            file= 'wpbc'           
              muvs=2^-4;
              cvs1=10^0;
              cvs2=10^0;
            test_start = 138;  
       case 6
            file= 'pima'           
             muvs=2^0;
             cvs1=10^1;
             cvs2=10^1;           
            test_start = 538;     
     
      case 7
           file= 'Ripley'       
%               muvs=2^-4;
%               cvs1=10^0;
%               cvs2=10^0;
           test_start = 251;  
%       case 8
%            file= 'ndc1100'         
% %               muvs=2^-4;
% %               cvs1=10^0;
% %               cvs2=10^0;
%            test_start = 771;     
      case 9
            file= 'cleve'
              muvs=2^-5;
              cvs1=10^-5;
              cvs2=10^-5;  
             test_start = 178;     
     case 10
            file= 'ger'          
              muvs=2^-4;
              cvs1=10^-5;
              cvs2=10^-5;   
            test_start = 801;    
      case 11
             file= 'aus'          
              muvs=2^-4;
              cvs1=10^-5;
              cvs2=10^-5; % 540:150 
           test_start = 541;  
     case 12
            file = 'haberman';
              muvs=2^1;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 201;  
     case 13
            file = 'transfusion';
              muvs=2^-8;
              cvs1=10^-1;
              cvs2=10^-1;
             test_start = 601;    
     case 14
            file = 'wdbc';
              muvs=2^-1;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 501;   
             
     case 15
            file = 'splice';
            cvs1= 10^-5;
            cvs2= 10^-5;
            muvs= 2^-6;
             test_start = 501;  
     case 16
            file = 'monk2';
              muvs=2^1;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 170; % its a special dataset, cant change test_size   
     case 17
            file = 'monk3';
              muvs=2^-3;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 123; % its a special dataset, cant change test_size   
     case 18
            file = 'monks-1'; % its a special dataset, cant change test_size
              muvs=2^1;
              cvs1=10^-4;
              cvs2=10^-4;
             test_start = 125;  
     case 19
            file = 'heart-stat';
              muvs=2^-5;
              cvs1=10^-5;
              cvs2=10^-5;
             test_start = 201; 
     case 20
           file= 'sonar'; 
            muvs=2^-2;
            cvs1=10^-5;
            cvs2=10^-5;
           test_start = 151;  
     case 21
           file= 'cmc';
            muvs=2^-2;
            cvs1=10^-5;
            cvs2=10^-5;
           test_start = 1001; 
     case 22
           file= 'crossplane150'; 
%            muvs=2^9;
%            cvs1=10^-5;
%            cvs2=10^-5;
            test_start = 81;
            
     case 23
           file= 'Heart-c';          
            muvs=2^3;
            cvs1=10^-5;
            cvs2=10^-5;
           test_start = 178; 
         
    case 24
           file= 'ndc500';  %Only NDC datasets, we normalize in standard manner (not scalling)        
           test_start = 501;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
    case 25
           file= 'ndc1k';          
           test_start = 1001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
 
    case 26
           file= 'ndc2k';          
           test_start = 2001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
 
    case 27
           file= 'ndc3k';
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
           test_start = 1000; 
    case 28
           file= 'ndc5k';          
           test_start = 5001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
        
    case 29
           file= 'ndc8k';          
           test_start = 8001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;
   
    case 30
           file= 'ndc10k';          
           test_start = 10001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;

    case 31
           file= 'ndc50k';          
           test_start = 50001;
           muvs=2^0;
           cvs1=10^-5;
           cvs2=10^-5;

    case 32
           file= 'twindata';          
           test_start = 1001;
            
              otherwise
            continue;
    end
%                muvs=[2^-10,2^-9,2^-8,2^-7,2^-6,2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5,2^6,2^7,2^8,2^9,2^10];
%                cvs1=[10^-5,10^-4,10^-3,10^-2,10^-1,10^0,10^1,10^2,10^3,10^4,10^5];
%                cvs2=[10^-5,10^-4,10^-3,10^-2,10^-1,10^0,10^1,10^2,10^3,10^4,10^5];
%              cvs1= 10^-5;
%              cvs2= 10^-5;
%              muvs= 2^0;


    A =  load(strcat(file,'.txt') );
    [m,n] = size(A);    
%       A(:,1:n-1) = normalize (A(:, 1:n-1));   
    test_data = A(test_start:m,:);
    if test_start > 1
        train_data = A(1:test_start-1,:);        
    end  
    
    
    % CALL FOR ReduceMatrixGenerator%
    [RD, RL, RDL,RIndex , EndIndex]=ReduceMatrixGenerator(train_data(:,n),train_data(:,1:n-1), ratio);
    train_data = RDL;
    [m,n] = size(train_data);
    
    
    
    
    
    %%%%%%%%NOISE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     noise = ((-0.1 + 0.2 * rand(m,n-1) ));
%     train_data(:,1:n-1) = train_data(1:m,1:n-1)+ noise;

%      train_data(:,1:n-1) = normalize (train_data(:, 1:n-1));%only for NDC datasets
%      test_data(:,1:n-1) = normalize (test_data(:, 1:n-1));   
     train_data(:,1:n-1) = scale (train_data(:, 1:n-1));
     test_data(:,1:n-1) = scale (test_data(:, 1:n-1));  
     
         t = cputime;   

% % --------------------------------------------------------------------------     
     no_part = 10.;
     [m,n] = size(train_data);
    %initialize minimum error variable and corresponding c
    min_c1 = 1.;
    min_c2 = 1.;
    min_err=1000000000000000.;
    min_mu=1.;
     for mui=1:length(muvs)
         for ci=1:length(cvs1)
            mu=muvs(mui);
                c1=cvs1(ci);
                c2=cvs1(ci);
           % for different values of c
                c=cvs1(ci);
          %  training statement
            block_size=m/(no_part*1.0);
            part=0;
            avgerr=0;
            t_1=0;
            t_2=0;
            while ((part+1)* block_size) <= m
                t_1 = ceil(part*block_size);
                t_2 = ceil((part+1)*block_size);                
                Data_test= train_data(t_1+1: t_2,:); 
                Data =[train_data(1:t_1,:); train_data(t_2+1:m,:)];
                              
                [err] = test_train(Data,Data_test,mu,c1,c2); %call for training and testing
                fprintf(file2, 'example file %s; err= %8.6g, part num= %8.6g, mu= %8.6g, c1= %8.6g, c2= %8.6g\n', file,err,part,mu,c1,c2);
                avgerr = avgerr + err;
                part=part+1;
            end
           % testing statement
            % for particular c and for particular file
             fprintf(file2, 'example no: %s\t avgerr: %g\t mu=%g\t c1=%g\t c2=%g\n',file, avgerr,mu,c1,c2);
             if avgerr < min_err
                 min_c1 =c1;
                 min_c2 =c2;
                 min_err=avgerr;
                 min_mu=mu;
             end
        end %for c values
    end %for mu values
%     final training
%      
%                 min_mu = muvs;
%                 min_c1 = cvs1;
%                 min_c2 = cvs2;
                 
%   Replace comments by uncomments and vice-versa before this.
%   _______________________________________________________________________
 [err,x1,x2,test1,test2,A,B]=test_train(train_data,test_data,min_mu,min_c1,min_c2); 
   fprintf(file1,'example file: %s;ratio = %8.6g, err = %8.6g of %g,mu= %8.6g,c1 = %8.6g,c2 = %8.6g\n', file,ratio,err,length(test_data(:,1)),min_mu,min_c1,min_c2);
   
   
fclose(file1);
    file1=fopen('results_TSVM.txt','a+'); 
%     ytest=test_data(:,n);
%     x0 = (1:1:test)';
%     plot(x0,ytest,'r-',x0,soln,'b-')
 plot(test1(:,1),test1(:,2),'r-',test2(:,1),test2(:,2),'b-',A(:,1),A(:,2),'bo',B(:,1),B(:,2),'ko')
 end   
 
            
    fclose(file1);
    fclose(file2);
%................complete code.............................%    
            
