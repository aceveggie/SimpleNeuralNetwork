DigitData.mat and DigitLabels.mat Files contain Handwritten Digit data collected on a Android Device.

This project contains a 2 Hidden Layer Neural Network of Configuration 768 x 100 x 50 x 10 and 768 x 200 x 100 x 10 (inputlayersize x hiddenlayersize1 x hiddenlayersize2 x outputlabels)

To execute the Program, you may being with opening octave shell and running

1) AndroidTraining.m to train the Neural Network on available data.
2) AndroidTesting.m to test the trained Neural Network.

To execute the Program on a subset of MNIST dataset, you can open an Octave Shell and run the following:
1) MNISTTraining.m to train the Neural Network on a subset of MNIST dataset.
2) MNISTTesting.m to test the trained Neural Network.

The project can also be run in a Network mode where ImageReceiver.java class runs a Server on port 4444 and receives a image of size 28 x 28 from the Android App.

One can then run "predictImage.m" script to perform digit recognition on received image ("RECEIVED.png".