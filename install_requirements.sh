#!/bin/bash

#Update system
sudo apt-get update

#Install requirements
sudo apt-get install git
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install --only-upgrade build-essential cmake pkg-config
sudo apt-get install python-numpy python-scipy python-matplotlib
sudo apt-get install libopencv-dev
sudo apt-get install default-jdk ant
sudo apt-get install libgtkglext1-dev
sudo apt-get install qtcreator qt4-dev-tools
sudo apt-get install libvtk5-dev python-vtk

#Clone opencv
sudo git clone https://github.com/Itseez/opencv.git
sudo git clone https://github.com/Itseez/opencv_contrib.git
sudo git clone https://github.com/Itseez/opencv_extra.git

#Make
cd opencv
sudo mkdir build
cd build
sudo cmake -D CMAKE_BUILD_TYPE=RELEASE -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_OPENGL=ON -D WITH_V4L=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_TBB=ON ..
sudo make
sudo make install
sudo mv ../../opencv_contrib/ ../build/
sudo cmake -DOPENCV_EXTRA_MODULES_PATH=opencv_contrib/modules ..
sudo make
sudo make install

#Install python dependencies
sudo apt-get install python-setuptools python-dev
sudo python -m pip install geopy

