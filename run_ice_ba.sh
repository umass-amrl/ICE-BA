#!/bin/bash

#Set your own EuRoC_PATH path to run ice-ba. Use "./bin/ice_ba --help" to get the explanation for all of the flags. Flags [imgs_folder] and [iba_param_path] are necessary.

EuRoC_PATH=Euroc

mkdir $EuRoC_PATH/result

cmd="./bin/ice_ba --visualize=false --imgs_folder $EuRoC_PATH/MH_01_easy --start_idx 0 --end_idx -1 --iba_param_path config/param.txt  --gba_camera_save_path $EuRoC_PATH/result/MH_01_easy.txt"
echo $cmd
eval $cmd
