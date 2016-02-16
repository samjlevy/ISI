function [OutCell,Animal,Date]=PlexonSpikeTimeLoad(session,sessLocation,saveLocation)
%function to handle extraction of spike times from plexon data from CMK
%session comes in as session location (directory for session file and 
%session file itself

load(fullfile(sessLocation,session), 'unitdata');
for a=1:length(unitdata.units)
    FT{a,1}=unitdata.units(a).ts;
end    

%THis section breaking due to naming inconsistencies
s=strsplit(session,' ');
Animal=s{1};
t=strsplit(s{2},'_');
Dateparts=strsplit(t{1},'-');
if length(Dateparts{1})==1
    Date=[Dateparts{3} Dateparts{2} num2str(0) Dateparts{1}];
elseif length(Dateparts{1})==2    
    Date=[Dateparts{3} Dateparts{2} Dateparts{1}];
end    
OutCell=FT;
if exist('saveLocation','var')
    saveName=[Animal '_' Date '_spikeTsCell.mat'];
    save(fullfile(saveLocation,saveName), 'FT');
end

end