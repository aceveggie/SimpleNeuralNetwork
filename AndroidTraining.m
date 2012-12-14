% This code takes hand written digits collected from various subjects on Android Devices
% and trains a 2 Hidden Layer Feed Forward Neural Network
close all;
clear ; 
clc;
%initliaze parameters
input_image_size  = 784;
hidden_layer_size1 = 100;
hidden_layer_size2 = 50;	
num_labels = 10;

% read data
[Xtrain, ytrain, Xtest, ytest, Xcross, ycross] = ReadAndroidMat();

fprintf('setting initial variables\n\n');

iTheta1 = InitializeWeights(input_image_size, hidden_layer_size1);
iTheta2 = InitializeWeights(hidden_layer_size1, hidden_layer_size2);
iTheta3 = InitializeWeights(hidden_layer_size2, num_labels);

initial_nn_params = [iTheta1(:) ; iTheta2(:); iTheta3(:);];

setOpt = optimset('MaxIter', 50);
% using lambda to reduce overfitting
lambda = 1;
fprintf('optimizing parameters\n\n');

nncostFunction = @(p) CostFunction(p, input_image_size, hidden_layer_size1, hidden_layer_size2, num_labels, Xtrain, ytrain, lambda);

% returns cost, new learnt parameters
% we need the cost to be as low as possible
[nn_params, cost] = fmincg(nncostFunction, initial_nn_params, setOpt);

Theta1 = reshape(nn_params(1:hidden_layer_size1 * (input_image_size + 1)), hidden_layer_size1, (input_image_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size1 * (input_image_size + 1))):(( (hidden_layer_size1 * (input_image_size + 1))) + (hidden_layer_size2* (hidden_layer_size1+1)))), hidden_layer_size2, (hidden_layer_size1 + 1));

Theta3 = reshape(nn_params((( (hidden_layer_size1 * (input_image_size + 1))) + (hidden_layer_size2* (hidden_layer_size1+1)) +1):end), num_labels, (hidden_layer_size2 + 1));


pred = PredictLabels(Theta1, Theta2, Theta3, Xtrain);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytrain)) * 100);

predCross = PredictLabels(Theta1, Theta2, Theta3, Xcross);
fprintf('\nCrossVal Set Accuracy: %f\n', mean(double(predCross == ycross)) * 100);

predTest = PredictLabels(Theta1, Theta2, Theta3, Xtest);
fprintf('\nTesting Set Accuracy: %f\n', mean(double(predTest == ytest)) * 100);