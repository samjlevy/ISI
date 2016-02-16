function ISIraw(cellMatFolder,cellMatFile,isiLocation)%[ISIs]=
load(fullfile(cellMatFolder,cellMatFile));
numCells=length(FT);

%Finds the first spike in j after current spike in i, as long as it isn't
%the last one used
allISI=cell(numCells,numCells);
cd('F:\ISI\Progressbar')
%p=ProgressBar(length(numCells));
parfor i=1:numCells   
    iSpikes=FT{i,1};
    disp(['Working cell ' num2str(i)])
    for j=1:numCells
        jSpikes=FT{j,1};
        jLast=0;
        if any(jSpikes)
        for a=1:length(iSpikes)
            iSpike=iSpikes(a);
            if sum(jSpikes>jLast) > 0
            jSpike=jSpikes(find(jSpikes>=iSpike,1,'first'));
            if any(jSpike) && jSpike~=jLast 
                allISI{i,j}(a)=jSpike-iSpike;
                jLast=jSpike;
            end
            end
        end
        end
        
    end
%p.progress();
end
%p.stop;
meanISI=cellfun(@mean,allISI);

%Same thing?
%{
allITIs=cell(numCells,numCells);
parfor a=1:length(numCells)
    cella=cellMat{a,1};
    disp(['Working cell ' num2str(a)])
    for b=1:length(numCells)
        cellb=cellMat{b,1};
        bLast=0;
        if any(cellb)
        for c=1:length(cella)
            aSpike=cella(c);
            bSpike=cellb(find(cellb<=aSpike,1,'last'));
            if any(bSpike) && bSpike~=bLast
                allITIs{a,b}(c)=aSpike-bSpike;
                bLast=bSpike;
            end
        end
        end
    end
end
%}

%saveName=[Animal '_' Date '_ISIraw.mat'];
saveName=cellMatFile(1:end-16);
save(fullfile(isiLocation,saveName));%%%%%%%%%%%%
end