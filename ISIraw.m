function ISIraw(cellMatFolder,cellMat,isiLocation)%[ISIs]=
load(fullfile(cellMatFolder,cellMat))
numCells=length(cellMat);

%Finds the first spike in j after current spike in i, as long as it isn't
%the last one used
allISI=cell(numCells,numCells);
cd('F:\ISI\Progressbar')
p=ProgressBar(length(numCells)^2);
parfor i=1:numCells   
    iSpikes=cellMat{i,1};
    disp(['Working cell ' num2str(i)])
    for j=1:numCells
        jSpikes=cellMat{j,1};
        jLast=0;
        if any(jSpikes)
        for a=1:length(iSpikes)
            iSpike=iSpikes(a);
            if sum(jSpikes>jSpike) > 0
            jSpike=jSpikes(find(jSpikes>=iSpike,1,'first'));
            if any(jSpike) && jSpike~=jLast 
                allISI{i,j}(a)=jSpike-iSpike;
                jLast=jSpike;
            end
            end
        end
        end
    p.progress();    
    end  
end
p.stop;
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
saveName=cellMat(1:end-16);
save(fullfile(isiLocation,saveName));%%%%%%%%%%%%
end