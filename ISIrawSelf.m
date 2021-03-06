function[selfISI]=ISIrawSelf(cellMatFolder,cellMatFile,saveLocation)
%ISI against self
load(fullfile(cellMatFolder,cellMatFile));

selfISI=cell(length(FT),1);
for a=1:length(FT)%cellA
    cellA=FT{a};
    [r,c]=size(cellA);
    if c > r
        cellA=cellA';
    end
    selfISI{a,1}=diff(cellA);
end
meanSelfISI=cellfun(@mean,selfISI);
stdSelfISI=cellfun(@std,selfISI);

saveName=[cellMatFile(1:end-16) '_selfISI.mat'];
save(fullfile(saveLocation,saveName), 'selfISI','meanSelfISI','stdSelfISI');
end