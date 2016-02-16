%Bulkin Data file list
dataFolder=uigetdir=('Select main data folder');

rats=dir(dataFolder);
fileList={};
for g=1:length(rats)
    if rats(g).isdir==1 && ~strcmpi(rats(g).name,'.') && ~strcmpi(rats(g).name,'..')
        sessions=dir(rats(g).name);
        for h=1:length(sessions)
            if sessions(h).isdir==1 && ~strcmpi(rats(g).name,'.') && ~strcmpi(rats(g).name,'..')
                [ll,~]=size(fileList)
                fileList{ll+1,1}=sessions(h).name;
                fileList{ll+1,1}='dCA1';
            end
        end
    end
end
saveLoc=uigetdir('Choose folder to save file');
save(fullfile(saveLoc,'BulkinSpikeFiles.mat');