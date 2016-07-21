Created on: July 20, 2016
Author: xinyang, hungleminh

This code implements a method for Renal Compartment segmentation in DCE-MRI Images. 

Copyright (C) 2016 Media and Communication Lab, Huazhong University of Science and Technology, Wuhan. 

Licence : The source code is released under the GNU General Public License (GPLv3). Any redistribution or modification should be under the terms of GNU General Public License. 

Paper and Citing: Reference implementation of 

[1] Yang, X., Le Minh, H., Cheng, T., Sung, K. H., & Liu, W. (2015, October). Automatic Segmentation of Renal Compartments in DCE-MRI Images. In International Conference on Medical Image Computing and Computer-Assisted Intervention (pp. 3-11). Springer International Publishing.

If you use this code in an academic context, please cite the following publications:

@inproceedings{yang2015automatic,
  title={Automatic Segmentation of Renal Compartments in DCE-MRI Images},
  author={Yang, Xin and Le Minh, Hung and Cheng, Tim and Sung, Kyung Hyun and Liu, Wenyu},
  booktitle={International Conference on Medical Image Computing and Computer-Assisted Intervention},
  pages={3--11},
  year={2015},
  organization={Springer}
}

Instructions: 

Installation Intstructions: 

- Install Matlab 2013 or later version.  
- Computer Vision System Toolbox is required for running this code. 
- User can check the installed toolbox by typing 'ver' in the Matlab Command Window. 

Run Instructions

1. Type 'start' in the Matlab Command Window to begin the program, click the 'Start' button. 

2. Click 'Load data' button to load the images. In the 'Select Directory to Open' window, select the folder that contains the dicom images, then click 'Select Folder' to start loading images. 

3. Click the backward and the upward arrow in the 'Temporal Point' and 'Slice' slide bars to see the image in different temporal points and slices. Locate a time point where the cortex is enhanced. 

4. Click 'Crop' button to place an ROI around the entire kidney, double click on the ROI to segment the whole kidney. 

5. Click the backward and the upward arrow in the 'Slice' slide bar to see the whole kidney segmentation in different slices. Click 'Classification and Recognition' button to classify and recognise the kidney compartments. 

6. Three compartment labels are displayed with their temporal intensity curve. A recognition result is also displayed, user can check whether the recognition is correct or not, then click 'Next'. Step 7 is for the correct recognition, step 8 for the uncorrect recognition.  

7. The Cortex, Medulla, and Pelvis are displayed from left to right. Move the Slide bar to select the 'Factor' to refine the segmentation results. The refinement procedure starts from Cortex, then to Medulla and Pelvis. Click 'Save' to save each segmentation result in gipl format. 

8. In case the recognition is not correct, user can re-label each segmented label by click on the 'Pop-up Menu' under each segmented Label. Move the Slide bar to select the 'Factor' to refine the segmentation result. The refinement procedure starts from Cortex, then to Medulla and Pelvis. Click 'Save' to save the segmentation result in gipl format. 

Demo: We provide a demo video (as the below link) that illustrates our implementation method.  

      https://www.youtube.com/watch?v=vLO6_J_aFKU

Contacts: For more information please contact us 

Xin Yang: xinyang2014@hust.edu.cn
Hung Le Minh: leminhhung@hcmutrans.edu.vn