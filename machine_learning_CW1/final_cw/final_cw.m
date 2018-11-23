%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
%close all; clear all; clc;
n=1;

while n>0
%close all; clear all;
fprintf('\n Random Forest vs Knn \n ')
fprintf('\n 1 : load figures ... \n 2 : stat/description dataset ... \n 3 : grid search knn... \n ')
fprintf('4 : bayes optimisation knn...\n 5 : knn with best parameters...\n 6 : random forest using bayse optimisation...\n 7 : random forest with grid search...\n ')
fprintf('8 : random forest with best parameters...\n 9 : Area under ROC curve knn and rf \n 10 : extra work : feature selection KNN+DFO (dispersive flies optimisation) \n \n ')
fprintf('-1 to exit the program\n ')
n = input('Enter a number: ');
[data,X,y,XTrain,YTrain, XTest, YTest, data_class_merged]=load_data('cw1.csv');

switch n
    case 1
        %distribution, heatmap, corelation , merged class
        load_figure(data)
    case 2
        %description of each attribute/per class : min, max, mean, median, std
        describe_data(data_class_merged);
    case 3
        %grid search knn ( search for best k and best distance)
        grid_search_knn(XTrain, YTrain, XTest, YTest)
    case 4
        %baysiean search optimisation
        bayse_optimization_knn(XTrain, YTrain, XTest, YTest)
    case 5
        %train knn using best k and best distance
        knn(XTrain, YTrain, XTest, YTest)
    case 6
        %optimisation of rf using bayesian optimisation
        random_forest_b_optimisation(XTrain, YTrain, XTest, YTest,data_class_merged)
    case 7
        %optimisation of rf using grid search
        random_forest_gridsearch_optimisation(XTrain, YTrain, XTest, YTest)
    case 8
        % random forest with best paramaters
        random_forest(XTrain, YTrain, XTest, YTest)
    case 9
        %comparison ROC-AUC  for 3classes (bad, medium, good) knn vs rf
        roc_auc_knn(XTrain, YTrain, XTest, YTest)
    case 10
        %search for optimal k + optimal distance measure + feature
        %selection using DFO (metaheuristic algorithm for complex search space
        knn_dfo(XTrain, YTrain, XTest, YTest)
        
    otherwise
        disp('other value')
end

end
