function [out_header,out_data,message_string]=RLW_hanning_taper(header,data,varargin);
%RLW_hanning_taper
%
%Hanning taper
%
%
% Author : 
% Andre Mouraux
% Institute of Neurosciences (IONS)
% Universite catholique de louvain (UCL)
% Belgium
% 
% Contact : andre.mouraux@uclouvain.be
% This function is part of Letswave 6
% See http://nocions.webnode.com/letswave for additional information
%



%init message_string
message_string={};
message_string{1}='Hanning taper';

%prepare out_header
out_header=header;

%init out_data
out_data=data;

%construct hanning taper
tpx=1:1:header.datasize(6);
tpy=(0.5*(cos(-pi+(2*tpx/length(tpx)*pi))))+0.5;

%apply taper
for epochpos=1:header.datasize(1);
    for chanpos=1:header.datasize(2);
        for indexpos=1:header.datasize(3);
            for dz=1:header.datasize(4);
                for dy=1:header.datasize(5);
                    out_data(epochpos,chanpos,indexpos,dz,dy,:)=squeeze(data(epochpos,chanpos,indexpos,dz,dy,:)).*tpy';
                end;
            end;
        end;
    end;
end;
                    

         


