%possible ISI, no loops within pair comparisions, maybe way faster
cellA=[timeStamps; 1];%row-wise
cellB=[timeStamps; 0];
mixed=[cellA; cellB];
sort(mixed, ascending, if tied A goes second);
unsortedISI=diff(mixed,1);
%{
where unsortedISI(:,2)==1 (had an A-B) keep that entry in row 1 
                      ==0 (had cellA/B against self)
                      ==-1 (had a B-A) could check against later trial for B
%}
unsortedKeep=unsortedISI(2,:)==1;
ISI=unsortedISI(1,unsortedKeep);
