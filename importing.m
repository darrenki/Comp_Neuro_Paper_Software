participant = 'P13'
date = 'P13_2024_08_30'
c = dir(sprintf('%s\\%s\\Hums\\Non_300Hz\\*A*.mat', participant, date)); % if you change the import data, make sure to change the save file name at the end to prevent data overwrite
names = {c.name};
mask = ~contains(names, "impedance");   % keep files NOT containing "impedance"
c = c(mask);

% c2 = dir(sprintf('%s\\%s\\No_Hums\\*A*.mat', participant, date));
% names2 = {c2.name};
% mask2 = ~contains(names2, "impedance");   % keep files NOT containing "impedance"
% c2 = c2(mask2);
% size2 = numel(c2);
% mid = floor(size2 / 2);
% firstHalf = c2(1:mid);
% secondHalf = c2(mid+1:end);
% c = [firstHalf; c; secondHalf];

tic
x = cell(size(c,1), 1);
parfor i= 1:size(c,1)
    data_name = c(i).name;
    data_folder = c(i).folder;
    S= matfile(fullfile(data_folder, data_name));
    [nRows, nCols] = size(S.samples);
    if (nRows>0) && (nCols>0)
        data = S.samples(2:69,:);
        meta_data = S.samples(nRows-2,:);
        x{i} = [data;meta_data];
    end
end
display("END OF CELL ALLOCATION");
%
data = cat(2, x{:});
save(sprintf("%s_Cont.mat", date) , 'data', '-v7.3', '-nocompression');

toc