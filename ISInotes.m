%possible ISI, no loops within pair comparisions, maybe way faster
cd('D:\ISI\SpikeMats')
allISI=cell(length(FT),length(FT));
for a=1:length(FT)%cellA
    cellA=FT{a};
    markerA=zeros(length(FT{a}),1);
    for b=1:length(FT)%row-wisefor b=1:length(FT)
       cellB=FT{b};
       markerB=ones(length(FT{b}),1);
       mixedCell=[cellA; cellB];
       mixedMarker=[markerA; markerB];
       [sortedCell, sortInd]=sort(mixedCell); %ties?
       sortedMarker=mixedMarker(sortInd);
       unsortedISI=diff(sortedCell);
       markerDiff=diff(sortedMarker);
       allISI{a,b}=unsortedISI(markerDiff==1);
    end
end
meanISI=cellfun(@mean,allISI);
stdISI=cellfun(@std,allISI);

%{
where unsortedISI(:,2)==1 (had an A-B) keep that entry in row 1 
                      ==0 (had cellA/B against self)
                      ==-1 (had a B-A) could check against later trial for B
%}
unsortedKeep=unsortedISI(2,:)==1;
ISI=unsortedISI(1,unsortedKeep);
