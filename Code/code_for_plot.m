Object_hit=xlsread (['C:\Shafagh school\LimeData\object hit new.csv'])
Target_Hits=Object_hit(:,2);
Hand_Bias_Hit=Object_hit(:,8);
Hand_Bias_Speed=Object_hit(:,12);
Miss_Bias=Object_hit(:,5);

file_info=dir('*.mat');
file_names={file_info.name};


%plots for connectivity vs lesion data

Dti_lesion

file_info=dir('*.mat');
file_names={file_info.name};
for i=1:47;load(file_names{i});sm_lesion(i)=mean(lesion_AICHA.mean([15 17 25 27 53 57 61 65 67 71 73 75 77 79 81 83 85 109 111 113 115 223 225 273 275 277 279 281 287 289 291 293 295 297]));end;
for i=1:47
    load(file_names{i})
    
    C1=dti_jhu.r(15,17)
    C2=dti_jhu.r(15,23)
    C3=dti_jhu.r(15,25)
    C4=dti_jhu.r(15,27);
    C5=dti_jhu.r(15,53)
    C6=dti_jhu.r(15,57)
    C7=dti_jhu.r(15,61)
    C8=dti_jhu.r(15,65)
    C9=dti_jhu.r(15,67)
    C10=dti_jhu.r(15,73)
    C=[C1,C2,C3,C4,C5,C6,C7,C8,C9,C10]
    Ct=mean(C)
    network_connectivity(i)= Ct
end;
scatter(sm_lesion',network_connectivity)


%scatter plot for lesion data vs behavior%

file_info=dir('*.mat');
file_names={file_info.name};
for i=1:54;load(file_names{i});sm_lesion(i)=mean(lesion_AICHA.mean([15 17 25 27 53 57 61 65 67 71 73 75 77 79 81 83 85 109 111 113 115 223 225 273 275 277 279 281 287 289 291 293 295 297]));end;
Object_hit=xlsread (['C:\Shafagh school\Lime Data\object hit.csv']);

Target_Hits=Object_hit(:,2);
scatter(sm_lesion',Target_Hits);
hold on
y=Hand_Movement_Bias_Area
x=sm_lesion
X=[x;ones(1,length(x))];
b=regress(y,X')
plotregression(x',y)

Hand_bias_speed=Object_hit(:,11);
scatter(sm_lesion',Hand_bias_speed);

Hand_Bias_Hits=Object_hit(:,7);
scatter(sm_lesion',Hand_Bias_Hits);

Hand_Movement_Bias_Area=Object_hit(:,9);
scatter(sm_lesion',Hand_Movement_Bias_Area);

%scatter plot for Connectivity data vs behavior%

scatter(network_connectivity',Target_Hits);
hold on
y=Hand_Movement_Bias_Area
x=network_connectivity
X=[x;ones(1,length(x))];
b=regress(y,X')
plotregression(x',y)

Hand_bias_speed=Object_hit(:,11);
scatter( network_connectivity',Hand_bias_speed);

Hand_Bias_Hits=Object_hit(:,7);
scatter(network_connectivity',Hand_Bias_Hits);

Hand_Movement_Bias_Area=Object_hit(:,9);
scatter(network_connectivity',Hand_Movement_Bias_Area);


scatter(Language_network_connectivity',Target_Hits);
hold on
y=Hand_Movement_Bias_Area
x=Language_network_connectivity
X=[x;ones(1,length(x))];
b=regress(y,X')
plotregression(x',y)

Hand_bias_speed=Object_hit(:,11);
scatter(Language_network_connectivity',Hand_bias_speed);

Hand_Bias_Hits=Object_hit(:,7);
scatter(Language_network_connectivity',Hand_Bias_Hits);

Hand_Movement_Bias_Area=Object_hit(:,9);
scatter(Language_network_connectivity',Hand_Movement_Bias_Area);





