%Paramater
depth = 256;
width = 24;
point_pos = 20;

%calculation
ln_depth = log2(depth)/4;
ln_width = width/4;
for i=1:1
    file_name = strcat('data\rand24_',int2str(i),'.mif');
    fid = fopen(file_name,'wt');
    fprintf(fid, 'DEPTH = %s;\n', int2str(depth));
    fprintf(fid, 'WIDTH = %s;\n', int2str(width));
    fprintf(fid, 'ADDRESS_RADIX = HEX;\n');
    fprintf(fid, 'DATA_RADIX = HEX;\n');
    fprintf(fid, 'CONTENT\n');
    fprintf(fid, 'BEGIN\n');
    for i=0:(depth-1)
        addr = dec2hex(i,ln_depth);
        val = uint32((2^point_pos)*rand(1));
        sign = rand(1);
        if sign > 0.5
            val = 2^width - val;
        end
        txt_temp = dec2hex(val,ln_width);
        fprintf(fid, '%s : %s;\n', addr, txt_temp);
    end
    fprintf(fid, 'END;\n');
    fclose(fid);
end