function [Xtrain, ytrain, Xtest, ytest, Xcross, ycross] = ReadAndroidMat()
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% This code reads the DigitData.mat and DigitLabels.mat files and puts them in appropriate labels
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	load('DigitData.mat')
	load('DigitLabels.mat')
		
	train0 = double(Train0(1:600,:));
	train1 = double(Train1(1:600,:));
	train2 = double(Train2(1:600,:));
	train3 = double(Train3(1:600,:));
	train4 = double(Train4(1:600,:));
	train5 = double(Train5(1:600,:));
	train6 = double(Train6(1:600,:));
	train7 = double(Train7(1:600,:));
	train8 = double(Train8(1:600,:));
	train9 = double(Train9(1:600,:));

	crossval0 = double(Train0(601:800,:));
	crossval1 = double(Train1(601:800,:));
	crossval2 = double(Train2(601:800,:));
	crossval3 = double(Train3(601:800,:));
	crossval4 = double(Train4(601:800,:));
	crossval5 = double(Train5(601:800,:));
	crossval6 = double(Train6(601:800,:));
	crossval7 = double(Train7(601:800,:));
	crossval8 = double(Train8(601:800,:));
	crossval9 = double(Train9(601:800,:));

	test0 = double(Train0(801:end,:));
	test1 = double(Train1(801:end,:));
	test2 = double(Train2(801:end,:));
	test3 = double(Train3(801:end,:));
	test4 = double(Train4(801:end,:));
	test5 = double(Train5(801:end,:));
	test6 = double(Train6(801:end,:));
	test7 = double(Train7(801:end,:));
	test8 = double(Train8(801:end,:));
	test9 = double(Train9(801:end,:));
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Read Labels
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	trainlab0 = (Label0(1:600,:));
	trainlab1 = (Label1(1:600,:));
	trainlab2 = (Label2(1:600,:));
	trainlab3 = (Label3(1:600,:));
	trainlab4 = (Label4(1:600,:));
	trainlab5 = (Label5(1:600,:));
	trainlab6 = (Label6(1:600,:));
	trainlab7 = (Label7(1:600,:));
	trainlab8 = (Label8(1:600,:));
	trainlab9 = (Label9(1:600,:));

	crosslab0 = Label0(601:800,:);
	crosslab1 = Label1(601:800,:);
	crosslab2 = Label2(601:800,:);
	crosslab3 = Label3(601:800,:);
	crosslab4 = Label4(601:800,:);
	crosslab5 = Label5(601:800,:);
	crosslab6 = Label6(601:800,:);
	crosslab7 = Label7(601:800,:);
	crosslab8 = Label8(601:800,:);
	crosslab9 = Label9(601:800,:);

	testlab0 = Label0(801:end,:);
	testlab1 = Label1(801:end,:);
	testlab2 = Label2(801:end,:);
	testlab3 = Label3(801:end,:);
	testlab4 = Label4(801:end,:);
	testlab5 = Label5(801:end,:);
	testlab6 = Label6(801:end,:);
	testlab7 = Label7(801:end,:);
	testlab8 = Label8(801:end,:);
	testlab9 = Label9(801:end,:);
	

	Xtrain = [train0;train1;train2;train3;train4;train5;train6;train7;train8;train9];
	ytrain = [trainlab0;trainlab1;trainlab2;trainlab3;trainlab4;trainlab5;trainlab6;trainlab7;trainlab8;trainlab9];
	Xtest = [test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];
	ytest = [testlab0;testlab1;testlab2;testlab3;testlab4;testlab5;testlab6;testlab7;testlab8;testlab9];
	Xcross = [crossval0;crossval1;crossval2;crossval3;crossval4;crossval5;crossval6;crossval7;crossval8;crossval9];
	ycross = [crosslab0;crosslab1;crosslab2;crosslab3;crosslab4;crosslab5;crosslab6;crosslab7;crosslab8;crosslab9];

end
