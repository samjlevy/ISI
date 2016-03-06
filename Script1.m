%ISIscript
currentDrive='D:'; %laptop
currentDrive='J:'; %Davison HP

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

<<<<<<< HEAD


%rethreshold all ISI files to under 1sec
isiLocation=fullfile(currentDrive,'ISI\ISIraw');
filesToThresh=dir(fullfile(isiLocation,'*.mat'));
saveLoc=fullfile(currentDrive,'ISI\ISI1MS');
=======
%% 

%rethreshold all ISI files to under 1sec
isiLocation='K:\ISI\ISIraw';
filesToThresh=dir(fullfile(isiLocation,'*.mat'));
saveLoc='K:\ISI\ISIscale';
>>>>>>> origin/master
tic
for s=1:length(filesToThresh)
    disp(['Thresholding file ' num2str(s) '/' num2str(length(filesToThresh))])
    %{
    if any(strfind(filesToThresh(s).name,'CA1d'))==1
        tempScale = 0.001;
    else
        tempScale = 1000;
    end
    %}
    [~]=ISIthreshed(filesToThresh(s).name,isiLocation,saveLoc,tempScale);%, 0, 1000
end
toc

<<<<<<< HEAD
%% Work from here
cd('C:\Users\samwi_000\Documents\GitHub\ISI')

filesLoc=fullfile(currentDrive,'ISI\ISIraw');
=======
cd('C:\Users\IGD\Documents\GitHub\ISI')
%% Work from here: Adding Data to one big vector for histogram
filesLoc='K:\ISI\ISI1Kms';
>>>>>>> origin/master
filesToAdd=dir(fullfile(filesLoc,'*.mat'));
tic
for a=1:length(filesToAdd)
    disp(['Adding file ' num2str(a) '/' num2str(length(filesToAdd))])
    thisFile=filesToAdd(a).name;
    load(fullfile(filesLoc,thisFile),'ISIthresh')
    [r,c]=size(ISIthresh);
    if r==c
    %bothIND=triu(ones(r),1)+tril(ones(r),-1);
    upIND=triu(ones(r),1);
    downIND=tril(ones(r),-1);
    linearUpIND=find(upIND(:));
    linearDownIND=find(downIND(:));
    bigDataUp=[];
    bigDataLo=[];
    for g=1:length(upIND)
        bigDataUp=[bigDataUp; ISIthresh{linearUpIND(g)}];
        bigDataLo=[bigDataLo; ISIthresh{linearDownIND(g)}];
    end
    else
        disp(['Error: file ' thisFile.name 'doesnt have square array'])
    end    
end
toc

%%
Run raw self
ISIsem to get compare mat
Check distributions of sem, threshold
Bootstrap distribution comparison