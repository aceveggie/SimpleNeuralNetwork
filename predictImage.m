%load('Android_28x28_100_50')
load('Android_28x28_200_100')
d = double(imread('RECEIVED.png'));
d = reshape(d, 1, 28 * 28);
output = PredictLabels(Theta1, Theta2, Theta3, d);
if(output == 10)
	output = 0;
end
disp('---------------------------');
fprintf('RECEIVED: %d\n',output);
disp('---------------------------');
