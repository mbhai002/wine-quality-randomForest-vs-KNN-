%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk

function bo_knn=bayse_optimization_knn(XTrain, YTrain, XTest, YTest)


%train knn model with baysian optimisation with train dataset
Mdl = fitcknn(XTrain,YTrain,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'))


%predict using test set with best model found
label = predict(Mdl,XTest);
ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);



end