%%Developer Mohamed Bhailat, Ahmed Mohamed
%%Date  23-11-2018
%%Mail Id: mohamed.bhailat@city.ac.uk
%%Mail Id: ahmed.mohamed.5@city.ac.uk
function histo = load_figure(X)


figure(1);
facidity=X(:,1);
facidity_histo=histogram(facidity);
title('distribution fixed acidity ');
xlabel('tartaric acid - g / dm^3');
ylabel('number of observation');
histo=facidity_histo;

figure(2);
vacidity=X(:,2);
vacidity_histo=histogram(vacidity);
title('distribution fixed acidity ');
xlabel('acetic acid - g / dm^3');
ylabel('number of observation');
histo=vacidity_histo;

figure(3);
citric=X(:,3);
citric_histo=histogram(citric);
title('distribution citric acide');
xlabel('citric acid - g / dm^3');
ylabel('number of observation');
histo=citric_histo;

figure(4);
sugar=X(:,4);
sugar_histo=histogram(sugar);
title('residual sugar');
xlabel('g / dm^3');
ylabel('number of observation');
histo=sugar_histo;

figure(5);
chlorides=X(:,5);
chlorides_histo=histogram(chlorides);
title('distribution chlorides');
xlabel('sodium chloride - g / dm^3');
ylabel('number of observation');
histo=chlorides_histo;

figure(6);
fsd=X(:,6);
fsd_histo=histogram(fsd);
title('free sulfur dioxide');
xlabel('mg / dm^3');
ylabel('number of observation');
histo=fsd_histo;

figure(7);
tsd=X(:,7);
tsd_histo=histogram(tsd);
title('total sulfur dioxide');
xlabel('mg / dm^3');
ylabel('number of observation');
histo=tsd_histo;

figure(8);
density=X(:,8);
density_histo=histogram(density);
title('distribution density');
xlabel('density (g / cm^3)');
ylabel('number of observation');
histo=density_histo;


figure(9);
ph=X(:,9);
ph_histo=histogram(ph);
title('distribution Ph');
xlabel('ph');
ylabel('number of observation');
histo=ph_histo;

figure(10);
sulphate=X(:,10);
sulphate_histo=histogram(sulphate);
title('distribution sulphate');
xlabel('potassium sulphate - g / dm^3');
ylabel('number of observation');
histo=sulphate_histo;

figure(11);
alcohol=X(:,11);
alcohol_histo=histogram(alcohol);
title('distribution citric acide');
xlabel('% by volume');
ylabel('number of observation');
histo=alcohol_histo;



figure(12)
plotmatrix(X(:,12))
saveas(gcf,'Scatter_plot_matrix.png')

xvalues = {'Fixed acidity','Volatile acidity','citric acid','residual sugar', 'chlorides','free sulfur dioxide','total sulfur dioxide','density','pH','sulphates', 'alcohol', 'quality'};
yvalues = {'Fixed acidity','volatile acidity','citric acid','residual sugar', 'chlorides','free sulfur dioxide','total sulfur dioxide','density','pH','sulphates', 'alcohol', 'quality'};

figure(13)
corr_graph=corrplot(X);

figure(14)
colorbar;
h = heatmap(xvalues,yvalues,corr_graph);
h.title('heatmap ')
h.Colormap=parula



end