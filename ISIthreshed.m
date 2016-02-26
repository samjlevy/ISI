function [ISIthresh]=ISIthreshed(isiFile,isiLocation,saveLoc,tempScale,lowerLimit,upperLimit)
load(fullfile(isiLocation,isiFile),'allISI')

ISIthresh = cellfun(@(cellAB)...
    cellAB(cellAB*tempScale<=upperLimit & cellAB*tempScale>=lowerLimit),...
    allISI, 'UniformOutput', false);

ISIthresh = cellfun(@(cellBC) cellBC(cellBC*tempScale));

saveName=[isiFile(1:end-4) 'thresh1kMS.mat'];
save(fullfile(saveLoc,saveName),'ISIthresh')

end