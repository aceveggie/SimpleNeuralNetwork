function [Cost Grad] = CostFunction(Parameters, input_layer_size, hidden_layer_size1, hidden_layer_size2, num_labels, X, y, lambda)

	% get theta values
	Theta1 = reshape(Parameters(1:hidden_layer_size1 * (input_layer_size + 1)), hidden_layer_size1, (input_layer_size + 1));

	Theta2 = reshape(Parameters((1 + (hidden_layer_size1 * (input_layer_size + 1))):(( (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2* (hidden_layer_size1+1)))), hidden_layer_size2, (hidden_layer_size1 + 1));

	Theta3 = reshape(Parameters((( (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2* (hidden_layer_size1+1)) +1):end), num_labels, (hidden_layer_size2 + 1));
	m = size(X, 1);

	Cost = 0;

	Theta1_grad = zeros(size(Theta1));
	Theta2_grad = zeros(size(Theta2));
	Theta3_grad = zeros(size(Theta3));
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	nR1 = 1;
	nC1 = size(X)(1);
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	a1 = [ones(m, 1) X];
	z2 = Theta1 * a1';
	a2 = Sigmoid(z2);
	a2 = a2';
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	a2 = [ones(nC1,nR1) a2];
	z3 = Theta2 * a2';
	a3 = Sigmoid(z3);
	a3 = a3';
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	nR2 = 1;
	nC2 = size(a2)(1);
	a3 = [ones(nC2,nR2) a3];
	z4 = Theta3 * a3';
	a4 = Sigmoid(z4);
	a4 = a4';
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	for i = 1:size(y)(1)
		g = find(y == y(i));
		Y(g,y(i)) = 1;
	end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%filling up y vector. 
	% 1 is represented as 1x10 vector as in 100000...
	% 2 is represented as 1x10 vector as in 010000...

	AA = ((-Y .* log(a4)) - ((1-Y) .* log(1 - a4)))';
	BB = sum(AA);

	Cost = sum(BB);
	Cost = Cost/m;

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% regularizing to reduce overfitting

	RP = (lambda/(2*m));

	L1  = Theta1(:,2:end)';
	L2 = Theta2(:,2:end)';
	L3 = Theta3(:,2:end)';

	regularized_parameter = RP * ( sum((sum(L1 .* L1))) + sum((sum(L2 .* L2))) + + sum((sum(L3 .* L3))) );

	Cost = Cost + regularized_parameter;

	% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% % SigmoidGradient back prop

	for t = 1:m

		%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		a1 = X(t, :)';
		a1 = [1; a1];
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		z2 = (Theta1 * a1);
		a2 = Sigmoid(z2);
		a2 = [1; a2];
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		z3 = (Theta2 * a2);
		a3 = Sigmoid(z3);
		a3 = [1; a3];
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		z4 = (Theta3 * a3);
		a4 = Sigmoid(z4);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		HThetaX = a4;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		Y_t = Y(t,:)';
		delta_4 = (HThetaX - Y_t);
		% difference in output = delta_4

		delta_3 = ((Theta3(:, 2:end)' * delta_4) .* (SigmoidGradient(z3)));

		delta_2 = ((Theta2(:, 2:end)' * delta_3) .* (SigmoidGradient(z2)));
		
		Theta3_grad = ((Theta3_grad) + (delta_4 * a3'));
		Theta2_grad = ((Theta2_grad) + (delta_3 * a2'));	
		Theta1_grad = ((Theta1_grad) + (delta_2 * a1'));
	end
	Theta1_grad = (Theta1_grad/(m));
	Theta2_grad = (Theta2_grad/(m));
	Theta3_grad = (Theta3_grad/(m));
	
	Theta1_grad(:,2:end) = (Theta1_grad(:,2:end) + ((lambda/(m)) * Theta1(:,2:end)));
	Theta2_grad(:,2:end) = (Theta2_grad(:,2:end) + ((lambda/(m)) * Theta2(:,2:end)));
	Theta3_grad(:,2:end) = (Theta3_grad(:,2:end) + ((lambda/(m)) * Theta3(:,2:end)));

	
	Grad = [Theta1_grad(:) ; Theta2_grad(:); Theta3_grad(:)];

end