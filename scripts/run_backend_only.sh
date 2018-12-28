#!/bin/bash

# This script shows how to run back-end only mode.

# You should provide feature message for each frame and a calibration file.
# Our program 'ice_ba' support generating feature message and calibration file.
# After running 'ice-ba' with flag 'save_feature', you will get feature message in your sequence folder:
# 1. calibration.dat
# 2. a folder called 'dat' which contains .dat files that correspond to frames one by one

# For example, your dataset dir is /home/dataset/EuRoC/MH_01_easy
# Then run:

# ./bin/ice_ba --imgs_folder /home/dataset/EuRoC/MH_01_easy --start_idx 0 --end_idx -1 --iba_param_path ./config/config_of_stereo.txt  --gba_camera_save_path /home/dataset/EuRoC/result/MH_01_easy.txt --stereo --save_feature

# Then, there will be a calibration file: /home/dataset/EuRoC/MH_01_easy/calibration.dat,
# and a folder contains lots of dat files correspond to your input images one by one: /home/dataset/EuRoC/MH_01_easy/dat/*.dat

# Now, you can run back-end only by the following command
# If your feature message generated by monocular mode, use config_of_mono.txt as your config file. Otherwise, config_of_stereo.txt.
# Set your sequence path to 'input_directory' in config file. For the above example, the path should be: /home/dataset/EuRoC/MH_01_easy/

# ==============================================================================
# Configuration format
# ==============================================================================
# In config/config_of_*.txt, you must set "input_directory" to be the
# directory of the dataset with a trailing "/". e.g.:
# input_directory = Euroc/MH_01_easy/
# You do not need to change any of the other parameters.

../bin/back_end ../config/config_of_stereo.txt
