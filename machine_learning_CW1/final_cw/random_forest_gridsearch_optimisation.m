%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function rf_gridsearch = random_forest_gridsearch_optimisation(XTrain, YTrain, XTest, YTest)

nb_trees=1000;
%declare observation per leaf 
bestLS=100;
%declare features to be sampled
bestPTS=100;
%set error to 1 for minimisation
min_err=1;

% go through number of leaf (20 max)
for minLS=1:20
    % go through number of feature that can be sampled( 11 features in this
    % dataset)
    for numPTS=1:11
        
        randomForest = TreeBagger(nb_trees,XTrain,YTrain,'Method','classification',...
        'OOBPrediction','on','MinLeafSize',minLS,...
        'NumPredictorstoSample',numPTS);
    
        err=oobError(randomForest);
        avgerr=sum(err)/nb_trees;
        
        %save best LS and best PTS if new minimum error is found
        if avgerr<min_err
            bestLS=minLS;
            bestPTS=numPTS;
            min_err=avgerr;
        end
        

    
    end
end

%train model with optimal parameters found in grid search
Mdl = TreeBagger(nb_trees,XTrain,YTrain,'Method','classification',...
'OOBPrediction','on','MinLeafSize',bestLS,...
'NumPredictorstoSample',bestPTS);

%print best parameters
bestLS
bestPTS

%test model 
label = predict(Mdl,XTest);
label = str2double(label);
ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);