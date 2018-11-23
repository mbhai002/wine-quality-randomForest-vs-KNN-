%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function rf=random_forest(XTrain, YTrain, XTest, YTest)


%number of trees in forest
nb_trees=1000

%train model and get ooberrors

Mdl = TreeBagger(nb_trees,XTrain,YTrain,'Method','classification',...
    'MinLeafSize',2,'NumPredictorstoSample',1,'OOBPrediction','on')



err=oobError(Mdl);

xlabel('Number of Grown Trees')
ylabel('Out of Bag Classification Error')

avgerr=sum(err)/nb_trees

%timer
t=cputime;

%test model
label = predict(Mdl,XTest);
label = str2double(label);
ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);

%time 
e=cputime-t

end