%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk


%return decription of a feature (mean, min, max, median, std)
function describe = summary(array)

maxout    = max(array);
minout    = min(array);
meanout   = mean(array);
medianout = median(array);
stdout    = std(array);
describe=[maxout minout meanout medianout stdout];