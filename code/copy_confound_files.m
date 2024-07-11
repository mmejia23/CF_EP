function copy_confound_files(dir_data)
% datalad run
% datalad run -m "Copy confounds files" matlab -batch "addpath('code/'); copy_confound_files('C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\')"
%     dir_data = 'C:\Users\cthul\Dropbox\PROYECTOS\0-PhD\expBA\';

    load_toolboxes;
    dir_out = 'data\';

    dir_list = spm_select('List', dir_data, 'dir', '(sub-S|sub-EP)');

    for i = 1:size(dir_list,1)
        dir_sub = deblank(dir_list(i,:));
        tsv_file_to_copy = spm_select('FPListRec', fullfile(dir_data, dir_sub), 'desc-confounds_timeseries.tsv');
        [~,NAME,EXT] = fileparts(tsv_file_to_copy);
        tsv_file_to_save = fullfile(dir_out, dir_sub, 'func', [NAME, EXT]);
        json_file_to_copy = spm_select('FPListRec', fullfile(dir_data, dir_sub), 'desc-confounds_timeseries.json');
        [~,NAME,EXT] = fileparts(json_file_to_copy);
        json_file_to_save = fullfile(dir_out, dir_sub, 'func', [NAME, EXT]);

        fprintf('\n ... Copying file to: %s\n', tsv_file_to_save);
        copyfile(tsv_file_to_copy, tsv_file_to_save)
        fprintf('\n ... Copying file to: %s\n', tsv_file_to_save);
        copyfile(json_file_to_copy, json_file_to_save)
    end
end