'''
Python Program to READ RECEIVED.png file and predict its contents (digits from 0 to 9)
'''
import scipy.io as sio
import numpy as np
import cv2
import os
import Sigmoid
data=sio.loadmat('28x28_300.mat');
Theta1 = data.get("Theta1");
Theta2 = data.get("Theta2");
while True:
	if(os.path.exists("RECEIVED.png")== True):
		img =cv2.imread("RECEIVED.png",0);
		cv2.imshow("re",img)
		cv2.waitKey(0);
		#img = img.reshape((1,28*28))
		# add column of ones
		img = np.array([1]+img.reshape((1,28*28))[0].tolist())
		#print img.shape
		#print np.transpose(Theta1).shape
		d1 = Sigmoid.sigmoid(np.dot(img,np.transpose(Theta1)))
		#print d1.tolist()
		d1 = np.array([1]+d1.tolist())
		d2 = Sigmoid.sigmoid(np.dot(d1, np.transpose(Theta2)))
		#print d2.shape
		maxitem = d2.argmax(axis=0)
		if(maxitem == 9):
			output = 0
		else:
			output = maxitem+1
		
		#print output
		print d2
		print max(d2)
		break
