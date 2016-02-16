function [OutCell,Animal,Date]=PlexonSpikeTimeLoad(session,sessLocation,struct,saveLocation)
%function to handle extraction of spike times from plexon data from CMK
%session comes in as session location (directory for session file and 
%session file itself

load(fullfile(sessLocation,session), 'unitdata');
for a=1:length(unitdata.units)
    FT{a,1}=unitdata.units(a).ts;
end    

%Parse session info
%This section breaking due to naming inconsistencies
if any(strfind(session, 'day'))
    Animal=session(1:strfind(session,'day')-1);
    s=strsplit(session,' ');
    Dateparts=strsplit(s{1}(strfind(s{1},'day')+3:strfind(s{1},'Spks'),'-'));
else    
    s=strsplit(session,' ');
    Animal=s{1};
    t=strsplit(s{2},'_');
    Dateparts=strsplit(t{1},'-');
end    
if length(Dateparts{1})==1
    Dateparts{1}=[num2str(0) Dateparts{1}];
elseif length(Dateparts{2})==1
    Dateparts{2}=[num2str(0) Dateparts{2}];
elseif length(Dateparts{3})==3    
    Dateparts{3}=Dateparts{3}(1:2);
end
Date=[Dateparts{3} Dateparts{1} Dateparts{2}];

OutCell=FT;
if exist('saveLocation','var')
    saveName=[Animal '_' Date '_' struct '_spikeTsCell.mat'];
    save(fullfile(saveLocation,saveName), 'FT');
end

end