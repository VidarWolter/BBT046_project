#!/bin/bash

###################### Student input fields #####################

# Time requirement
TIME="03:20:00"			# Set the time you 

# Student id

OFFSET=2000
ID=33				# Students should use their id
STUDENT_ID=$(($OFFSET + $ID))


# Project id
PROJ_ID="BBT046"

# IP login node
IP="0.0.0.0"			# Do not change!

ml purge  # Ensure we don't have any conflicting modules loaded

# Replace with path to your container of choice
container=/cephyr/NOBACKUP/courses/BBT046/Resources/Containers/conda-sequencing.sif

# You can launch jupyter notebook or lab: 
srun -A ${PROJ_ID} -p vera -n 1 -t ${TIME} --pty apptainer exec $container jupyter lab --ip=${IP} --port ${STUDENT_ID}


###
# The container we are using was built from a conda environment
# first, the environment was exported to a YAML file:
# conda export --name myenv > bbt045-python.yml
# then the container was built with Apptainer:
# apptainer build --build-arg ENV_FILE=bbt045-python.yml bbt045-python.sif conda_environment_args_ubuntu.def
###
