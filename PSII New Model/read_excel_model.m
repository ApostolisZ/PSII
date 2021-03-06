species = {};
file_name = 'reactions_test.csv';
[~,reactions] = xlsread(file_name);
nrxn = length(reactions);
Si = [];
Sj = [];
Ss = [];


for irxn = 1:nrxn
rstring = reactions{irxn};
sep_ind = strfind(rstring,'->');
lhs = strtrim(rstring(1:sep_ind-1));
reactants = strtrim(strsplit(lhs,' + '));
n = regexp(reactants, '(?<stoich>\(?[0-9.]+\)?\s+|)(?<species>\S+)', 'names');
for ireactant = 1:length(n)
    if isempty(find(~cellfun(@isempty,strfind(species,n{ireactant}.species))))
        species{end+1} = n{ireactant}.species;
    end
    
    if ~isempty(n{ireactant}.stoich)
        s = regexp(n{ireactant}.stoich, '\(?([0-9.]+)\)?', 'tokens');
        stoich = str2double(s{1});
    else
        stoich = 1;
    end
    ireactant_ind = find(strcmp(species,n{ireactant}.species));
    Si = [Si;ireactant_ind];
    Sj = [Sj;irxn];
    Ss = [Ss; -stoich];

end


rhs = strtrim(rstring(sep_ind+2:end));
products = strtrim(strsplit(rhs,' + '));
n = regexp(products, '(?<stoich>\(?[0-9.]+\)?\s+|)(?<species>\S+)', 'names');
for iproduct = 1:length(n)
    if isempty(find(~cellfun(@isempty,strfind(species,n{iproduct}.species))))
        species{end+1} = n{iproduct}.species;
    end
    if ~isempty(n{iproduct}.stoich)
        s = regexp(n{iproduct}.stoich, '\(?([0-9.]+)\)?', 'tokens');
        stoich = str2double(s{1});
    else
        stoich = 1;
    end
    iproduct_ind = find(strcmp(species,n{iproduct}.species));
    Si = [Si;iproduct_ind];
    Sj = [Sj;irxn];
    Ss = [Ss; stoich];

end




end
S = sparse(Si,Sj,Ss);

foo = 1;

