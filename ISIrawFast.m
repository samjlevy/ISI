%possible ISI, no loops within pair comparisions, maybe way faster
cd('D:\ISI\SpikeMats')
tic
allISI=cell(length(FT),length(FT));
for a=1:length(FT)%cellA
    cellA=FT{a};
    [r,c]=size(cellA);
    if c > r
        cellA=cellA';
    end    
    markerA=zeros(length(cellA),1);
    for b=1:length(FT)%row-wisefor b=1:length(FT)
        cellB=FT{b};
        [r,c]=size(cellB);
        if c > r
            cellB=cellB';
        end    
        markerB=ones(length(cellB),1);
        mixedCell=[cellA; cellB];
        mixedMarker=[markerA; markerB];
        [sortedCell, sortInd]=sort(mixedCell); %ties?
        sortedMarker=mixedMarker(sortInd);
        cellDiff=diff(sortedCell);
        markerDiff=diff(sortedMarker);
        allISI{a,b}=cellDiff(markerDiff==1);
    end
end
meanISI=cellfun(@mean,allISI);
stdISI=cellfun(@std,allISI);
toc

%{
where unsortedISI(:,2)==1 (had an A-B) keep that entry in row 1 
                      ==0 (had cellA/B against self)
                      ==-1 (had a B-A) could check against later trial for B
%}
