# GSA_segmented
This is the source code of the paper "Comparison of global sensitivity analysis methods for a fire spread model with a segmented characteristic". In this work, Sobol index, mutual information, delta index and PAWN index are compared.

## Ref

Chen, Shi-Shun, and Xiao-Yang Li. "Comparison of global sensitivity analysis methods for a fire spread model with a segmented characteristic." Mathematics and Computers in Simulation 229 (2025): 304-318.


## Highlights

• The effect of segmented characteristics on GSA is explored by a fire spread model.

• Four GSA methods give different importance rankings during the transition region.

• The Sobol index yields a radical importance ranking.

• Analysts should choose GSA methods carefully according to their practical purpose.

Paper link: https://www.sciencedirect.com/science/article/pii/S0378475424004014

![image](https://github.com/dirge1/GSA_segmented/blob/main/GSA_result.png)
Fig. 1. GSA results under different μU: Sobol index; Mutual information; Delta index; PAWN index.

If you want to get the result of Fig.1 directly by our provided results, you can run `Fig1_picture_varyU_withbar.m` in `run_main`.

If you want to get the result of Fig.1 on your own computer, you can run `main_fire.m` in `run_main`. It should be noted that **python environment must be configured in Matlab**. 

You can configure the python environment in Matlab by following the video released by the author (in Chinese): https://www.bilibili.com/video/BV1xp421Z7Ua/?vd_source=a1dbb3ff5999b954fed0a1a5c93cd04b.

We use the python package ennemi, chaospy (not used but needed) and SALib. The details and references are provided in the paper.
