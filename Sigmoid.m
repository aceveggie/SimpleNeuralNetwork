%calculate sigmoid
function G = Sigmoid(Z)
	G = 1.0 ./ (1.0 + exp(-Z));
end
