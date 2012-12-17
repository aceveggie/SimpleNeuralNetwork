This project contains a 2 Hidden Layer Neural Network of Configuration 768 x 100 x 50 x 10 and 768 x 200 x 100 x 10 (inputlayersize x hiddenlayersize1 x hiddenlayersize2 x outputlabels)

DigitData.mat and DigitLabels.mat Files contain Handwritten Digit data collected on a Android Device.
Images contained in these mat files are originally of 28x28 reshaped to of 1 x (28*28).

To execute the Program, you may being with opening octave shell and running

1) AndroidTraining.m to train the Neural Network on available data.
2) AndroidTesting.m to test the trained Neural Network.

To execute the Program on a subset of MNIST dataset, you can open an Octave Shell and run the following:
1) MNISTTraining.m to train the Neural Network on a subset of MNIST dataset.
2) MNISTTesting.m to test the trained Neural Network.

The project can also be run in a Network mode where ImageReceiver.java class runs a Server on port 4444 and receives a image of size 28 x 28 from the Android App.

Install RSCDigitalRecongnition.apk and run the Server in ImageReceiver.java on 192.168.1.100 to connect Android App to Server.

One can then run "predictImage.m" script at server to perform digit recognition on received image ("RECEIVED.png").

A working of this Program is shown in this video:

http://www.youtube.com/watch?v=rLfrC3lyHt8


Features to add:
1) Proper Socket programming features to connect Server and Client properly.
