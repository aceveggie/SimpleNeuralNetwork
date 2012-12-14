function [prob] = PredictLabels(Theta1, Theta2, Theta3, X)
	h1 = Sigmoid([ones(size(X, 1), 1) X] * Theta1');
	h2 = Sigmoid([ones(size(X, 1), 1) h1] * Theta2');
	h3 = Sigmoid([ones(size(X, 1), 1) h2] * Theta3');
	[dval, prob] = max(h3, [], 2);
end