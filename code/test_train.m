%   This is twin SVM method for nonlinear case using QPP from toolbox
%   Solution of two minimization problems are solved.
function [err,x1,x2,test1,test2,A,B]=test_train(C,test_data,mu,c1,c2)
  [no_input,no_col]=size(C);
  obs = C(:,no_col);    
 A = zeros(1,no_col-1);
 B = zeros(1,no_col-1);

for i = 1:no_input
    if(obs(i) == 1)
        A = [A;C(i,1:no_col-1)];
    else
        B = [B;C(i,1:no_col-1)];
    end;
end;

     [rowA,n] = size(A);
     A = A(2:rowA,:);
     [rowB,n] = size(B);
     B = B(2:rowB,:)       
    
    ep = 0.001;
     [m1,n] = size(A);    
    e1 = ones(m1,1); 
    [m2,n] = size(B);
     e2 = ones(m2,1);
     m= m1 + m2;
     I = speye(m);
     C = [A ; B];   
     
     K=zeros(m1,m);
    for i=1:m1
        for j=1:m
            nom = norm( A(i,:)  - C(j,:)  );
            K(i,j) = exp( -mu * nom * nom );
        end
    end
       
     H = [K e1];
     size(H)
     HT = H';
     
    
     K=zeros(m2,m);
    for i=1:m2
        for j=1:m
            nom = norm( B(i,:)  - C(j,:)  );
            K(i,j) = exp( -mu * nom * nom );
        end
    end

    G = [K e2];
    size(G) 
    GT = G';    

    em1 = m+1;
    e = ones(em1,1);
    
    lowb=zeros(m,1);
    upb1 = c1;
    upb2 = c2;
    
%     G = [K e];
    HTH = H' * H;
    invHTH = inv(HTH + ep * speye(em1) );
    GINVGT = G * invHTH * G';
    GTG = G' * G;
    invGTG = inv (GTG + ep * speye(em1));
    HINVHT = H * invGTG * H';

%     r1 = (-I + GINVGT ) * (y - ep1 * e ) ;
%     r2 = (I - GINVGT ) * (y + ep2 * e ) ;
    
%     f1 = - r1';
%     f2 = - r2';
       f1 = -e2';
       f2 = -e1';
%      initial_train_time=tic;
    u1 = quadprog(GINVGT,f1,[],[],[],[],lowb,upb1);
    u2 = quadprog(HINVHT,f2,[],[],[],[],lowb,upb2);
%     time = toc(initial_train_time);
    w1 = - invHTH * G' *u1
    w2 =  invGTG * H' *u2
    
    [no_test,no_col] = size(test_data);   
    ktest = zeros( no_test, no_input ); 
     for i=1:no_test
        for j=1:no_input
            nom = norm( test_data(i,1:no_col-1)  - C(j,:)  );
            Ker_row(i,j) = exp( -mu * nom * nom );
            
        end
     end
     K = [Ker_row ones(no_test,1)];
     size(K);
     y1 = K * w1 / norm(w1);
     y2 = K * w2 / norm(w2);
     
    for i = 1 : no_test
        if abs(y1(i)) < abs(y2(i))
            classifier(i) = 1;
        else
            classifier(i) = -1;
        end;
    end;

x1 =[]; x2 =[];
for i=1:no_test
    if classifier(i) ==1
        x1 = [x1; test_data(i,1:no_col-1)];
    else 
        x2 = [x2; test_data(i,1:no_col-1)];
    end
end
% END here
%-----------------------------
err = 0.;
classifier = classifier';
obs = test_data(:,no_col);

%[test_size,n] = size(classifier);
for i = 1:no_test
    if(sign(classifier(i)) ~= sign(obs(i)))
        err = err+1;
    end;
end;  
     
%% start for drawing purpose
test1 =[];
test2 =[];

for i=1:no_test
    if obs(i)== 1
     test1 = [test1; test_data(i,1:no_col-1)];
    else
     test2 = [test2; test_data(i,1:no_col-1)];
    end
end
%END......

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    