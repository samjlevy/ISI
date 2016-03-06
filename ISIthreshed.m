function [ISIthresh]=ISIthreshed(isiFile,isiLocation,saveLoc,tempScale)%,lowerLimit,upperLimit
load(fullfile(isiLocation,isiFile),'allISI')
%{
ISIthresh = cellfun(@(cellBC) cellBC*tempScale, allISI, 'UniformOutput', false);
%}
ISIthresh = cellfun(@(cellAB)...
    cellAB(cellAB<=upperLimit & cellAB>=lowerLimit),...
    intermediate, 'UniformOutput', false);

saveName=[isiFile(1:end-4) 'thresh.mat'];
save(fullfile(saveLoc,saveName),'ISIthresh')

end