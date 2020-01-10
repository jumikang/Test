# PIFu: Pixel-Aligned Implicit Function for High-Resolution Clothed Human Digitization

This repository contains a pytorch implementation of "[PIFu: Pixel-Aligned Implicit Function for High-Resolution Clothed Human Digitization](https://arxiv.org/abs/1905.05172)".

[Project Page](https://shunsukesaito.github.io/PIFu/)
![Teaser Image](https://shunsukesaito.github.io/PIFu/resources/images/teaser.png)

If you find the code useful in your research, please consider citing the paper.

```
@article{saito2019pifu,
  title={PIFu: Pixel-Aligned Implicit Function for High-Resolution Clothed Human Digitization},
  author={Saito, Shunsuke and Huang, Zeng and Natsume, Ryota and Morishima, Shigeo and Kanazawa, Angjoo and Li, Hao},
  journal={arXiv preprint arXiv:1905.05172},
  year={2019}
}
```

This codebase provides: 
- test code
- (coming soon) training code

## Requirements
- Python 3
- [PyTorch](https://pytorch.org/) tested on 1.1.0
- json
- PIL
- skimage
- tqdm

for training (coming soon)
- [trimesh](https://trimsh.org/) with pyembree
- cv2
- visdom

## Demo
1. run the following script to download the pretrained models from the following link and copy them under `./PIFu/checkpoints/`.
```
sh ./scripts/download_trained_model.sh
```

2. run the following script. the script creates a textured `.obj` file under `./PIFu/eval_results/`. 
```
sh ./scripts/test.sh
```