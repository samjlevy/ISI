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
%{
filesToISI=dir('D:\ISI\SpikeMats\*.mat');
isiLocation='D:\ISI\ISIraw';
cellMatFolder='D:\ISI\SpikeMats';
tic
for d=1:2:length(filesToISI)%right now by 2s to finish in a reasonable amount of time
    cellMatFile=filesToISI(d).name;
    disp(['Working file ' cellMatFile ', ' num2str((d+1)/2) '/44'])
    ISIraw(cellMatFolder,cellMatFile,isiLocation)
end
toc
%}

filesToISI=dir('J:\ISI\SpikeMats\*.mat');
isiLocation='J:\ISI\ISIraw';
cellMatFolder='J:\ISI\SpikeMats';
tic
%p = ProgressBar(length(filesToISI));
for d=1:length(filesToISI)
    cellMatFile=filesToISI(d).name;
    disp(['Working file ' cellMatFile ', ' num2str(d) '/' num2str(length(filesToISI))])
    [~]=ISIrawFast(cellMatFolder,cellMatFile,isiLocation);
    %p.progress();
end
%p.stop();
toc

%% Work from here

%rethreshold all ISI files to under 1sec
isiLocation='J:\ISI\ISIraw';
filesToThresh=dir(fullfile(isiLocation,'*.mat'));
saveLoc='J:\ISI\ISI1MS';
tic
for s=1:length(filesToThresh)
    if any(strfind(filesToISI(s).name,'CA1d'))==1
        tempScale = 0.001;
    else
        tempScale = 1000;
    end    
    [~]=ISIthreshed(filesToThresh(s).name,isiLocation,saveLoc,tempScale, ~, 1000);
end
toc

filesLoc='J:\ISI\ISIraw';
filesToAdd=dir(fullfile(filesLoc,'*.mat'));
tic
for a=1:length(filesToAdd
    disp(['Adding file ' num2str(a) '/' num2str(length(filesToAdd))])
    thisFile=filesToAdd(a);
    load(fullfile(filesLoc,thisFile),'ISIthresh')
    [r,c]=size('ISIthresh');
    if r==c
    bothIND=triu(ones(r),1)+tril(ones(r),-1);
    linearIND=find(bothIND(:));
    bigData=[];
    for g=1:length(bothIND)
        bigData=[bigData; ISIthresh{bothIND(g)}];
    end
    else
        disp(['Error: file ' thisFile.name 'doesnt have square array'])
    end    
end
toc


