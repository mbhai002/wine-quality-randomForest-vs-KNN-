%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function Mdl_knn=knn(XTrain, YTrain, XTest, YTest)

%train knn model with optimal parameters ( k=1 and distance ='mahalanobis')
Mdl = fitcknn(XTrain,YTrain,'NumNeighbors',1,'Distance','mahalanobis');
CVMdl = crossval(Mdl);
finalkloss = kfoldLoss(CVMdl)

%test model
label = predict(Mdl,XTest);
ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);
