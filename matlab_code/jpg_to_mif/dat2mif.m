function [] = dat2mif(varname, filename, nstack)
%DAT2MIF Summary of this function goes here
%   Detailed explanation goes here

    %General parameter
    width = 24;                %you may change it
    point_pos = 20;            %you may cahnge it
    ln_width = ceil(width/4);
    log_nstack = log2(nstack); %formating purpose (not so important)
    
    %Create hidden mif file 
    %Hidden paramater calculation
    temp = varname;              %you may change the variable name
    varsize = size(temp);     
    depth_bit = ceil(log2(varsize(2)));
    depth = 2^depth_bit;
    ln_depth = ceil(depth_bit/4)+log_nstack;      %formating purpose(not so important)
    nfiles = varsize(1)/nstack;        %number of files be created
    %Convert to uint
    temp = (2^point_pos)*temp;
    temp = (temp<0).*(2^width)+temp;
    temp = uint32(temp);
    for i=0:(nfiles-1)
        file_name = strcat(filename,'_',int2str(i),'.mif');
        fid = fopen(file_name,'wt');
        fprintf(fid, 'DEPTH = %s;\n', int2str(depth*nstack));
        fprintf(fid, 'WIDTH = %s;\n', int2str(width));
        fprintf(fid, 'ADDRESS_RADIX = HEX;\n');
        fprintf(fid, 'DATA_RADIX = HEX;\n');
        fprintf(fid, 'CONTENT\n');
        fprintf(fid, 'BEGIN\n');
        for j=0:(nstack-1)
            for k=0:(depth-1)
                addr = dec2hex(k+j*depth,ln_depth);
                if (k<varsize(2))
                  val = temp(1+j+i*nstack,1+k);
                else
                  val = uint32(0);
                end
                txt_temp = dec2hex(val,ln_width);
                fprintf(fid, '%s : %s;\n', addr, txt_temp);
            end
        end
        fprintf(fid, 'END;\n');
        fclose(fid);
    end
end

