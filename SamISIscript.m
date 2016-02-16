load('PlaceMaps.mat')
frameRate=30.0009;

numCells=length(NeuronPixels);

tic
%Gets all transiets FT==1
allISI=cell(701,701);
for i=1:numCells
    iSpikes=find(FT(i,:));
    for j=1:numCells
    disp(['Working cell ' num2str(j) ' against cell ' num2str(i)])    
        jSpikes=find(FT(j,:));
        jLast=0;
        if any(jSpikes)
        for a=1:length(iSpikes)
            iSpike=iSpikes(a);
            jSpike=jSpikes(find(jSpikes<=iSpike,1,'last'));
            if any(jSpike) && jSpike~=length(aviFrame) && jSpike~=jLast 
                allISI{i,j}(a)=iSpike-jSpike;
                jLast=jSpike;
            end
            
        end
        end
    end
    
end
meanISI=cellfun(mean,allISI);

%Gets only for onsets (diff in FT =1, diff of those inds)
allISI2=cell(701,701);
for i=1:numCells
    iSpikes=diff(FT(i,:));
    iSPikes=find(iSpikes==1)+1;
    disp(['Working cell ' num2str(i) ])
    parfor j=1:numCells    
        jSpikes=diff(FT(j,:));
        jSpikes=find(jSpikes==1)+1;
        jLast=0;
        if any(jSpikes)
        for a=1:length(iSpikes)
            iSpike=iSpikes(a);
            jSpike=jSpikes(find(jSpikes<=iSpike,1,'last'));
            if any(jSpike) && jSpike~=length(aviFrame) && jSpike~=jLast 
                allISI2{i,j}(a)=iSpike-jSpike;
                jLast=jSpike;
            end     
        end
        end
    end  
end
toc


%Auto ITI, adjacent spikes; maybe implement into above?
tots=sum(FT,2);
inds=find(tots>0);
ITIs=cell(length(inds),1);
parfor a=1:length(inds)
    spikes=diff(FT(inds(a),:));
    spikes=find(spikes==1)+1;
    ITIs{a}=diff(spikes)+1;
end  
meanITIs=cellfun(@mean,ITIs);
meanITIs=meanITIs/frameRate;
meanITIs=meanITIs*1000;

onInds=cell(701,1);
parfor a=1:701
    spikes=diff(FT(a,:));
    onInds{a}=find(spikes==1)+1;
end  
allITIs=cell(24,24);
parfor a=1:24
    cella=onInds{a};
    disp(['Working cell ' num2str(a)])
    for b=1:24
        cellb=onInds{b};
        bLast=0;
        if any(cellb)
        for c=1:length(cella)
            aSpike=cella(c);
            bSpike=cellb(find(cellb<=aSpike,1,'last'));
            if any(bSpike) && bSpike~=bLast% && bSpike~=length(aviFrame)
                allITIs{a,b}(c)=aSpike-bSpike;
                bLast=bSpike;
            end
        end
        end
    end
end
meanITIs=cellfun(@mean,allITIs);
anITIs=meanITIs/frameRate;
meanITIs=meanITIs*1000;

    