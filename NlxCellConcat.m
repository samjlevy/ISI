bigL=length(unique(cn3))+length(unique(cn4))+length(unique(cn7))-3
allCells=cell(bigL,1);
cells3=unique(cn3);
for i=1:length(cells3)-1
    allCells{i}=spikeTs3(cn3==i+1);
end
cells4=unique(cn4);
for j=1:length(cells4)-1
    allCells{j+length(cells3)}=spikeTs4(cn4==j+1);
end
cells7=unique(cn7);
for k=1:length(cells7)-1
    allCells{k+length(cells4)+length(cells3)-1}=spikeTs7(cn7==k+1);
end