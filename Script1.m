%ISIscript

[MD,ref]=ISIDataList('lab')

%Format data
%saveLocation='C:\Users\samwi_000\Documents\Grad School\ISIproject\SpikeMats';
saveLocation='F:\ISI\SpikeMats';

%BulkinFileListLoc=' ';
%fileList=load(fullfile(BulkinFileListLoc,'BulkinSpikeFiles.mat');

%Concatenate each session into a single file, all cells on all tetrodes
list=[ref.R1413(1):ref.R1413(2) ref.R1412(1):ref.R1412(2)];
p=ProgressBar(length(list));
for i=1:length(list)
    [OutCell] = NlxSpikeTimeLoad(list(i),saveLocation);
    MD(i).SpikeMatLocation=saveLocation;
    p.progress();
end
p.stop;

%Concatenate each session into a single file, all cells on all tetrodes
%CMKfileListLoc='C:\Users\samwi_000\Documents\Grad School\ISIproject';
CMKfileListLoc='F:\ISI\FileLists';
fileList=load(fullfile(CMKfileListLoc,'CMKspikeFiles.mat'));
p = ProgressBar(length(fileList.fileList));
for j=1:length(fileList.fileList)
    [OutCell,Animal,Date]=PlexonSpikeTimeLoad(fileList.fileList{j,1},fileList.fileList{j,3},fileList.fileList{j,2},saveLocation);
    %{
    mm=length(MD);
    MD(mm+1).Animal=Animal;
    MD(mm+1).Date=Date;
    MD(mm+1).Structure=fileList.fileList{j,2};
    MD(mm+1).ScaleToMS=1000;%THIS NEEDS TO BE CHECKED
    MD(mm+1).SpikeMatLocation=saveLocation;
    %}
    p.progress();
end    
p.stop();

filesToISI=dir('F:\ISI\SpikeMats\*.mat');
isiLocation='F:\ISI\ISIraw';
cellMatFolder='F:\ISI\SpikeMats';
for d=1:2:length(filesToISI)%right now by 2s to finish in a reasonable amount of time
    cellMat=filesToISI(d).name;
    disp(['Working file ' cellMat])
    ISIraw(cellMatFolder,cellMat,isiLocation)
end