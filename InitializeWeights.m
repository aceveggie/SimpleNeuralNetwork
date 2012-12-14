% return matrix of size (id2, 1+id1) inititalized to random values
function RW = InitializeWeights(id1, id2)
	epsilon_init = 0.12;
	RW = rand(id2, 1 + id1) * 2 * epsilon_init - epsilon_init;
end
