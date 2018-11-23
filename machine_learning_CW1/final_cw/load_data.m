%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function [data,X,y, XTrain,YTrain, XTest, YTest, data_class_merged] =load_data(file)

data=csvread(file,2);
X=data(:,1:11);
y=data(:,12);

%merging label 3,4,5 in 1 ; 7,8,9 in 3
y_merged=y;
y_merged(y_merged==3)=1;
y_merged(y_merged==4)=1;
y_merged(y_merged==5)=1;
y_merged(y_merged==6)=2;
y_merged(y_merged==7)=3;
y_merged(y_merged==8)=3;
y_merged(y_merged==9)=3;


data_class_merged=[X y_merged];
data_class_merged=[data_class_merged(:,1) data_class_merged(:,2) data_class_merged(:,3) data_class_merged(:,4)...
    data_class_merged(:,5) data_class_merged(:,6) data_class_merged(:,7) data_class_merged(:,8) data_class_merged(:,9)...
    data_class_merged(:,10)...
    data_class_merged(:,11)  data_class_merged(:,12)];



% Cross validation (train: 80%, test: 20%)
rng(1);
cv = cvpartition(size(data,1),'HoldOut',0.2);
idx = cv.test;

% Separate to training and test data
dataTrain = data_class_merged(~idx,:);
XTrain=dataTrain(:,1:11);
XTrain = zscore(XTrain);

YTrain=dataTrain(:,12);

dataTest  = data_class_merged(idx,:);
XTest=dataTest(:,1:11);
XTest = zscore(XTest);

YTest=dataTest(:,12);




end

