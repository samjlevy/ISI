
%% for i,j vs j,i comparisons
for a=1:5
    for b=1:5
        inputCell{a,b}=a+b;
    end 
end    

N = size(A{1});                      %# Size of an array in A
M = cellfun('prodofsize',B);         %# Array of sizes of elements in B
C = mat2cell([A{cell2mat(B)}],N,M); 
% or
C = cellfun(@(x) {[A{x}]},B);

%%
stdMat=cell2mat(inputISIstd);
[r,c]=size(stdMat);
upperIND=triu(ones(r),1);
linearUpIND=find(IND(:));
[i,j]=ind2sub([r,c],linearIND);
keepMat=zeros(r,c);
for g=1:length(i)
    if sem(stdMat(i(g),j(g))) > sem(stdMat(j(g),i(g)))
        keepMat(i(g),j(g))=1;
    elseif sem(stdMat(j(g),i(g))) > sem(stdMat(i(g),j(g)))
        keepMat(j(g),i(g))=1;
    end
end    


%% Statistical comparison:
Generate random data by getting a random number of ISIs from sorted, diffed 
    combined vector, same number as ones in diff mat, perform stats on those
    
Look at ISIs from scale models that include temporal data (Marianne's? Hasselmo post-doc)

