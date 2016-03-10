function [ bigData ] = BigDataLoad( filesLoc, varargin )%ISImatName,
%Will load all filles in folder
%INPUTS  
%       ISImatName - what the cell array in the file is called
%       varargin to control which array elements to load
%       > tri, 'up' - upper triangle
%              'down' - lower triangle
%              'both' - separate upper and lower triangles
%       > keepmat, 'all' - loads all elements in array, even 1 dimensional
%                           self ISI
%                   KEEPmatrix - 0/1 matrix of same size array, indicating
%                           elements to load

filesToAdd=dir(fullfile(filesLoc,'*.mat'));
for j=1:length(varargin)
if strcmpi(varargin{j},'keepmat')
    loadInd=varargin{j+1};
elseif strcmpi(varargin{j},'tri')
    tri=varargin{j+1};
end
end

for a=1:length(filesToAdd)
    disp(['Adding file ' num2str(a) '/' num2str(length(filesToAdd))])
    thisFile=filesToAdd(a).name;
    %load(fullfile(filesLoc,thisFile),ISImatName)
    load(fullfile(filesLoc,thisFile),'ISIthresh')
    if exist('tri','var')
        [r,c]=size(ISIthresh);
        if r==c
            if strcmpi(tri,'up') || strcmpi(tri,'both')
                upIND=triu(ones(r),1);
                linearUpIND=find(upIND(:));
                bigData.Up=[];
            elseif strcmpi(tri,'down') || strcmpi(tri,'both')    
                downIND=tril(ones(r),-1);
                linearDownIND=find(downIND(:));
                bigData.Lo=[];
            elseif strcmpi(loadInd,'all')
                bothIND=triu(ones(r),1)+tril(ones(r),-1);
                linearBothInd=find(bothIND(:));
                bigData.All=[];
            end   
        else
            disp(['Error: file ' thisFile 'doesnt have square array'])
        end
    end
    if exist('loadInd','var') 
    %if ischar(loadInd)
        if strcmpi(loadInd,'all')
            loadInd=ones(1,length(ISIthresh));
        end
    %end
    end
    bigData.Self=[];
    for g=1:length(ISIthresh)
        %{
        if strcmpi(tri,'up') || strcmpi(tri,'both')
            bigData.Up=[bigData.Up; ISIthresh{linearUpIND(g)}];
        elseif strcmpi(tri,'down') || strcmpi(tri,'both') 
            bigData.Lo=[bigData.Lo; ISIthresh{linearDownIND(g)}];
        elseif strcmpi(loadInd,'all')
            bigData.All=[bigData.All; ISIthresh{linearDownIND(g)}];
        end
        %}
        bigData.Self=[bigData.Self; ISIthresh{g}];
    end
       
end

end