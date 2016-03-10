%ISIscript
currentDrive='D:'; %laptop
currentDrive='K:'; %Davison HP

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


%%
%rethreshold all ISI files to under 1sec
isiLocation=fullfile(currentDrive,'ISI\ISIself');
filesToThresh=dir(fullfile(isiLocation,'*.mat'));
saveLoc=fullfile(currentDrive,'ISI\ISI1MS');

cd('C:\Users\IGD\Documents\GitHub\ISI')

%% rethreshold all ISI files to under 1sec
isiLocation=fullfile(currentDrive,'ISI\Boot3');
filesToThresh=dir(fullfile(isiLocation,'*.mat'));
saveLoc=fullfile(currentDrive,'ISI\Boot3\Thresh');
tic
for s=1:length(filesToThresh)
    disp(['Thresholding file ' num2str(s) '/' num2str(length(filesToThresh))])
    if any(strfind(filesToThresh(s).name,'CA1d'))==1
        tempScale = 0.001;
    else
        tempScale = 1000;
    end
    [~]=ISIthreshed(filesToThresh(s).name,isiLocation,saveLoc,tempScale,1000,0);
end
toc
%% Self ISI
cellMatFolder=fullfile(currentDrive,'ISI\SpikeMats');
filesToSelf=dir(fullfile(cellMatFolder,'\*.mat'));
saveLocation=fullfile(currentDrive,'ISI\ISIself');
tic
%p = ProgressBar(length(filesToISI));
for d=1:length(filesToSelf)
    %cellMatFile=filesToISI(d).name;
    disp(['Working file ' filesToSelf(d).name ', ' num2str(d) '/' num2str(length(filesToSelf))])
    [~]=ISIrawSelf(cellMatFolder,filesToSelf(d).name,saveLocation);
    %p.progress();
end
%p.stop();
toc

%% Bootstrap
cellMatFolder=fullfile(currentDrive,'ISI\SpikeMats');
filesToBoot=dir(fullfile(cellMatFolder,'\*mat'));
saveLocation=fullfile(currentDrive,'ISI\Boot3');
for d=1:length(filesToBoot)
    %cellMatFile=filesToISI(d).name;
    disp(['Working file ' filesToBoot(d).name ', ' num2str(d) '/' num2str(length(filesToBoot))])
    [~]=ISIrawBootStrap(cellMatFolder,filesToBoot(d).name,saveLocation);
    %p.progress();
end


cd('C:\Users\samwi_000\Documents\GitHub\ISI')


filesLoc=fullfile(currentDrive,'ISI\ISIraw');
cd('C:\Users\IGD\Documents\GitHub\ISI')
%% Work from here: Adding Data to one big vector for histogram
array of locs? and ISImatNames

filesLoc=fullfile(currentDrive,'ISI\ISI1Kms');
[ bigData ] = BigDataLoad( filesLoc,'tri','up');
filesLoc=fullfile(currentDrive,'ISI\ISIself\Thresh');
[ bigDataSelf ] = BigDataLoad( filesLoc,'keepMat','all');
filesLoc=fullfile(currentDrive,'ISI\Boot\Thresh');
[ bigDataBoot1 ] = BigDataLoad( filesLoc,'tri','up');
filesLoc=fullfile(currentDrive,'ISI\Boot2\Thresh');
[ bigDataBoot2 ] = BigDataLoad( filesLoc,'tri','up');
filesLoc=fullfile(currentDrive,'ISI\Boot3\Thresh');
[ bigDataBoot3 ] = BigDataLoad( filesLoc,'tri','up');
%%

ISIsem to get compare mat
Check distributions of sem, bootstrap, check Bulkin data isn't throwing it off