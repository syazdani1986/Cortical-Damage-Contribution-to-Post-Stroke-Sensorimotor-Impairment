
 
%DTI analysis for OH%
roi_left = [15 17 27 29 53 57 61 65 67 73 75 79 81 83 85 109 111 113 115 223 225 273 275 277 279 287 291 293 295 297]; % [15 17 27 29 53 57 61 65 67 73 75 79 81 83 85 109 111 113 115 223 225 273 275 277 279 287 291 293 295 297];
    alpha = .05;
roi_right = roi_left+1;
f_info = dir ('LM*.mat');
f_names = {f_info.name};
n_subj = length (f_names);
dti_data = ones (n_subj,n_dti) * NaN;

% Obtain DTI data for each ROI-ROI connection for each subject
for i_subj = 1 : n_subj
    clear dti_aicha
    load (f_names{i_subj}, 'dti_aicha');
    dti_left = dti_aicha.r(roi_left,roi_left);
    dti_right = dti_aicha.r(roi_right,roi_right);
    dti_bias = (dti_left - dti_right) ./ (dti_left + dti_right);
    dti_data(i_subj,:) = dti_bias(i_roi);
end
i_cortical = 1:384;
            n_cortical = length (i_cortical);
            cortical_mat = dti_AICHA.r(i_cortical,i_cortical);
            cortical_rows = [tril(cortical_mat,-1) triu(cortical_mat,1)];
            for i = 1 : n_cortical
all(i,1:n_cortical) = cortical_rows(i,[1:i n_cortical+i+1:end]);
            end

f_info = dir ('LM*.mat');
f_names = {f_info.name};
n_subj = length (f_names);
for i_subj = 1 : n_subj
load (f_names{i_subj}, 'dti_aicha');
x = all_con(i_aicha_premotor_left,i_aicha_supplementary_left);
y = all_con(i_aicha_premotor_right,i_aicha_supplementary_right);
dti_bias = (y - x) ./ (y + x);
dti_data(i_subj,i)=dti_bias
end
     dti_data(:,:,i)=dti_bias
     x = all_con(i_aicha_premotor_left,i_aicha_supplementary_left);
     y = all_con(i_aicha_premotor_right,i_aicha_supplementary_right);
     dti_bias = (y - x) ./ (y + x);
     all_con=triu(cortical_mat)
    
  i_aicha_premotor_right = [16 18 28 30 54 58 62 ];
file_info = dir ('LM*.mat');
file_names = {file_info.name};
n_subj = length (file_names);
for i_subj = 1 : n_subj
    clear dti_AICHA
    load (file_names{i_subj}, 'dti_AICHA');
    dtir = dti_AICHA.r(i_aicha_premotor_right);
   dti_data(i_subj,:)=dtir
end
 i_aicha_premotor_left = [15 17 27 29 53 57 61];
file_info = dir ('LM*.mat');
file_names = {file_info.name};
n_subj = length (file_names);
for i_subj = 1 : n_subj
    clear dti_AICHA
    load (file_names{i_subj}, 'dti_AICHA');
    dtil= dti_AICHA.r(i_aicha_premotor_right);
   dti_data(i_subj,:)=dtil
end


file_info = dir ('LM*.mat');
file_names = {file_info.name};
n_subj = length (file_names);
i_roi_left = [15 17 25 27];
i_roi_right = [16 18 26 28];
n_roi = length (i_roi_left);
n_aicha = 384;
i_aicha = 1:n_aicha;
for i_subj = 1 : n_subj
    clear dti_AICHA
    load (file_names{i_subj}, 'dti_AICHA');
    dti_left_mat = dti_AICHA.r(i_roi_left,i_roi_left);
    dti_right_mat = dti_AICHA.r(i_roi_right,i_roi_right);
    dti_left_rows = [tril(dti_left_mat,-1) triu(dti_left_mat,1)];
    dti_right_rows = [tril(dti_right_mat,-1) triu(dti_right_mat,1)];
    for i = 1 : n_roi
        dti_left_all(i,1:n_roi) = dti_left_rows(i,[1:i n_roi+i+1:end]);
        dti_right_all(i,1:n_roi) = dti_right_rows(i,[1:i n_roi+i+1:end]);
    end
end
 for i_subj = 1 : 4 % n_subj
    clear dti_AICHA
    load (file_names{i_subj}, 'dti_AICHA');
    dti_left_mat = dti_AICHA.r(i_roi_left,i_roi_left);
    dti_right_mat = dti_AICHA.r(i_roi_right,i_roi_right);
    dti_left_rows = [tril(dti_left_mat,-1) triu(dti_left_mat,1)];
    dti_right_rows = [tril(dti_right_mat,-1) triu(dti_right_mat,1)];
    for i = 1 : n_roi
        dti_left_all(i,1:n_roi,i_subj) = dti_left_rows(i,[1:i n_roi+i+1:end]);
        dti_right_all(i,1:n_roi,i_subj) = dti_right_rows(i,[1:i n_roi+i+1:end]);
    end
end

          % Get all cortical connectivity
          for i_subj = 1 : n_subj
    clear dti_AICHA
    load (file_names{i_subj}, 'dti_AICHA');
    dti_left_mat(:,:,i_subj) = dti_AICHA.r(i_left,i_left);
    dti_right_mat(:,:,i_subj) = dti_AICHA.r(i_right,i_right);
          end
dti_bias_mat = (dti_left_mat-dti_right_mat)./(dti_left_mat+dti_right_mat);


i_cortical = 1:384;
            n_cortical = length (i_cortical);
            cortical_mat = dti_AICHA.r(i_cortical,i_cortical);
            cortical_rows = [tril(cortical_mat,-1) triu(cortical_mat,1)];
            for i = 1 : n_cortical
all(i,1:n_cortical) = cortical_rows(i,[1:i n_cortical+i+1:end]);
            end
%partialcorrelation & correlation%
for i = 1 : 30
    for j = 1 : 30
            [r(j,i), p(j,i)] = corr (Target_Hits(:,1),squeeze(dtiall(i,j,:)),'Tail','left');    
            
    end
end;


z = norminv (1-p,0,1);
for i = 1 : 30
    for j = 1 : 30
            [r(j,i), p(j,i)] = partialcorr (Target_Hits(:,1),squeeze(dtiall(i,j,:)),[lesion_data(:,i) lesion_data(:,j)],'Tail','left');    
            
    end
end;

for i = 1 : 30
    for j = 1 : 30
            [r,p] = partialcorr (Target_Hits(:,1),y(:,1),[sb(:,1) sb(:,1)],'Tail','left');    
            
    end
end;

z = norminv (1-p,0,1);

 nii_save_nodz ('AICHA', dti_z_all(triu(true(384,384),1)), 'DTI_Targ_Hits', dti_mask(triu(true(384,384),1)));
 dti(isnan(dti))=0
         
            
            
                    
            