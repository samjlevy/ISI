function [OutCell] = NlxSpikeTimeLoad(session,saveLocation)
%Takes session id as input (e.g., MD(4)), returns cell array with each
%cell as its own array in the output cell array
%OUTPUT - spike times, in 1000th of a MS
[MD,~]=ISIDataList('lab');

datapath=MD(session).Location;

tetrodes=dir(fullfile(datapath,'*sorted.ntt'));
FT={};
for a=1:length(tetrodes)
    [spikeTs,cn]= Nlx2MatSpike(fullfile(datapath,tetrodes(a).name),[1 0 1 0 0],0,1);
    cells=unique(cn);
    for b=2:length(cells)
        [ll,~]=size(FT);
        FT{ll+1,1}=spikeTs(cn==cells(b));
    end
end

OutCell=FT;
if exist('saveLocation','var')
    saveName=[MD(session).Animal '_' MD(session).Date '_' MD(session).Structure '_spikeTsCell.mat'];
    if ~exist(fullfile(saveLocation,saveName),'file')
        save(fullfile(saveLocation,saveName), 'FT');
    else
        disp(['Found existing file for ' saveName ', saving new version'])
        saveName=[MD(session).Animal '_' MD(session).Date '_spikeTsCell_' date '_' MD(session).Structure 'new.mat'];
        save(fullfile(saveLocation,saveName), 'FT');
    end    
end

end