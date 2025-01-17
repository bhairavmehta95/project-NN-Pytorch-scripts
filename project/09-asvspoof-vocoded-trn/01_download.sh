#!/bin/bash
########################
# Script to download files
# 
# Usage: bash download.sh
# 
# This will download a toy data set
# and the SSL model from Fairseq
########################
RED='\033[0;32m'
NC='\033[0m'

##### 
# Download toy data set
link_set=https://zenodo.org/record/7315515/files/project-09-toy_example_vocoded.tar.gz
set_name=project-09-toy_example_vocoded.tar.gz

echo -e "\n${RED}=======================================================${NC}"

cd DATA

if [ ! -e ${set_name} ];
then
    echo -e "${RED}Download and untar the toy data set${NC}"
    wget -q --show-progress ${link_set}
fi

if [ -e ${set_name} ];
then
    if [ ! -d toy_example ];
    then
	tar -xzf ${set_name}
    fi
else
    echo -e "\nCannot download ${set_name}"
fi

cd ..


#################
# Download pre-trained SSL models from fairseq
# See https://github.com/pytorch/fairseq/blob/main/examples/wav2vec/README.md
# https://github.com/pytorch/fairseq/tree/main/examples/hubert
# Please check their webpage for the latest link
TAR=SSL_pretrained

# XLSR-53 Large
# W2V-XLSR 
if [ ! -e ./${TAR}/xlsr_53_56k.pt ]; 
then
    echo -e "${RED}Download SSL model${NC}"
    wget -q --show-progress -O ./${TAR}/xlsr_53_56k.pt https://dl.fbaipublicfiles.com/fairseq/wav2vec/xlsr_53_56k.pt 
fi


