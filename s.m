function s(result, decimals)
% prints a number to `decimals' places, defaulting at 4
    if ~exist('decimals','var') || isempty(decimals)
        decimals = 4;
    end

    format = sprintf('%%.%if\n', decimals);
    fprintf(format, result);
end
% No tests for s()
