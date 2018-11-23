%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk

%this function return dataset with attributes selected in input as binary
function [X_subset]=data_cleaning(data,vector);
		if  sum(vector~=0,2)==0
			X_subset = data
			
        else
			X_subset = data(:,vector==1);
            
        end
end
        
        
		