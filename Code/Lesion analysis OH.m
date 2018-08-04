    
Object_hit=xlsread (['C:\Shafagh school\LimeData\object hit new.csv'])
Target_Hits=Object_hit(:,2);
Hand_Bias_Hit=Object_hit(:,8);
Hand_Bias_Speed=Object_hit(:,12);
Miss_Bias=Object_hit(:,5);


 z_score = [15 17 25 27 53 57 61 65 67 71 73 75 77 79 81 83 85 109 111 113 115 223 225 273 275 277 279 281 287 289 291 293 295 297]
 alpha = 0.003125
 n_roi = length (z_score);
file_info = dir ('LM*.mat');
file_names = {file_info.name};
n_subj = length (file_names);
lesion_data = ones (n_subj,n_roi) * NaN;
z = repmat (struct ('threshold', NaN, 'uncorrected', NaN, 'corrected', NaN), n_roi, 1);
for i_subj = 1 : n_subj
    clear lesion_AICHA
    load (file_names{i_subj}, 'lesion_AICHA');
    lesion_AICHA = lesion_AICHA.mean(z_score);
    lesion_data(i_subj,:) = lesion_AICHA;
end
for i_roi = 1 : n_roi
    [~,p] = corr(Target_Hits,lesion_data(:,i_roi),'tail','left');
    z(i_roi).threshold = norminv(1-alpha,0,1);
    z(i_roi).uncorrected = norminv(1-p,0,1);
    z(i_roi).corrected = norminv(1-(p*n_roi),0,1);
end

 % Sacatter plots lesion data & behavior%
file_info=dir('*.mat');
file_names={file_info.name};
for i=1:63;load(file_names{i});Rolando(i)=lesion_AICHA.mean([69]);end;
scatter(Rolando',Target_Hits)
lsline

for i=1:58;load(file_names{i});supramarginal(i)=lesion_AICHA.mean([93]);end;
scatter(supramarginal',Miss_Bias)
lsline


for i=1:63;load(file_names{i});SuperFrontal(i)=mean(lesion_AICHA.mean([15]));end;
scatter(SuperFrontal',Hand_Bias_Speed)
lsline

scatter(lesion_data(:,17),Miss_Bias)
lsline
box off
scatter(lesion_data(:,11),Hand_Bias_Speed)
lsline
box off
scatter(lesion_data(:,16),Hand_Bias_Speed)
lsline
box off
[r,p]=corr(lesion_data(:,16),Hand_Bias_Speed)




