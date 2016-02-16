%CMK Spike files
dirlist={'D:\CMKdata\SpksEvs files\LEC', 'LEC';
         'D:\CMKdata\SpksEvs files\LEC learning', 'LEC';
         'D:\CMKdata\SpksEvs files\MEC', 'MEC';
         'D:\CMKdata\SpksEvs files\MEC learning', 'MEC';
         'D:\CMKdata\SpksEvs files\PRC', 'PRC'
         };
     
[r,~]=size(dirlist)
fileList={};           
for a=1:r
    cd(dirlist{a,1});
    theseFiles=dir('*.mat');
    for b=1:length(theseFiles)
        [ll,~]=size(fileList);
        fileList{ll+1,1}=theseFiles(b).name;
        fileList{ll+1,2}=dirlist{a,2};
        fileList{ll+1,3}=dirlist{a,1};
    end
end    