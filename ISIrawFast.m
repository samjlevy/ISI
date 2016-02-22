function[allISI]=ISIrawFast(cellMatFolder,cellMatFile,isiLocation)
%Function to compute interspike intervals. 
%Loads cell's spike times into separate vectors, then sorts all based on
%time. Using output sortInd (sorted=unsorted(sortInd)), then sort 'marker'
%vector, ones for one cell, zeros for the other by same sort, then take
%diffs to get instances where diff of cell time stamps is A-B. Since diff
%is x(2)-x(1), etc., if B's are 1s and A's are 0s, then diff in marker
%arrays = 1 is A timestamp precedes B.
%
% INPUTS - folder with spike time cell array, filename for cell array,
% location to save file
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