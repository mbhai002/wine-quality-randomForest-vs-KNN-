%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function grid_search_knn = grid_search_knn(XTrain, YTrain, XTest, YTest)


distance=["cityblock" "chebychev" "euclidean" "mahalanobis" "minkowski"]

%declaring error and loss to perform grid search
minerr=1
loss=[]

% go through distances
for dis=1:5
    %go through 50 k 
    for k=1:50
    
        actual_distance=distance(dis);
        Mdl = fitcknn(XTrain,YTrain,'NumNeighbors',k,'Distance',actual_distance);
        CVMdl=crossval(Mdl);
        kloss=kfoldLoss(CVMdl);
        
        loss=[loss kloss]
        
        
        % save best k and best distance if a new minimum error is found
        if kloss<minerr;
            minerr=kloss;
            best_k=k;
            best_distance=actual_distance;
        end
        
        
        
    end
       
        
        
       

    

end


% train model with best k and best distance found in grid search
Mdl = fitcknn(XTrain,YTrain,'NumNeighbors',best_k,'Distance',best_distance);

%test model using test set
label = predict(Mdl,XTest);

ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);

best_k
best_distance



end