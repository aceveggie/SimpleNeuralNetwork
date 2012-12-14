% calculate sigmoid gradient
function G = SigmoidGradient(Z)
	G = (Sigmoid(Z) .* (1-Sigmoid(Z)));
end