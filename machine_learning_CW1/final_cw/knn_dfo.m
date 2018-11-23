%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function knn_dfo=knn_dfo(XTrain, YTrain, XTest, YTest)


iteration=20;
size=20;
dt=0.2

reset(RandStream.getGlobalStream,sum(100*clock));

all_time_bs =[]
all_time_best_feature =[]
all_time_best_k =[]
all_time_best_distance =[]



all_time_best_score=10

%create a population of random K between 1 and 30
min_k=1
max_k=30
pop_k=randi([min_k max_k],size,1);




distance=["cityblock" "chebychev" ...
    "euclidean" "mahalanobis"...
    "minkowski"]
min_d=1
max_d=5
pop_d=min_d + (max_d-min_d).*rand(size,1)
pop_d=round(pop_d,0)

pop_features=randi([1 2047],size,1);
best_n= zeros(size,3)

flies=[pop_features pop_d pop_k]


for k=1:iteration
    fitnesses=zeros(size,1)
    
    for i=1:size
        % evaluation of each fly 
        
        fly_dec=flies(i,1)
        fly_bin=decimalToBinaryVector(fly_dec, 11, 'MSBFirst')
        XTrain_p = data_cleaning(XTrain,fly_bin);
        XTest_p = data_cleaning(XTest,fly_bin);
        
        dd=distance(:,flies(i,2))
        
        
        Mdl = fitcknn(XTrain_p,YTrain,'NumNeighbors',flies(i,3),'Distance',dd);
        CVMdl = crossval(Mdl);
        kloss = kfoldLoss(CVMdl)
        
      
        fitnesses(i)=kloss

    end
    
    % find best fly in the swarm 
    
    swarm_best_index=find(fitnesses == min(fitnesses(:)))
    s=flies(swarm_best_index,:)
    swarms_best=s(1,:)
    
    if min(fitnesses)<=all_time_best_score
        all_time_best_score = min(fitnesses)
        all_time_bs=[all_time_bs all_time_best_score]
        all_time_best_feature = [all_time_best_feature swarms_best(1)]
        all_time_best_k = [all_time_best_k swarms_best(3)]
        all_time_best_distance = [all_time_best_distance swarms_best(2)]
    end
    
    r=rand(size,3);
    
    % find best neighbour of each fly (left or right)
    
    for i=1:size
        if eq(i,1)==false
            left=i-1
        else
            left=size
        end
        if eq(i,size)==false
            right= i+1
        else
            right=1
        end
        
        
        if fitnesses(left)<fitnesses(right)
            best_neighbour=flies(left,:)
        else
            best_neighbour=flies(right,:)
        end
        best_n(i,:)=best_neighbour
        
    end
    
    % update fly
    
    for x=1:size
        if x~=swarm_best_index
            % 1/ update each flies using position of best fly in the swarm,
            % position of best neighbour and position of current fly.
            for i=1:3
                random=rand(1)
                update=best_n(x,i)-flies(x,i)
                flies(x,i)= round(swarms_best(i) + random * update,0)
            end
            
            % 2/ disturb flie if less than disturbance threshold
            for i=1:3
                if(i==1)
                    if (r(x,i) < dt)
                        flies(x,i) = randi([1 2047],1)
                    end
                end
                if(i==2)
                    if(r(x,i) < dt)
                        flies(x,i) = round(min_d + (max_d-min_d).*rand(1))
                    end
                end
                if(i==3)
                    if(r(x,i) < dt)
                        flies(x,i) = randi([min_k max_k],1)
                    end
                end
            end
            
            % 3/ relocate a fly to a random position if it is out of range
            
            for i=1:3
                if and(i==1 , or(flies(x,i)<1 , flies(x,i)>2047) )
                    flies(x,i)=randi([1 2047],1)
                end
                if and(i==2 , or(flies(x,i)<min_d , flies(x,i)>max_d))
                    flies(x,i)=round(min_d + (max_d-min_d).*rand(1))
                end
                if and(i==3 , or(flies(x,i)<min_k , flies(x,i)>max_k))
                    flies(x,i)=randi([min_k max_k],1)
                end
            end
            
            
            
            
        end
        
        
        
    end
    
    
    
end


all_time_bs=all_time_bs.'
all_time_best_feature = all_time_best_feature.'
all_time_best_k = all_time_best_k.'
all_time_best_distance = all_time_best_distance.'
all_time_best_dim=[all_time_bs all_time_best_feature all_time_best_k all_time_best_distance]


fly_dec= all_time_best_feature(end)
fly_bin=decimalToBinaryVector(fly_dec, 11, 'MSBFirst')
XTrain_p = data_cleaning(XTrain,fly_bin);
XTest_p = data_cleaning(XTest,fly_bin);

dd=distance(:,all_time_best_distance(end))

finalMdl = fitcknn(XTrain_p,YTrain,'NumNeighbors',all_time_best_k(end),'Distance',dd);
finalCVMdl = crossval(finalMdl);
finalkloss = kfoldLoss(finalCVMdl)
label = predict(finalMdl,XTest_p);
ta=table(YTest,label,'VariableNames',{'TrueLabel','PredictedLabel'});
[c_matrixp,Result]=getMatrix(YTest,label);






