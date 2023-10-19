function list = nlist(n)
% The function "nlist" generates a list of all fingercodes relative to one
% hand in the pianistic setting, given a number of involved parts. Blocks
% are indicated by repetitions of a number. Fingercodes are based on the
% concept of thread-words (Moreira 2019).
% 
% Usage:
%           nlist(number of parts)
% Example:
%             nlist(4)
% 
%             ans =
% 
%                  1     1     2     3     4
%                  1     2     1     3     4
%                  1     2     2     3     4
%                  1     2     3     1     4
%                  1     2     3     2     4
%                  1     2     3     3     4
%                  1     2     3     4     1
%                  1     2     3     4     2
%                  1     2     3     4     3
%                  1     2     3     4     4
%                  1     2     3     4     0
%                  1     2     3     0     4
%                  1     2     0     3     4
%                  1     0     2     3     4
%                  0     1     2     3     4
% 
% Created in July 2023 under MATLAB 2022 (Mac OS)
%
% © Part of Pianistic Textural Analysis Toolbox - PTA Toolbox,
% Copyright ©2023, Pauxy Gentil Nunes Filho, Pedro Miguel de Moraes
% PArtiMus Research Group - PPGM-UFRJ
% See License.txt
% ==========
tab = lhcode;
inds = [];
    for f = 1:size(tab,1)
        templine = tab(f,:);
        maxline = max(templine);
        if maxline == n
            inds = [inds; f];
        end
    end
    list = tab(inds,:);
end