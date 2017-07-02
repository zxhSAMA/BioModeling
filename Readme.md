# 果蝇Gap Gene模型总结
> edited by Zhang XiangHui（1400012228）

[TOC]

### 写在前面
	发育生物学的研究发现，果蝇的早期胚胎发育是一个非常快速的动态过程。在受精后前两个小时，每隔6到10分钟就会进行一次核分裂，形成合胞体的结构。在在8到11轮核分裂时期，细胞核向四周迁移形成合胞体囊胚，继续分裂时质膜内陷包围细胞核形成单细胞层，即细胞囊胚。在这一早期发育的过程中会形成一系列动态的基因表达的斑图，它们将决定胚胎中的每个细胞的命运，为未来幼虫甚至成虫的身体结构构建蓝图[1]。
	这些基因表达受一个有等级结构的网络调控。比如在果蝇胚胎的头尾体轴方向，首先母体基因biocoid(bcd)的蛋白产物Bcd蛋白形成一个自头部到尾部浓度逐渐降低的浓度梯度；Bcd作为成形素，会 调控其下游gap 基因的表达，比如在胚胎的前半部激活Hunchback基因的表达；gap gene的蛋白和母体成形素会一起调控pair-rule 基因的表达, 形成沿体轴分布的7个浓度条带;由pair-rule gene基因的蛋白产物分布激活segment polarity gene的转录，进一步形成14个体节。而由gap gene，pair-rule gene和segment polarity gene共同调解homeotic gene的表达决定了后续每个体节发育的命运[2]。
	有关果蝇调控基因网络的模型目前主要有两派工作，一个是Reintz组的模型，它的参数有50多个，使用了模拟退火的方法来进行参数搜索[3]；另一个是Papatsenko的模型，模型参数简化到7个[4],我们小组基于Papatsenko的模型进行修改得到了一些定量的结果。

### 代码结构
`papamodel_func.m` 中包括3个函数：
> * function [Hb,Kni,Kr,Gt]=papamodel_func(n)　
> 通过传入迭代次数n（时间），来生成Hb,Kni,Kr,Gt四个基因在前后轴上的分布数据。并且定义了一些全局变量，N C Ka_Hb_R Ka_Kr Ka_Others abs_conc Syn_rate diff_rate。还有三个基因的初始值mHb mBcd mTll。
> * function [Hb,Kni,Kr,Gt]=papa_equation(recurtionTime)
> 获取papamodel_func定义的全局变量，并且调用Papa_Sec_Order_Partial_diff进行二阶偏微分的迭代计算。
> * function [ Matout ] = Papa_Sec_Order_Partial_diff( Matin )
> 定义了二阶偏微分的差分表示。

`papamodel_script.m` 主要完成对`papamodel_func.m`的调用，并进行了以下的分析：
> * figure('name','model gap gene');完成了对`papamodel_func.m`进行20次迭代以绘制movie。
> * figure('name','Hb movie');完成了对Hb Gene表达边界的绘制。
> * figure('name','threshold of Hb');用来研究Hb Gene表达边界位置随发育时间的变化。
> * figure('name','sharpness of Hb');用来研究Hb Gene表达边界的斜率随发育时间的变化。

### Reference
[1] Johannes Jaeger, Manu and John Reinitz: Drosophila blastoderm patterning. Current Opinion in Genetics & Development 2012, 22:533–541.
<br/>
[2] Johannes Jaeger: The gap gene network. Cellular and Molecular Life Sciences 2011, 68:243–274.
<br/>[3] Johannes Jaeger, Svetlana Surkova, et al: Dynamic control of positional information in the early Drosophila embryo. letters to nature 2004, 430:368-371.
<br/>[4] Dmitri Papatsenko, Michael Levine: The Drosophila Gap Gene Network Is Composed of Two Parallel Toggle Switches. PLoS ONE 2011, 6:Issue 7.