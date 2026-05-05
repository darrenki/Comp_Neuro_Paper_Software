# Comp_Neuro_Paper_Software
A repository of scripts used to generate the data from the Comp_Neuro_Paper

Must install MATLAB and EEGLAB first to run the scripts.

Then, add EEGLAB's CleanLine plugin:
https://eeglab.org/plugins/cleanline/

importing.m takes in a .mat file made from TMSi EMG time series data and extracts its triggers. 
The output is a size (N+1)xM .mat file where N=number of channels, M=time, and the +1 is the trigger channel.

ICA_preprocessing.mlx takes the output of importing.m and pre-processes the data before ICA. 
After the script is run, removing epochs and channels, unloading channel locations, and ICA must be done on EEGLAB manually.
Since the finals steps are done manually, the generated data should also be saved manually.
NOTE: Some parameters should be noted and changed according to the experiment, most notably 'srate' the sampling rate, default 4000, and the trigger channel number, default 69.

patch_map_generator.mlx is the script that allows mapping of EMG data onto the confines of EEGLAB. 
It generates a .xyz format channel location map that can be uploaded through EEGLAB through Edit-> Channel Locations.
Note that the oreintation is not correct (not a problem for visualization) until direction "Nose along -X" is selected. \
Assuming the set up is the same as the paper viewing the topography through Plot->Channel locations-> by number should give the same map as shown in Figure 4 in the paper. 

After decomposing data by ICA by Tools-> Decompose data by ICA
Visualizations from the paper can be done by:
Tools-> Inspect/Label components by map
Plot-> Component Activations (scroll)
Plot-> Component Spectra and maps

[![DOI](https://zenodo.org/badge/1229991794.svg)](https://doi.org/10.5281/zenodo.20041487)
