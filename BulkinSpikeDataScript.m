%Bulkin Data file list
%dataFolder=uigetdir(pwd,'Select main data folder');
dataFolder='C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset';

rats=dir(dataFolder);
fileList={};
for g=1:length(rats)
    if rats(g).isdir==1 && ~strcmpi(rats(g).name,'.') && ~strcmpi(rats(g).name,'..')
        sessions=dir(fullfile(dataFolder,rats(g).name));
        for h=1:length(sessions)
            if sessions(h).isdir==1 && ~strcmpi(sessions(h).name,'.') && ~strcmpi(sessions(h).name,'..')
                [ll,~]=size(fileList);
                fileList{ll+1,1}=sessions(h).name;
                fileList{ll+1,2}='dCA1';
                fileList{ll+1,3}=fullfile(dataFolder,rats(g).name);
            end
        end
    end
end
%saveLoc=uigetdir(pwd,'Choose folder to save file');
saveLoc='F:\ISI\FileLists';
save(fullfile(saveLoc,'BulkinSpikeFiles.mat'),'fileList');