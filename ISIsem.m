function ISIsem(ISIloc,ISIfile,saveLoc)
load(fullfile(ISIloc,ISIfile), 'ISIthresh')
semCell = cellfun(@(ISIcell) std(ISIcell)/sqrt(length(STDcell)), allISI, 'UniformOutput', false);

semMat=cell2mat(semCell);
saveName=[ISIfile{1:end-4} '_SEM.mat'];
save(fullfile(saveLoc,saveName),'semMat')
end