function copy_SPM_files(dir_data)
% datalad run
% datalad run -m "Copy SPM files" matlab -batch "addpath('code/'); copy_SPM_files('C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\')"
%     dir_data = 'C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\';

    load_toolboxes;
    dir_out = 'data\';

    dir_list = spm_select('List', dir_data, 'dir', '(sub-S|sub-EP)');

    for i = 2:size(dir_list,1)
        file_to_copy = fullfile(dir_data, deblank(dir_list(i,:)), 'SPM.mat');
        file_to_save = fullfile(dir_out, deblank(dir_list(i,:)), 'SPM.mat');

        fprintf('\n ... Copying file to: %s\n', file_to_save);
        copyfile(file_to_copy, file_to_save)
    end
end