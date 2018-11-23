%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk

function roc_auc= roc_auc_knn(XTrain, YTrain, XTest, YTest)


YTrain(YTrain==1)=10;YTrain(YTrain==2)=20;YTrain(YTrain==3)=30;
YTest(YTest==1)=10;YTest(YTest==2)=20;YTest(YTest==3)=30;


%merge class 2 and 3 as 2 : 
y_Train_1_vs_Rest=YTrain;
y_Test_1_vs_Rest=YTest;
y_Train_1_vs_Rest(y_Train_1_vs_Rest==10)=1;
y_Test_1_vs_Rest(y_Test_1_vs_Rest==10)=1;
y_Train_1_vs_Rest(y_Train_1_vs_Rest==20)=2;
y_Test_1_vs_Rest(y_Test_1_vs_Rest==20)=2;
y_Train_1_vs_Rest(y_Train_1_vs_Rest==30)=2;
y_Test_1_vs_Rest(y_Test_1_vs_Rest==30)=2;
 
%merge class 1 and 3 as 2  and class 2 as 1: 
y_Train_2_vs_Rest=YTrain;
y_Test_2_vs_Rest=YTest;
y_Train_2_vs_Rest(y_Train_2_vs_Rest==20)=1;
y_Test_2_vs_Rest(y_Test_2_vs_Rest==20)=1;
y_Train_2_vs_Rest(y_Train_2_vs_Rest==10)=2;
y_Test_2_vs_Rest(y_Test_2_vs_Rest==10)=2;
y_Train_2_vs_Rest(y_Train_2_vs_Rest==30)=2;
y_Test_2_vs_Rest(y_Test_2_vs_Rest==30)=2;

%merge class 3 as 1 and class 2 and 3 as 2 : 
y_Train_3_vs_Rest=YTrain;
y_Test_3_vs_Rest=YTest;
y_Train_3_vs_Rest(y_Train_3_vs_Rest==10)=2;
y_Test_3_vs_Rest(y_Test_3_vs_Rest==10)=2;
y_Train_3_vs_Rest(y_Train_3_vs_Rest==20)=2;
y_Test_3_vs_Rest(y_Test_3_vs_Rest==20)=2;
y_Train_3_vs_Rest(y_Train_3_vs_Rest==30)=1;
y_Test_3_vs_Rest(y_Test_3_vs_Rest==30)=1;



k=1
nb_trees=1000

% AUC ROC for class bad against rest
knn_1 = fitcknn(XTrain,y_Train_1_vs_Rest,'NumNeighbors',k,'Distance','euclidean');
CVMdl_1= crossval(knn_1);
label_knn_1 = predict(knn_1,XTest);
[X_knn_1,Y_knn_1,T_knn_1,AUC_knn_1] = perfcurve(y_Test_1_vs_Rest,label_knn_1,'2');
AUC_knn_1


rf_1 = TreeBagger(nb_trees,XTrain,y_Train_1_vs_Rest,'OOBPrediction','On','Method','classification');
label_rf_1 = predict(rf_1,XTest);
label_rf_1 = str2double(label_rf_1);
[X_rf_1,Y_rf_1,T_rf_1,AUC_rf_1] = perfcurve(y_Test_1_vs_Rest,label_rf_1,'2');
AUC_rf_1

figure(1)
plot(X_knn_1,Y_knn_1)
hold on
plot(X_rf_1,Y_rf_1)
legend('knn','random forest','Location','Best')
xlabel('False positive rate'); ylabel('True positive rate');
title('ROC Curves for knn and random forest Classification bad vs rest')
hold off



% AUC ROC for class medium against rest

knn_2 = fitcknn(XTrain,y_Train_2_vs_Rest,'NumNeighbors',k,'Distance','euclidean');
CVMdl_2= crossval(knn_2);
label_knn_2 = predict(knn_2,XTest);
[X_knn_2,Y_knn_2,T_knn_1,AUC_knn_2] = perfcurve(y_Test_2_vs_Rest,label_knn_2,'2');
AUC_knn_2


rf_2 = TreeBagger(nb_trees,XTrain,y_Train_2_vs_Rest,'OOBPrediction','On','Method','classification')
label_rf_2 = predict(rf_2,XTest);
label_rf_2 = str2double(label_rf_2);
[X_rf_2,Y_rf_2,T_rf_2,AUC_rf_2] = perfcurve(y_Test_2_vs_Rest,label_rf_2,'2');
AUC_rf_2

figure(2)
plot(X_knn_2,Y_knn_2)
hold on
plot(X_rf_2,Y_rf_2)
legend('knn','random forest','Location','Best')
xlabel('False positive rate'); ylabel('True positive rate');
title('ROC Curves for knn and random forest Classification medium vs rest')
hold off


% AUC ROC for class good against rest

knn_3 = fitcknn(XTrain,y_Train_3_vs_Rest,'NumNeighbors',k,'Distance','euclidean');
CVMdl_3= crossval(knn_3);
label_knn_3 = predict(knn_3,XTest);
[X_knn_3,Y_knn_3,T_knn_3,AUC_knn_3] = perfcurve(y_Test_3_vs_Rest,label_knn_3,'2');
AUC_knn_3


rf_3 = TreeBagger(nb_trees,XTrain,y_Train_3_vs_Rest,'OOBPrediction','On','Method','classification')
label_rf_3 = predict(rf_3,XTest);
label_rf_3 = str2double(label_rf_3);
[X_rf_3,Y_rf_3,T_rf_3,AUC_rf_3] = perfcurve(y_Test_3_vs_Rest,label_rf_3,'2');
AUC_rf_3

figure(3)
plot(X_knn_3,Y_knn_3)
hold on
plot(X_rf_3,Y_rf_3)
legend('knn','random forest','Location','Best')
xlabel('False positive rate'); ylabel('True positive rate');
title('ROC Curves for knn and random forest Classification good vs rest')
hold off

%average auc roc knn 
avauc_knn=(AUC_knn_1+AUC_knn_2+AUC_knn_3)/3
%average auc roc random forest
avauc_rf=(AUC_rf_1+AUC_rf_2+AUC_rf_3)/3

