function [ISIthresh]=ISIthreshed(isiFile,isiLocation,tempScale,lowerLimit,upperLimit)
load(fullfile(isiLocation,isiFile),'allISI')

ISIthresh = cellfun(@(cellAB)...
    cellAB(cellAB*tempScale<=upperLimit & cellAB*tempScale>=lowerLimit),...
    allISI, 'UniformOutput', false);



end