function [Xtrain, ytrain, Xtest, ytest, Xcross, ycross] = Read()

	trainimages = loadMNISTImages('train-images-idx3-ubyte');
	trainlabels = loadMNISTLabels('train-labels-idx1-ubyte');

	testimages = loadMNISTImages('t10k-images-idx3-ubyte');
	testlabels = loadMNISTLabels('t10k-labels-idx1-ubyte');

	trainimages = trainimages';
	testimages = testimages';

	train0 = trainimages(find(trainlabels==0),:);
	train1 = trainimages(find(trainlabels==1),:);
	train2 = trainimages(find(trainlabels==2),:);
	train3 = trainimages(find(trainlabels==3),:);
	train4 = trainimages(find(trainlabels==4),:);
	train5 = trainimages(find(trainlabels==5),:);
	train6 = trainimages(find(trainlabels==6),:);
	train7 = trainimages(find(trainlabels==7),:);
	train8 = trainimages(find(trainlabels==8),:);
	train9 = trainimages(find(trainlabels==9),:);
test0 = train0(2401:4800,:);
	test1 = train1(2401:4800,:);
	test2 = train2(2401:4800,:);
	test3 = train3(2401:4800,:);
	test4 = train4(2401:4800,:);
	test5 = train5(2401:4800,:);
	test6 = train6(2401:4800,:);
	test7 = train7(2401:4800,:);
	test8 = train8(2401:4800,:);
	test9 = train9(2401:4800,:);

	%test0 = testimages(find(testlabels==0),:);
	%test1 = testimages(find(testlabels==1),:);
	%test2 = testimages(find(testlabels==2),:);
	%test3 = testimages(find(testlabels==3),:);
	%test4 = testimages(find(testlabels==4),:);
	%test5 = testimages(find(testlabels==5),:);
	%test6 = testimages(find(testlabels==6),:);
	%test7 = testimages(find(testlabels==7),:);
	%test8 = testimages(find(testlabels==8),:);
	%test9 = testimages(find(testlabels==9),:);

	train0 = train0(1:2400,:);
	train1 = train1(1:2400,:);
	train2 = train2(1:2400,:);
	train3 = train3(1:2400,:);
	train4 = train4(1:2400,:);
	train5 = train5(1:2400,:);
	train6 = train6(1:2400,:);
	train7 = train7(1:2400,:);
	train8 = train8(1:2400,:);
	train9 = train9(1:2400,:);

	crossval0 = test0(401:800,:);
	crossval1 = test1(401:800,:);
	crossval2 = test2(401:800,:);
	crossval3 = test3(401:800,:);
	crossval4 = test4(401:800,:);
	crossval5 = test5(401:800,:);
	crossval6 = test6(401:800,:);
	crossval7 = test7(401:800,:);
	crossval8 = test8(401:800,:);
	crossval9 = test9(401:800,:);
	
size(train0)	
	


	trainlab0 = ones(2400,1) * 10;
	trainlab1 = ones(2400,1) * 1;
	trainlab2 = ones(2400,1) * 2;
	trainlab3 = ones(2400,1) * 3;
	trainlab4 = ones(2400,1) * 4;
	trainlab5 = ones(2400,1) * 5;
	trainlab6 = ones(2400,1) * 6;
	trainlab7 = ones(2400,1) * 7;
	trainlab8 = ones(2400,1) * 8;
	trainlab9 = ones(2400,1) * 9;
K =2400;
	testlab0 = ones(K,1) * 10;
	testlab1 = ones(K,1) * 1;
	testlab2 = ones(K,1) * 2;
	testlab3 = ones(K,1) * 3;
	testlab4 = ones(K,1) * 4;
	testlab5 = ones(K,1) * 5;
	testlab6 = ones(K,1) * 6;
	testlab7 = ones(K,1) * 7;
	testlab8 = ones(K,1) * 8;
	testlab9 = ones(K,1) * 9;

	crosslab0 = ones(400,1) * 10;
	crosslab1 = ones(400,1) * 1;
	crosslab2 = ones(400,1) * 2;
	crosslab3 = ones(400,1) * 3;
	crosslab4 = ones(400,1) * 4;
	crosslab5 = ones(400,1) * 5;
	crosslab6 = ones(400,1) * 6;
	crosslab7 = ones(400,1) * 7;
	crosslab8 = ones(400,1) * 8;
	crosslab9 = ones(400,1) * 9;


	Xtrain = [train0;train1;train2;train3;train4;train5;train6;train7;train8;train9];
	ytrain = [trainlab0;trainlab1;trainlab2;trainlab3;trainlab4;trainlab5;trainlab6;trainlab7;trainlab8;trainlab9];
	Xtest = [test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];
	ytest = [testlab0;testlab1;testlab2;testlab3;testlab4;testlab5;testlab6;testlab7;testlab8;testlab9];
	Xcross = [crossval0;crossval1;crossval2;crossval3;crossval4;crossval5;crossval6;crossval7;crossval8;crossval9];
	ycross = [crosslab0;crosslab1;crosslab2;crosslab3;crosslab4;crosslab5;crosslab6;crosslab7;crosslab8;crosslab9];
	% size(Xtrain)
	% size(ytrain)
	% size(Xtest)
	% size(ytest)
	% size(Xcross)
	% size(ycross)
% 
%     figure(),imshow(reshape(test1(20,:),28,28))
% 	figure(),imshow(reshape(test2(20,:),28,28))
%     figure(),imshow(reshape(test3(20,:),28,28))
%     figure(),imshow(reshape(test4(20,:),28,28))
%     figure(),imshow(reshape(test5(20,:),28,28))
%     figure(),imshow(reshape(test6(20,:),28,28))
%     figure(),imshow(reshape(test7(20,:),28,28))
%     figure(),imshow(reshape(test8(20,:),28,28))
%     figure(),imshow(reshape(test9(20,:),28,28))
%     figure(),imshow(reshape(test0(20,:),28,28))
%     
%     
    
    
    
    

end
