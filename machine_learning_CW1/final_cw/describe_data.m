%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk


%return description of each attribute (mean, min, max, median, std)
function describe= describe_data(data_class_merged);

%split dataset by the 3 classes
index_one=find(data_class_merged(:,12)==1);
class_one=data_class_merged(index_one,:);

index_two=find(data_class_merged(:,12)==2);
class_two=data_class_merged(index_two,:);

index_three=find(data_class_merged(:,12)==3);
class_three=data_class_merged(index_three,:);


%fixed acidity
fa=summary(class_one(:,1));
%volatile acidity
va=summary(class_one(:,2));
%citric acid
ca=summary(class_one(:,3));
%residual sugar
rs=summary(class_one(:,4));
%chlorides
ch=summary(class_one(:,5));
%free sulfur dioxide
fsd=summary(class_one(:,6));
%total sulfur
ts=summary(class_one(:,7));
%density
d=summary(class_one(:,8));
%pH
ph=summary(class_one(:,9));
%sulphate
su=summary(class_one(:,10));
%alcohol
a=summary(class_one(:,11));
disp('                                         class 1    ')
disp('                         max       min       mean     median     std')
fprintf('fixed acidity       ');disp(fa)
fprintf('volatile acidity    ');disp(va)
fprintf('citric acid         ');disp(ca)
fprintf('residual sugar      ');disp(rs)
fprintf('chlorides           ');disp(ch)
fprintf('free sulfur dioxide ');disp(fsd)
fprintf('total sulfur        ');disp(ts)
fprintf('density             ');disp(d)
fprintf('pH                  ');disp(ph)
fprintf('sulphate            ');disp(su)
fprintf('alcohol             ');disp(a)




%fixed acidity
fa=summary(class_two(:,1));
%volatile acidity
va=summary(class_two(:,2));
%citric acid
ca=summary(class_two(:,3));
%residual sugar
rs=summary(class_two(:,4));
%chlorides
ch=summary(class_two(:,5));
%free sulfur dioxide
fsd=summary(class_two(:,6));
%total sulfur
ts=summary(class_two(:,7));
%density
d=summary(class_two(:,8));
%pH
ph=summary(class_two(:,9));
%sulphate
su=summary(class_two(:,10));
%alcohol
a=summary(class_two(:,11));

disp('                                         class 2    ')
disp('                         max       min       mean     median     std')
fprintf('fixed acidity       ');disp(fa)
fprintf('volatile acidity    ');disp(va)
fprintf('citric acid         ');disp(ca)
fprintf('residual sugar      ');disp(rs)
fprintf('chlorides           ');disp(ch)
fprintf('free sulfur dioxide ');disp(fsd)
fprintf('total sulfur        ');disp(ts)
fprintf('density             ');disp(d)
fprintf('pH                  ');disp(ph)
fprintf('sulphate            ');disp(su)
fprintf('alcohol             ');disp(a)

%fixed acidity
fa=summary(class_three(:,1));
%volatile acidity
va=summary(class_three(:,2));
%citric acid
ca=summary(class_three(:,3));
%residual sugar
rs=summary(class_three(:,4));
%chlorides
ch=summary(class_three(:,5));
%free sulfur dioxide
fsd=summary(class_three(:,6));
%total sulfur
ts=summary(class_three(:,7));
%density
d=summary(class_three(:,8));
%pH
ph=summary(class_three(:,9));
%sulphate
su=summary(class_three(:,10));
%alcohol
a=summary(class_three(:,11));


disp('                                         class 3    ')
disp('                         max       min       mean     median     std')
fprintf('fixed acidity       ');disp(fa)
fprintf('volatile acidity    ');disp(va)
fprintf('citric acid         ');disp(ca)
fprintf('residual sugar      ');disp(rs)
fprintf('chlorides           ');disp(ch)
fprintf('free sulfur dioxide ');disp(fsd)
fprintf('total sulfur        ');disp(ts)
fprintf('density             ');disp(d)
fprintf('pH                  ');disp(ph)
fprintf('sulphate            ');disp(su)
fprintf('alcohol             ');disp(a)



end