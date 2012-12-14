%[Xtrain, ytrain, Xtest, ytest, Xcross, ycross] = ReadMNIST();
[Xtrain, ytrain, Xtest, ytest, Xcross, ycross] = Read();
load('MNIST_28x28_100_50')

disp('Neural Network size: 28x28: 100 : 50 : 10')

pred = PredictLabels(Theta1, Theta2, Theta3, Xtrain);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytrain)) * 100);

%% CrossVal
predCross = PredictLabels(Theta1, Theta2, Theta3, Xcross);
fprintf('\nCrossVal Set Accuracy: %f\n', mean(double(predCross == ycross)) * 100);

%% TEST
predTest = PredictLabels(Theta1, Theta2, Theta3, Xtest);
fprintf('\nTesting Set Accuracy: %f\n', mean(double(predTest == ytest)) * 100);

load('MNIST_28x28_200_100')
disp('Neural Network size: 28x28: 200 : 100 : 10')

pred = PredictLabels(Theta1, Theta2, Theta3, Xtrain);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytrain)) * 100);

%% CrossVal
predCross = PredictLabels(Theta1, Theta2, Theta3, Xcross);
fprintf('\nCrossVal Set Accuracy: %f\n', mean(double(predCross == ycross)) * 100);

%% TEST
predTest = PredictLabels(Theta1, Theta2, Theta3, Xtest);
fprintf('\nTesting Set Accuracy: %f\n', mean(double(predTest == ytest)) * 100);