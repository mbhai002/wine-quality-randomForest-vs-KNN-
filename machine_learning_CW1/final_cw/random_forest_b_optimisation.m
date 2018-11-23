%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk


%optimisation using baysian method on random forest
function rf_b_opt = random_forest_b_optimisation(XTrain, YTrain, XTest, YTest,data_class_merged)


nb_trees=1000

maxMinLS = 20;
minLS = optimizableVariable('minLS',[1,maxMinLS],'Type','integer');
numPTS = optimizableVariable('numPTS',[1,size(XTrain,2)],'Type','integer');
hyperparametersRF = [minLS; numPTS];
results = bayesopt(@(params)oobErrRF(params,data_class_merged),hyperparametersRF,...
    'AcquisitionFunctionName','expected-improvement-plus','Verbose',1);
bestOOBErr = results.MinObjective
bestHyperparameters = results.XAtMinObjective


%train model with best paramaters found 
Mdl = TreeBagger(1000,XTrain,YTrain,'Method','classification',...
    'MinLeafSize',bestHyperparameters.minLS,...
    'NumPredictorstoSample',bestHyperparameters.numPTS,...
    'OOBPrediction','on');

%test model 
label = predict(Mdl,XTest);
label = str2double(label)

ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);


