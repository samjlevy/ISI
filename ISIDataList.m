function [MD, session_ref]=ISIDataList(userstr)
if ~exist('userstr','var')
    userstr='slaptop';
end
    
UIDs={ 'R1413' , 8;
       'R1412', 8;
                    };
                
%% R1413 Dorsal CA1
i = 1;
R1413(1)=i;
MD(i).Animal = 'R1413';
MD(i).Date = '110710';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-10-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-10-2011';
end
MD(i).Notes = [];
R1413(1)=i;

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110711';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-11-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-11-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110713';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-13-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-13-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110714';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-14-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-14-2011';
end
MD(i).Notes = [];


i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110718';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-18-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-18-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110719';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-19-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-19-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110720';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-20-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-20-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1413';
MD(i).Date = '110721';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1413\R1413_07-21-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1413\R1413_07-21-2011';
end
MD(i).Notes = [];

R1413(2) = i;
%% R1412
i = i + 1;
R1412(1) = i;
MD(i).Animal = 'R1412';
MD(i).Date = '110711';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-11-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-11-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110713';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-13-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-13-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110714';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-14-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-14-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110719';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-19-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-19-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110720';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-20-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-20-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110721';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-21-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-21-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110725';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-25-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-25-2011';
end
MD(i).Notes = [];

i = i + 1;
MD(i).Animal = 'R1412';
MD(i).Date = '110727';
MD(i).Structure = 'CA1d';
MD(i).Equipment = 'Neuralynx Cheetah';
MD(i).ScaleToMS = 1000;
MD(i).Env = 'B/W Boxes';
MD(i).Room = 'Uris Basement';
if (strcmp(userstr,'slaptop'))
    MD(i).RawLocation = 'C:\Users\samwi_000\Documents\MATLAB\2013BulkinClass\dataset\dataset\R1412\R1412_07-27-2011';
    MD(i).SpikeMatLocation = ' ';
elseif strcmp(userstr,'lab')
    MD(i).Location = 'C:\Users\caslocal\Documents\SamDocs\Matlab\2013course\dataset\dataset\R1412\R1412_07-27-2011';
end
MD(i).Notes = [];

R1412(2) = i;

%% CMK stuff


%% Ref list
UIDs={ 'R1413' , 8;
       'R1412', 8;
                    };
                
session_ref.R1413 = R1413;
session_ref.R1412 = R1412; 


end
