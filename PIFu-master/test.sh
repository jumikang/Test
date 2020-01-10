#!/usr/bin/env bash
set -ex

# Training
GPU_ID=0
DISPLAY_ID=$((GPU_ID*10+10))
NAME='fanimp_col'

NUM_SAMPLE_inout=10000
NUM_SAMPLE_color=10000
NUM_THREADS=4

# Network configuration
NETG='fanimp'
NETC='resimp'

BATCH_SIZE=1
ENC_DIM='3 8 16 32 64 128'
MLP_DIM='257 1024 512 256 128 1'
MLP_DIM_COLOR='513 1024 512 256 128 3'

Z_SIZE=200

# Reconstruction resolution
# NOTE: one can change here to reconstruct mesh in a different resolution.
VOL_RES=256

# Path configuration
DATAROOT='../DATA/hf_human5'

CHECKPOINTS_NETG_PATH='./checkpoints/net_G'
CHECKPOINTS_NETC_PATH='./checkpoints/net_C'

CHECKPOINTS_PATH='./checkpoints'
RESULTS_PATH='./eval_results'
TEST_FOLDER_PATH='./sample_images'

# command
CUDA_VISIBLE_DEVICES=${GPU_ID} python ./apps/eval.py \
    --dataroot ${DATAROOT} \
    --name ${NAME} \
    --batch_size ${BATCH_SIZE} \
    --enc_dim ${ENC_DIM} \
    --mlp_dim ${MLP_DIM} \
    --mlp_dim_color ${MLP_DIM_COLOR} \
    --checkpoints_path ${CHECKPOINTS_PATH} \
    --results_path ${RESULTS_PATH} \
    --num_threads ${NUM_THREADS} \
    --netG ${NETG} \
    --netC ${NETC} \
    --num_stack 4 \
    --num_hourglass 2 \
    --resolution ${VOL_RES} \
    --fan_down 'ave_pool' \
    --mode 'color' \
    --norm 'group' \
    --test_folder_path ${TEST_FOLDER_PATH} \
    --load_netG_checkpoint_path ${CHECKPOINTS_NETG_PATH} \
    --load_netC_checkpoint_path ${CHECKPOINTS_NETC_PATH} \
    --num_sample_color ${NUM_SAMPLE_color} \
    --num_sample_inout ${NUM_SAMPLE_inout} \

