%ISIscript

[MD,ref]=ISIDataList

%Format data
%saveLocation='C:\Users\samwi_000\Documents\Grad School\ISIproject\SpikeMats';
saveLocation='J:\ISI\SpikeMats';

%BulkinFileListLoc=' ';
%fileList=load(fullfile(BulkinFileListLoc,'BulkinSpikeFiles.mat');

%Concatenate each session into a single file, all cells on all tetrodes
for i=1:length(MD)
    [OutCell] = NlxSpikeTimeLoad(i,saveLocation);
    MD(i).SpikeMatLocation=saveLocation;
end

%Concatenate each session into a single file, all cells on all tetrodes
%CMKfileListLoc='C:\Users\samwi_000\Documents\Grad School\ISIproject';
CMKfileListLoc='J:\ISI\FileLists';
fileList=load(fullfile(CMKfileListLoc,'CMKspikeFiles.mat'));
for j=1:length(fileList.fileList)
    [OutCell,Animal,Date]=PlexonSpikeTimeLoad(fileList.fileList{j,1},fileList.fileList{j,3},saveLocation);
    mm=length(MD);
    MD(mm+1).Animal=Animal;
    MD(mm+1).Date=Date;
    MD(mm+1).Structure=fileList.fileList{j,2};
    MD(mm+1).ScaleToMS=1000;%THIS NEEDS TO BE CHECKED
    MD(mm+1).SpikeMatLocation=saveLocation;
end    