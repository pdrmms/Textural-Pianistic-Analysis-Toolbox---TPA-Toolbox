function lrmount = lrmount
% The function "lrmount" generates a list of all fingercodes relative to
% the hands in the pianistic setting. The list have 248.941 entries.
% 
% Usage:
%           lrmount
% Example:
%           lrmount
% 
%               ans =
% 
%                   [list of 248.941 fingercodes referent to the pianist
%                   hand settings. It was hidden here for the sake of
%                   space]
% 
% Created in July 2023 under MATLAB 2022 (Mac OS)
%
% © Part of Pianistic Textural Analysis Toolbox - PTA Toolbox,
% Copyright ©2023, Pauxy Gentil Nunes Filho, Pedro Miguel de Moraes
% PArtiMus Research Group - PPGM-UFRJ
% See License.txt
% ==========
lrmount = [];
reflines = [1 2 5 15 52];
    for f = 1:5
        list = nlist(f);
        tempblock = rhcode2(list(1,:),1);
        sizetb = size(tempblock,1);
        for g = 1:size(list,1)
            templine = list(g,:);
            lhlist = repmat(templine,sizetb,1);
            fhcodes = [lhlist tempblock];
            lrmount = [lrmount; fhcodes];
        end
    end
end