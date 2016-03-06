function[allISI]=ISIrawBootStrap(cellMatFolder,cellMatFile,isiLocation)
%Bootstrap from original data for comparison

load(fullfile(cellMatFolder,cellMatFile));

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

saveName=cellMatFile(1:end-16);
save(fullfile(isiLocation,saveName), 'allISI','meanISI','stdISI');
end