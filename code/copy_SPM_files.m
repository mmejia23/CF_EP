function copy_SPM_files(dir_data)
% datalad run
% datalad run -m "Copy SPM files" matlab -batch "addpath('code/'); copy_SPM_files('C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\')"

%     addpath(code);
%     dir_data = 'C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\';
    dir_out = 'data\';

    dir_list = spm_select('List', dir_data, 'dir', '(sub-S|sub-EP)');

    file_to_copy = fullfile(dir_data, deblank(dir_list(1,:)), 'SPM.mat');
    file_to_save = fullfile(dir_out, deblank(dir_list(1,:)), 'SPM.mat');

    copyfile(file_to_copy, file_to_save)

end