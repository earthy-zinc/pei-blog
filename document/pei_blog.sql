/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : rm-bp1035514z9uq43q46o.mysql.rds.aliyuncs.com:3306
 Source Schema         : pei_blog

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 08/12/2023 16:41:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pei_article
-- ----------------------------
DROP TABLE IF EXISTS `pei_article`;
CREATE TABLE `pei_article`
(
    `id`          bigint                                                         NOT NULL AUTO_INCREMENT,
    `title`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '标题',
    `content`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL COMMENT '文章内容',
    `summary`     varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章摘要',
    `category_id` bigint                                                         NULL DEFAULT NULL COMMENT '所属分类id',
    `thumbnail`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '缩略图',
    `is_top`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '0' COMMENT '是否置顶（0否，1是）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
    `view_count`  bigint                                                         NULL DEFAULT 0 COMMENT '访问量',
    `is_comment`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '1' COMMENT '是否允许评论 1是，0否',
    `create_by`   bigint                                                         NULL DEFAULT NULL,
    `create_time` datetime                                                       NULL DEFAULT NULL,
    `update_by`   bigint                                                         NULL DEFAULT NULL,
    `update_time` datetime                                                       NULL DEFAULT NULL,
    `del_flag`    int                                                            NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_article
-- ----------------------------
INSERT INTO `pei_article`
VALUES (1, 'SpringSecurity从入门到精通',
        '## 课程介绍\n![image20211219121555979.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/e7131718e9e64faeaf3fe16404186eb4.png)\n\n## 0. 简介1\n\n​	**Spring Security** 是 Spring 家族中的一个安全管理框架。相比与另外一个安全框架**Shiro**，它提供了更丰富的功能，社区资源也比Shiro丰富。\n\n​	一般来说中大型的项目都是使用**SpringSecurity** 来做安全框架。小项目有Shiro的比较多，因为相比与SpringSecurity，Shiro的上手更加的简单。\n\n​	 一般Web应用的需要进行**认证**和**授权**。\n\n​		**认证：验证当前访问系统的是不是本系统的用户，并且要确认具体是哪个用户**\n\n​		**授权：经过认证后判断当前用户是否有权限进行某个操作**\n\n​	而认证和授权也是SpringSecurity作为安全框架的核心功能。\n\n\n\n## 1. 快速入门\n\n### 1.1 准备工作\n\n​	我们先要搭建一个简单的SpringBoot工程\n\n① 设置父工程 添加依赖\n\n~~~~\n    <parent>\n        <groupId>org.springframework.boot</groupId>\n        <artifactId>spring-boot-starter-parent</artifactId>\n        <version>2.5.0</version>\n    </parent>\n    <dependencies>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.projectlombok</groupId>\n            <artifactId>lombok</artifactId>\n            <optional>true</optional>\n        </dependency>\n    </dependencies>\n~~~~\n\n② 创建启动类\n\n~~~~\n@SpringBootApplication\npublic class SecurityApplication {\n\n    public static void main(String[] args) {\n        SpringApplication.run(SecurityApplication.class,args);\n    }\n}\n\n~~~~\n\n③ 创建Controller\n\n~~~~java\n\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n@RestController\npublic class HelloController {\n\n    @RequestMapping(\"/hello\")\n    public String hello(){\n        return \"hello\";\n    }\n}\n\n~~~~\n\n\n\n### 1.2 引入SpringSecurity\n\n​	在SpringBoot项目中使用SpringSecurity我们只需要引入依赖即可实现入门案例。\n\n~~~~xml\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-security</artifactId>\n        </dependency>\n~~~~\n\n​	引入依赖后我们在尝试去访问之前的接口就会自动跳转到一个SpringSecurity的默认登陆页面，默认用户名是user,密码会输出在控制台。\n\n​	必须登陆之后才能对接口进行访问。\n\n\n\n## 2. 认证\n\n### 2.1 登陆校验流程\n![image20211215094003288.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/414a87eeed344828b5b00ffa80178958.png)',
        'SpringSecurity框架教程-Spring Security+JWT实现项目级前端分离认证授权', 1,
        'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/948597e164614902ab1662ba8452e106.png', '1', '0',
        105, '0', NULL, '2022-01-23 23:20:11', NULL, NULL, 1);
INSERT INTO `pei_article`
VALUES (2, 'weq', 'adadaeqe', 'adad', 2,
        'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/fd2e9460c58a4af3bbeae5d9ed581688.png', '1', '0', 22,
        '0', NULL, '2022-01-21 14:58:30', NULL, NULL, 1);
INSERT INTO `pei_article`
VALUES (3, 'dad', 'asdasda', 'sadad', 1,
        'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/737a0ed0b8ea430d8700a12e76aa1cd1.png', '1', '0', 33,
        '0', NULL, '2022-01-18 14:58:34', NULL, NULL, 1);
INSERT INTO `pei_article`
VALUES (5, 'sdad',
        '![Snipaste_20220115_165812.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/1d9d283f5d874b468078b183e4b98b71.png)\r\n\r\n## sda \r\n\r\n222\r\n### sdasd newnewnew',
        NULL, 2, '', '1', '0', 53, '0', NULL, '2022-01-17 14:58:37', NULL, NULL, 1);
INSERT INTO `pei_article`
VALUES (8, '小沛的日常生活',
        '就是很无聊啦### 这是一篇流水账，记录这我的碎碎念\r\n\r\n\r\n\r\n## 当然也还好啦，没什么大不了的\r\n\r\n\r\n\r\n我会继续努力的，加油\r\n\r\n\r\n\r\n还有什么话要说吗（暴怒）\r\n\r\n额，暂时就这样吧，写代码已经花费了我大部分精力了\r\n\r\n### 不过博客最重要的是内容啊\r\n\r\n\r\n\r\n## 欸，是挺重要的哦\r\n\r\n\r\n\r\n不过这些以后再说吧，慢慢补齐\r\n\r\n先把这些做好再说\r\n\r\n\r\n\r\n结束啦\r\n\r\n没有啦\r\n\r\n额\r\n\r\n\r\n\r\n还看\r\n\r\n\r\n\r\n略略略\r\n\r\n呜呜',
        '平凡且枯燥的一天', 3, 'https://wx4.sinaimg.cn/mw2000/006wxXdWly1gbupmn4zxdj30u00u0wje.jpg', '1', '0', 100, '0',
        14787164048663, '2022-09-09 14:58:37', 14787164048663, '2022-09-09 14:58:37', 0);
INSERT INTO `pei_article`
VALUES (9, '小沛的学习笔记',
        '# 深度学习\r\n\r\n## 神经网络简介\r\n\r\n受生物神经元的启发，人工神经元接收来自其他神经元或者外部源的输入，每个输入都有一个相关的权值，他是根据该输入对当前神经元的重要性来决定的，对该输入进行加权并于其他输入求和后，经过一个激活函数f，计算得到该神经元的输出。\r\n\r\n<img src=\"D:\\StudyDoc\\同步空间\\4.阅读笔记\\机器学习\\assets\\image-20220822075345742.png\" alt=\"image-20220822075345742\" style=\"zoom: 67%;\" />\r\n\r\n那么我们利用神经元构建神经网络，相邻层之间的神经元相互连接，并且给每一个连接分配一个强度，也就是权值。而神经网络中的信息只能向一个方向流动，即从输入节点向前移动，通过中间好几层隐藏节点，再向输出节点移动，网络中没有环路。输入层就是输入x的那一层，输出层为输出y的那一层，隐藏层是输入层和输出层之间的那些层级。\r\n\r\n总结来说神经网络的特点就是：\r\n\r\n* 同一层神经元之间没有连接\r\n* 第N层的每个神经元和第N+1层的所有神经元相连，第N-1层神经元的输出就是第N层神经元的输入\r\n* 每个连接都有对应的权值\r\n\r\n<img src=\"D:\\StudyDoc\\同步空间\\4.阅读笔记\\机器学习\\assets\\image-20220822080107215.png\" alt=\"image-20220822080107215\" style=\"zoom:50%;\" />\r\n\r\n人工神经网络每个输入xi需要一个权重wi，同时所有的输入还需要一个偏置值b，然后对其求和后的结果输入到神经元的激活函数中，那么我们就出现了三个问题。\r\n\r\n1. 在初始化的时候，我们如何设置每个输入的权重和所有输入的偏置值\r\n2. 神经元的激活函数应该用哪一种\r\n3. 整个神经元从输入到输出中间和实际情况之间的差距应该如何衡量，也就是如何构建损失函数\r\n\r\n## 激活函数\r\n\r\n在神经元中引入激活函数的目的就是向神经网络中引入非线性因素，通过激活函数，神经网络就可以拟合各种曲线，如果不用激活函数，每一层输出都是上层输入的线性函数，无论神经网络有多少层，输出都是输入的线性组合，引入非线性函数作为激活函数，那输出就不再是输入的线性组合，可以逼近任意函数。\r\n\r\n## 初始化参数\r\n\r\n对于某一个神经元来说需要初始化的参数有两种：一类是权重，还有一类是偏置，偏置我们通常初始化为0，而权重的初始化比较重要，会影响神经网络的效率。一般参数的初始化有四种方法。\r\n\r\n### 随机初始化\r\n\r\n随机初始化从均值为1，标准差为1的高斯分布中取样，使用一些很小的值对权重w进行初始化\r\n\r\n### 标准初始化\r\n\r\n权重w会从一个区间中均匀的随机取值，在（-1/根号d，1/根号d）均匀分布中生成当前神经元的权重，其中d是每个神经元的输入数量。\r\n\r\n### Xavier初始化\r\n\r\n各层的激活值和梯度的方差在传播过程中保持一致也叫做glorot初始化\r\n\r\n* 正态化的Xavier\r\n\r\n以0为中心，标准差为stddev = sqrt(2/(输入神经元个数 +输出神经元个数))的正态分布中抽取样本。\r\n\r\n### he初始化\r\n\r\n在正向传播时，激活值的方差保持不变，反向传播时，关于状态值的梯度的方差保持不变。与Xavier类似，也有两种方法，正态化的和均匀化的。\r\n\r\n## 搭建神经网络\r\n\r\n### 通过sequential搭建\r\n\r\n### 通过function类构建\r\n\r\n将层作为可调用对象并返回张量，并将输入向量和输出向量提供给tf.keras.Model inputs outputs 参数\r\n\r\n### 通过model的子类构建\r\n\r\n需要在init函数中定义神经网络的层，同时在call方法中定义网络前向传播的过程\r\n\r\n## 损失函数\r\n\r\n### 分类任务中损失函数\r\n\r\n分类任务中使用最多的衡量模型与实际之间差距的损失函数是交叉熵损失函数。\r\n\r\n#### 多分类任务\r\n\r\n这里通常使用softmax把原结果转换为概率的形式，所以也叫做softmax损失。这里的损失函数计算方法就是当前类别的标记值乘以log（softmax）函数的对数结果，对所有类别求和取负数就可。从概率的角度理解，我们的目的是最小化正确类别所对应的预测概率的对数的负值，也就是说正确类别所对应的预测概率值越大，那么损失就越小；其他错误类别所对应的预测概率值越小，损失相应的也就越小。损失函数计算出来的值越接近于0，说明模型预测产生的损失越小。\r\n\r\n#### 二分类任务\r\n\r\n在处理二分类任务的时候我们不使用softmax函数，而是用sigmoid函数，对应的损失函数也有所不同，意味着损失的计算方法略有不同，但是都是一样的，损失越小，损失函数计算出来的值就越小。\r\n\r\n### 回归任务中损失函数\r\n\r\n#### MAE损失\r\n\r\n也叫做L1 LOSS 损失。用绝对误差作为距离。计算方法就是真实值与预测值之间差的绝对值，对于多个样本点，我们就要取所有误差的平均值。这种损失函数在函数零点是不可导的。在探索损失最小的运算中容易越过这个极小值。导致找不到最好的预测模型。\r\n\r\n#### MSE损失\r\n\r\n也叫做L2 LOSS 损失，或者欧式距离。与L1 loss之间的区别是，一个用绝对值，一个使用平方。也就是真实值与预测值之间的差的平方。但是这种情况下，我们从图像中就可以看到，函数离零点越远，他的导数值就越大，因此目标值和预测值相差很大的时候，会造成梯度爆炸。\r\n\r\n#### smooth l1损失\r\n\r\n结合了L1 L2损失的优缺点，L1损失在零点不可导，而L2损失在远处梯度过大。而smooth损失很好的解决了这两个问题，也就是结合了这两个损失函数，类似于在|x|<1的时候，用L2，其他情况下用L1，分段函数。\r\n\r\n## 神经网络优化算法\r\n\r\n### 梯度下降算法\r\n\r\n梯度下降是一种寻找使损失函数最小化的方法，梯度的方向是函数增长速度最快的方向，梯度的反方向是函数减少最快的方向，沿着梯度下降，我们就能够找到损失函数的最小值。对于每一个输入权值，在深度学习中进行优化，有这样一个公式：新的权值=旧的权值-学习率 * 负梯度\r\n\r\n其中学习率是我们应该考虑的一个重要因素，如果学习率太小，那么每次训练之后得到的效果都太小，增大训练的成本，如果学习率太大则很容易跳过最优解。一个很好的方法就是，学习率也要随着训练进行变化，一开始大，之后变小。\r\n\r\n模型训练的概念：\r\n\r\n| 词语      | 含义                                                         |\r\n| --------- | ------------------------------------------------------------ |\r\n| Epoch     | 使用训练集的全部数据对模型进行一次完整的训练                 |\r\n| Batch     | 使用训练集的一小部分样本对模型的权重进行一次反向传播的参数更新 |\r\n| Iteration | 使用一个batch数据对模型的参数进行一次更新的过程              |\r\n\r\n### 反向传播算法\r\n\r\n前向传播：指的是数据输入到神经网络中，逐层向前传播，一直运算到输出层为止。\r\n\r\n反向传播：在网络训练过程中经过前向传播得到的最终结果和训练样本的真实值总是存在一定的误差，这个误差就是损失函数，要减小这个误差，从后往前依次求出各个参数的偏导，这就是反向传播。\r\n\r\n链式法则：反向传播算法是利用链式法则进行梯度求解以及权重的更新的。对于复杂的复合函数，我们将其拆分为一系列的加减乘除或者指数，对数、三角函数等初等函数，通过链式法则（高数内容）完成复合函数的求导。\r\n\r\n### 梯度下降优化方法\r\n\r\n 在寻找损失函数最小值的时候，我们会遇到一些问题，比如函数在一段平坦区域内，下降的很慢，这一部分运用梯度下降算法会耗费许多运算能力，函数在某个区域中到达了鞍点也就是导数为0，但是不是极值点的情况，或者函数到达了局部极小值，但是却不是全局最小值。这些都会让深度神经网络模型无法达到最好的效果，那么人们就提出了一些解决方法来解决这个问题。主要有：动量算法、AdaGrad、RMSprop、Adam\r\n\r\n#### 动量算法\r\n\r\n主要解决鞍点的问题，首先是指数加权平均数，假定给一个序列，比如一年中每天气温值，一年中温度的波动会比较大，我们使用加权平均值进行平滑\r\n\r\n#### AdaGrad\r\n\r\n#### RMSprop\r\n\r\n#### Adam\r\n\r\n\r\n\r\n### 学习率退火\r\n\r\n一般情况下，我们在训练神经网络的时候，会让学习率随着训练而变化，如果学习率过高，就找不到损失函数的最小点，如果学习率过低，就会造成收敛变慢的情况，会耗费大量的时间。我们调整学习率使用如下几种方法\r\n\r\n#### 分段常数衰减\r\n\r\n分段常数衰减是在事先定义好的训练次数区间上，设置不同的学习率常数，刚开始学习率大一些，之后越来越小，区间的设置需要根据样本量调整，一般样本量越大区间间隔越小。\r\n\r\n在tf.keras 中对应的方法是：\r\n\r\n```python\r\ntf.keras.optimizers.schedules.PiecewiseConstantDecay(boundaries, values)\r\n```\r\n\r\n* boundaries: 设置分段更新的step值\r\n* values针对不用分段的学习率值\r\n\r\n比如说，我们设置对于前十万步，学习率为1.0，对于接下来的十万步到十一万，学习率设置为0.5，再然后的步骤将学习率设置为0.1以达到学习率逐步降低的结果。\r\n\r\n#### 指数衰减\r\n\r\n指数衰减就是学习率按照指数的图像逐步衰减，刚开始学习率为1，之后逐步下降，以一种指数的形式。这种情况下，刚开始衰减的慢，之后会越来越快。\r\n\r\n在tf.keras 中对应的方法是：\r\n\r\n```python\r\ntf.keras.optimizers.schedules.ExponentialDecay(initial_learning_rate, decay_steps, decay_rate)\r\n```\r\n\r\n* initial_learning_rate: 初始的学习率\r\n* decay_steps: k值\r\n* decay_rate: 指数衰减公式中的底\r\n\r\n#### 1/t衰减\r\n\r\n也是用一种数学公式来表明随着步数的增加学习率减少的趋势，公式为a = a0/(1+kt)\r\n\r\n总结来说，学习率退火就是让深度学习网络每次的学习率逐步下降的过程，防止学习率过大跳过最优点。\r\n\r\n## 深度学习正则化\r\n\r\n在设计机器学习算法时，不仅要求在训练集上的误差小，而且希望在新样本上的泛化能力强（也就是通用性更强）许多机器学习算法都采用相关的策略来减小测试误差，这些策略都称为正则化，因为神经网络经常会遇到过拟合现象，因此需要使用不同的策略来增强模型的泛化能力，也就是说需要使用不同形式的正则化策略。\r\n\r\n正则化通过对算法的修改来减少泛化误差，目前使用较多的有参数范数惩罚，提前终止，DropOut等\r\n\r\n### L1和L2正则化\r\n\r\n正则化是减少泛化误差的方法，L1和L2正则化在损失函数上增加一个正则项，由于添加了这个正则化项，权重矩阵的值会减小，因为他们假定具有更小权重矩阵的神经网络会拥有更简单的网络模型。更简单的网络一定程度上会减少过拟合现象的发生。\r\n\r\n* L2正则化\r\n\r\n正则化后的损失函数 = 原损失函数 + a/2m * || w ||的平方\r\n\r\n这里a属于正则化参数，是一个需要优化的超参数，L2正则化又叫做权重衰减，因为他会导致权重趋向于0\r\n\r\n* L1正则化\r\n\r\nL1正则化与L2正则化不同的是，权重w不采用绝对值的平方，这种情况下权重可能会被减少到0\r\n\r\n在tf.keras中使用的方法是：\r\n\r\n```\r\ntf.keras.regularizers.L1(l1=0.01)\r\ntf.keras.regularizers.L2(l2=0.01)\r\ntf.keras.regularizers.L1L2(l1=0.0,l2=0.0)\r\n```\r\n\r\n### DropOut正则化\r\n\r\n假设我们的神经网络是全连接的，在每个迭代过程中，随机选择某些节点，删除前向和后向连接，因此每个迭代过程都会有不同的节点组合，从而导致不同的输出，这可以看成机器学习中的集成方法，集成模型优于一般的单一模型，因为他们可以捕获更多的随机性，因此dropout模型使得神经网络模型优于正常的模型，这里我们把dropout理解为随机丢弃某些节点以及其对应的连接。\r\n\r\n```\r\ntf.keras.layers.Dropout(rate)\r\n```\r\n\r\n* rate: 表示每一个神经元被丢弃的概率\r\n\r\n### 提前终止\r\n\r\n提前停止也就是说将一部分训练集作为验证集，当验证集的性能越来越差或者性能不再提升的时候，立即停止对该模型的训练，也就是提前终止。\r\n\r\n在实际应用中我们使用callbacks函数实现模型的早期终止\r\n\r\n```\r\ntf.keras.callbacks.EarlyStopping(\r\n	monitor=\"val_loss\", patience=5\r\n)\r\n```\r\n\r\n* monitor: 表示监测量，val_loss表示验证集损失\r\n* patience：表示epoch的数量\r\n\r\n当整个训练过程中性能无提升的时候就会停止训练\r\n\r\n### 批标准化\r\n\r\nbatch normalization 是对一批数据进行标准化的处理，是神经网络中的一层，简称BN层，与全连接层类似。但是批标准化层针对单个神经元进行，利用网络训练时的一个mini批次的数据来计算该神经元的均值和方差，归一化之后重构，因此叫做批标准化。\r\n\r\n```\r\ntf.keras.layers.BatchNormalization(\r\n	epsilon=0.01, center=True, scale=True, beta_initializer=\"zeros\", gamma_initializer=\"ones\")\r\n```\r\n\r\n## 卷积神经网络\r\n\r\n### 卷积神经网络的构成\r\n\r\n卷积神经网络CNN收到人类视觉神经系统的启发，从原始信号摄入开始，接着做出初步的处理，大脑皮层某些细胞发现图形的边缘和方向，然后抽象物体，判定眼前物体的形状，是圆形的，然后进一步抽象判定该物体是一人脸。\r\n\r\n而CNN网络主要有三部分构成：卷积层、池化层、全连接层，其中卷积层是负责提取图像中的局部特征，池化层用来降低参数的数量级，也就是降维操作，全连接层类似于人工神经网络部分，用来输出想要的结果。\r\n\r\n### 卷积层\r\n\r\n卷积层的目的是提取输入特征图的特征，可以提取图像中的边缘信息。卷积的本质就是在滤波器和输入数据的局部区域之间做点积。我们将图像看作是一个二维的矩阵，暂时忽略图像的RGB分量。而滤波器也是一个二维矩阵，只不过滤波器的特点是一般是3 * 3的矩阵，矩阵内由规律的01元素构成，通常滤波器的维度要比输入图像维度小很多，然后将输入图像的每一部分和滤波器（一个二维矩阵）做矩阵乘积，得到输出元素，进而得到输出矩阵，这个输出矩阵也就是特征图。\r\n\r\n但是在卷积的过程中，得到的结果（特征图）相比原始图会小了一圈，我们可以在原图像周围扩张一个维度（也就是padding），扩张过后的图像再与卷积核（滤波器、二维矩阵）做点积，就能保证在卷积过程中特征图的大小保持不变。\r\n\r\n因此我们有了三个关键点。一是卷积核应该如何构造，二是扩张出来的维度（padding）应该填充什么样的值呢。三是如何进行点积，也就是卷积核和原图像相乘步长应该是多少，通常来讲步长为1，也就是原图像从左上角开始，隔出来一个和卷积核大小相同的二维矩阵和卷积核相乘，得到的值放到结果矩阵的右上角，然后原图像中隔出来的小二维矩阵向右移动一个（步长为1的情况）继续和卷积核相乘，得到的值放在右上角的第二个位置，一次类推，得到最后结果。在步长增大的情况下。得到的特征图也会进一步缩小。 \r\n\r\n实际情况下，当输入由多个通道的时候，卷积核也需要拥有相同的通道数，每个卷积核对应通道矩阵和输入层对应矩阵进行卷积，将每个通道卷积的结果按位相加可以的到最终的结果——叫做feature map特征图。\r\n\r\n当然也会出现多个卷积核对原始图像进行卷积的情况，当有多个卷积核的时候，每个卷积核学习到不同的特征，对应产生包含多个通道的特征图。\r\n\r\n针对输出特征图的大小，与以下参数息息相关，卷积核本身的大小，零填充原图像的方式，卷积核卷积的步长。\r\n\r\n### 池化层\r\n\r\n池化层主要是降低了后续网络层的输入维度，缩减模型的大小，提高计算速度，并且提高了特征图的健壮性，防止过拟合现象的发生，主要是对卷积层学习到的特征图进行下采样处理，这种下采样处理有两种，分别是最大池化、平均池化。\r\n\r\n#### 最大池化\r\n\r\n最大池化，也就是对特征矩阵建立窗口，窗口的尺寸要小于特征矩阵的维数，然后在每个窗口内部，取内部元素的最大值作为输出。\r\n\r\n```\r\ntf.keras.layer.MaxPool2D(\r\n	pool_size=(2, 2), strides=None, padding=\"valid\"\r\n)\r\n```\r\n\r\n* pool_size: 池化窗口的大小\r\n* strides 窗口移动的步长，默认1\r\n* padding 是否进行填充，默认不填充\r\n\r\n#### 平均池化\r\n\r\n也就是取窗口内所有元素的均值作为输出\r\n\r\n由以上的例子可以看出，在经过池化之后，输出的矩阵维度减少了，也就是意味着后续网络层输入的维度减小了，计算速度就会变快\r\n\r\n### 全连接层\r\n\r\n全连接层位于卷积神经网络的末端，经过卷积层的特征提取和池化层的降维之后，将特征图转化位一维向量送入到全连接层中进行分类或者回归操作。\r\n\r\n### 卷积神经网络的构建\r\n\r\n数据加载\r\n\r\n数据处理\r\n\r\n模型搭建\r\n\r\n模型编译\r\n\r\n模型训练\r\n\r\n模型评估\r\n\r\n## 图像分类\r\n\r\n### 图像分类简介\r\n\r\n### AlexNet\r\n\r\nAlexNet网络也是在卷积神经网络框架下的一种模型，首先输入的是一个3通道矩阵，矩阵的维度位227 * 227，也就是说图像分辨率（或者说矩阵的维数是227）是227 * 227，在神经网络中经过卷积——池化——再卷积——池化——平整（转为1维）——全连接得到输出结果。\r\n\r\nAlexNet包含8层变换，有5层卷积和2层全连接隐藏层，以及一个全连接输出层。\r\n\r\n第一层卷积核的形状为11 * 11，卷积核的个数为96，卷积步长为4，对这个227 * 227 * 3的3通道图像（三个227 * 227的矩阵）做卷积，得到了55 * 55的特征图，一共有96个，其中每一个卷积核分别与三个通道中的每一个通道做卷积，得到的结果进行加和输出一个特征图。因此上述操作得到了形状为 55 * 55 * 96的三维特征图。\r\n\r\n第二层为池化层，对特征矩阵建立3 * 3的窗口，步长设为2，采用最大池化的方法，特征图的维度减小到 27 * 27 * 96。达到初步降维的目的。\r\n\r\n第三层还是卷积层，卷积核变小变为5 * 5的卷积核，个数为 256 。我们对上一步传下来的特征图进行范围填充（padding），填充过后使卷积后特征图的长和宽经过卷积之后不变。\r\n\r\n第三层再次池化降维。和上次池化步骤相同。\r\n\r\n第四层-第六层进行卷积，卷积核形状为3 * 3，同时也要进行范围填充保持特征图形状不变。\r\n\r\n第七层进行池化，结果降维变成 6 * 6 * 256的三维特征图。\r\n\r\n然后对这个三维特征图进行平整展开变为一维向量 6 * 6 * 256 = 9216 个参数。与原图像227 * 227 * 3 = 154587，相比参数降低了16倍。这些参数保留了图像的特征，同时降低了参数的个数，可以用于全连接层训练，减少计算量。这些参数同时作为神经元送入下层的全连接层\r\n\r\n第八和第九层为全连接层，输入9216个参数到4096个神经元中，经过全连接的神经网络，进行学习。\r\n\r\n第十层为全连接输出层，接受4096个参数（神经元），输出1000个分类结果。使用softmax将每个分类结果的得分转化为概率值，我们从中选取概率值最大的作为神经网络学习后的判断结果。\r\n\r\nAlexNet网络将sigmoid激活函数改成了relu激活函数，计算更简单，网络更容易训练\r\n\r\n通过dropout方法，也就是丢弃一些神经元来降低全连接层的复杂度\r\n\r\n引入了大量图像增强方法，如反转，裁剪，颜色变化，从而进一步扩大数据集，缓解过拟合的现象。\r\n\r\n### VGG\r\n\r\nVGG神经网络可以看成是一个加深版的AlexNet，整个网络由卷积层和全连接层叠加形成，但是VGG网络在卷积层使用的卷积核都是小尺寸的卷积核。（3 * 3）池化层使用的池化窗口是2 * 2的，是通过不断加深卷积网络来提升性能（准确度、计算用时等）。\r\n\r\n首先我们输入一个224 * 224 * 3 的三维矩阵（三通道RGB图片）经过两个 3 * 3 * 64 的卷积核（padding=same）生成特征图，然后2 * 2池化窗口池化，缩小维度，然后再卷积两次，池化，卷积三次，池化，卷积三次，池化。。。最后形成7 * 7 * 512 的特征矩阵，平整展开进入全连接层。\r\n\r\nVGG模型中我们可以把整体模型分类好几个VGG块，组成规律是：连续使用多个相同的填充为1，卷积核大小为3 * 3的卷积层，后面接上一个步幅为2，窗口形状为2 * 2的最大池化层。卷积层保持输入的高和宽不变，而池化层则会对输入减半，我们定义一个vgg_block函数能够实现这个基础的VGG块，可以指定卷积层的数量num_convs和每层卷积核的个数num_filters\r\n\r\nVGG模型\r\n\r\n```python\r\nimport numpy as np\r\nimport tensorflow as tf\r\nfrom tensorflow.keras.datasets import mnist\r\nfrom tensorflow.keras.models import Sequential\r\nfrom tensorflow.keras.layers import Conv2D\r\nfrom tensorflow.keras.layers import MaxPool2D\r\nfrom tensorflow.keras.layers import Flatten\r\nfrom tensorflow.keras.layers import Dense\r\nfrom tensorflow.keras.layers import Dropout\r\n\r\ndef vgg_block(num_convs, num_filters):\r\n    block = Sequential()\r\n    for _ in range(num_convs):\r\n        block.add(\r\n        	Conv2D(\r\n                num_filters, kernel_size=3, padding=\"same\",activation=\"relu\"))\r\n    block.add(MaxPool2D(pool_size=2, strides=2))\r\n    return block\r\n\r\ndef vgg(conv_arch):\r\n    net = Sequential()\r\n    for (num_convs, num_filters) in conv_arch:\r\n        net.add(vgg_block(num_convs, num_filters))\r\n    net.add(Sequential([\r\n        Flatten(),\r\n        Dense(4096, activation=\"relu\"),\r\n        Dropout(0.5),\r\n        Dense(4096, activation=\"relu\"),\r\n        Dropout(0.5),\r\n        Dense(10, activation=\"softmax\")\r\n    ]))\r\n    \r\ndef get_train(size):\r\n    index = np.random.randint(0, np.shape(train_images)[0], size)\r\n    resized_images = tf.image.resize_with_pad(train_images[index], 224, 224,)\r\n    return resized_images.numpy(), train_labels[index]\r\n\r\ndef get_test(size):\r\n    index = np.random.randint(0, np.shape(test_images)[0], size)\r\n    resized_images = tf.image.resize_with_pad(test_images[index], 224, 224,)\r\n    return resized_images.numpy(), test_labels[index]\r\n\r\nconv_arch = ((2, 64), (2, 128), (3, 256), (3, 512), (3, 512))\r\nnet = vgg(conv_arch)\r\n\r\n(train_images, train_labels), (test_images, test_labels) = mnist.load_data()\r\ntrain_images = tf.reshape(train_images,(train_images.shape[0], train_images.shape[1], train_images.shape[2], 1))\r\ntest_images = tf.reshape(test_images,(test_images.shape[0], test_images.shape[1], test_images.shape[2], 1))\r\n\r\ntrain_images = get_train(5000)\r\ntest_images = get_test(1000)\r\n\r\noptimizer = tf.keras.optimizers.SGD(learning_rate=0.01, momentum=0.0, nesterov=False)\r\nnet.compile(optimizer=optimizer, loss=\"sparse_categorical_crossentropy\", metrics=[\"accuracy\"])\r\n\r\nnet.fit(train_images,train_labels, batch_size=256, epochs=5, verbose=1, validation_split=0.2)\r\n\r\nnet.evaluate(test_images, test_labels, verbose=1)\r\n```\r\n\r\nVGG16中这样的VGG块由5个，前两块使用两个卷积层，而后三块使用三个卷积层，第一块输出通道是64，之后每次输出通道数翻倍，直到变为512（矩阵的高度）\r\n\r\n### GoogLeNet\r\n\r\ngoogleNet在加深网络层数的同时做了结构上的创新，引入朗日叫做inception的结构代替之前的卷积加上激活的组件。\r\n\r\nGoogleNet中的inception块里面有四条并行的线路，前三条线路使用窗口大小分别是 1 * 1， 3 * 3和5 * 5 的卷积层来抽取不同空间尺寸下的信息，其中中间2个香炉会对输入先做1 * 1的卷积来减少输入的通道数，用来降低模型的复杂度，第四条线路使用了3 * 3的最大池化层，后接1 * 1的卷积层来改变通道数，4条线路都使用了合适的填充来使得输入和输出的高度和宽度一致，最后我们将每条线路的输出在通道维上连接，并且向后进行传输，这个是GoogleNet中的一个网络块inception的结构。\r\n\r\n1 * 1的卷积核：\r\n\r\n1 * 1的大小做出的卷积，特点就是没有考虑特征图局部信息之间的关系，也就是说图像的像素和其周围像素之间的关系。那这个卷积核的作用是实现跨通道的交互和信息整合，实现卷积核通道数的降维、升维，减少网络参数\r\n\r\n\r\n\r\n### ResNet\r\n\r\n\r\n\r\n### 图像增强方法\r\n\r\n\r\n\r\n### 模型微调\r\n\r\n \r\n\r\n',
        '努力学习，努力工作呜呜，我是个勤劳的孩子', 3,
        'https://wx4.sinaimg.cn/mw2000/006wxXdWly1fyd24shw7lj31hc0u0tma.jpg', '0', '0', 10, '0', 14787164048663,
        '2022-09-10 10:20:12', 14787164048663, '2022-09-10 10:20:12', 0);
INSERT INTO `pei_article`
VALUES (10, 'Java总体概述',
        '# JAVA 练习\r\n\r\n## 〇、Java基础\r\n\r\n### 1、UML类图\r\n\r\n#### 1）泛化关系Generalization\r\n\r\n用来描述继承关系，用一个三角形和实线构成，三角形的箭头由子类指向父类。\r\n\r\n#### 2）实现关系Realization\r\n\r\n用来实现一个接口，用一个三角形和虚线构成，三角形的箭头由实现类指向接口。\r\n\r\n#### 3）聚合关系Aggregation\r\n\r\n表示整体是由部分构成的，但是整体与部分不是强依赖的，整体不存在了部分还会存在。用一个空心菱形和实线构成，菱形指向整体。\r\n\r\n#### 4）组合关系Composition\r\n\r\n表示整体是由部分组成，而整体和部分是强依赖的，整体和部分缺一不可。用一个实心菱形和实线构成，实心菱形指向整体。\r\n\r\n#### 5）关联关系Association\r\n\r\n表示不同类对象之间是有关联的，这种关联关系是静态的，需要事先定义，在创建时就已完成关联。可以是1对1，一对多，多对多。用一条实线和两数字来表示。数字表示具体的关联关系究竟是1对1还是1对多或者多对多\r\n\r\n#### 6）依赖关系Dependency\r\n\r\n依赖关系是在运行过程中才出现起作用的，在使用到相关资源的时候才会显现出依赖关系。主要有三种形式：\r\n\r\n* 被依赖的类A是主类B某个方法的局部变量。\r\n* 被依赖的类A是主类B某个方法的参数。\r\n* 被依赖的类A向主类B发送消息从而影响B类发生变化。\r\n\r\n用一条虚线和箭头组成，其中箭头指向被依赖的类。\r\n\r\n### 2、枚举类\r\n\r\nJava中枚举是一个特殊的类，用于表示一组常量。使用enum关键字来定义，每个常量之间用逗号分割。基本语法如下\r\n\r\n```java\r\nenum Color{\r\n    RED,\r\n    BLUE,\r\n    GREEN;\r\n}\r\n```\r\n\r\n* 对于每个枚举类的常量，相当于在一个名叫Color的类中创建了一个Color类型的静态只读常量。\r\n* 我们可以通过for循环遍历枚举元素。因为枚举类默认会继承 java.lang.Enum 类，实现了 java.lang.Serializable 和 java.lang.Comparable 两个接口。因此会继承 java.lang.Enum 类中的name(), values(), ordinal() 和 valueOf() 方法。\r\n  * name() 返回常量名\r\n  * values() 返回枚举类中所有的常量的值，默认是常量名\r\n  * ordinal() 找到每个枚举常量的顺序，是由定义常量时代码的先后顺序决定的\r\n  * valueOf()  返回指定字符串值的枚举常量\r\n* 枚举类的成员：枚举类跟普通类一样可以有自己的变量，方法和构造函数，但是构造函数只能是私有的，外部无法访问。但是我们可以通过构造函数来创建包含更多信息的枚举类常量，这些常量在类初始化时就会在类的内部被创造。\r\n\r\n因此我们可以定义包含更多信息的枚举类\r\n\r\n```java\r\nenum Weekday {\r\n    MON(1, \"星期一\"), \r\n    TUE(2, \"星期二\"), \r\n    WED(3, \"星期三\"), \r\n    THU(4, \"星期四\"), \r\n    FRI(5, \"星期五\"), \r\n    SAT(6, \"星期六\"), \r\n    SUN(0, \"星期日\");\r\n\r\n    public final int dayValue;\r\n    private final String chinese;\r\n\r\n    private Weekday(int dayValue, String chinese) {\r\n        this.dayValue = dayValue;\r\n        this.chinese = chinese;\r\n    }\r\n\r\n    @Override\r\n    public String toString() {\r\n        return this.chinese;\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n## 一、异常处理\r\n\r\nJava标准库常用的异常\r\n\r\n```ascii\r\nException							    常用异常汇总\r\n│\r\n├─ RuntimeException					     运行时异常\r\n│  ├─ NullPointerException			      空指针异常\r\n│  ├─ IndexOutOfBoundsException			  数组越界异常\r\n│  ├─ SecurityException					 安全异常\r\n│  └─ IllegalArgumentException			  非法的参数异常\r\n│     └─ NumberFormatException		  	  数字的格式异常\r\n│\r\n├─ IOException							输入输出异常\r\n│  ├─ UnsupportedCharsetException		  不支持的字符集异常\r\n│  ├─ FileNotFoundException				 文件未找到异常\r\n│  └─ SocketException					 网络异常\r\n│\r\n├─ ParseException						解析异常\r\n│\r\n├─ GeneralSecurityException			 	 总体的安全异常\r\n│\r\n├─ SQLException							数据库SQL语句异常\r\n│\r\n└─ TimeoutException						超时异常\r\n```\r\n\r\n**日志级别**\r\n\r\n日志是程序输出的一些在程序运行时期的情况信息。Java中的日志库有Commons Logging使用方法：第一步，通过`LogFactory`获取`Log`类的实例； 第二步，使用`Log`实例的方法打日志。\r\n\r\nCommons Logging定义了6个日志级别，默认级别及以上的日志信息会被打印出来。从严重到普通分别为：\r\n\r\n* FATAL 致命错误\r\n* ERROR 错误信息\r\n* WARNING 警告 \r\n* INFO 普通信息（默认级别）\r\n* DEBUG 调试信息\r\n* TRACE 追踪信息\r\n\r\n## 二、输入输出\r\n\r\nIO流以`byte`（字节）为最小单位，因此也称为*字节流*。在Java中，`InputStream`代表输入字节流，`OuputStream`代表输出字节流，这是最基本的两种IO流。字节流传输的最小数据单位是字节byte。\r\n\r\n如果我们要读写的是字符，并且字符不全是以单字节表示的ASCII字符，那么按照char读写更方便，这种流称为*字符流*。Java提供了`Reader`和`Writer`表示字符流，字符流传输的最小数据单位是char。使用`Reader`和`Writer`，读取的数据源虽然是字节，但是他们内部对若干字节做了编码和解码，然后将字节转换成了字符。本质上能够自动编码和解码的`InputStream`和`OuputStream`。\r\n\r\n因此实际上我们也能够自己编写逻辑，实现字节到字符的编码和解码，究竟使用`InputStream`和`OuputStream`还是`Reader`和`Writer`取决于数据源是文本还是其他文件。\r\n\r\nJava提供一个FILE的类实现对文件的操作。FILE对象即可以表示文件，也可以表示目录。只有当我们调用FILE对象的某些方法时，才回真正执行磁盘操作。\r\n\r\n## 三、日期与时间\r\n\r\n\r\n\r\n## 四、单元测试\r\n\r\n\r\n\r\n## 五、函数式编程\r\n\r\n函数式编程是把函数作为基本的运算单元，函数可以做为变量，可以接受函数，还可以返回函数，支持函数式编程的编码风格我们称之为lambda表达式。语法如下：\r\n\r\n```java\r\n//通常写法\r\n(参数列表) -> {\r\n    一些处理逻辑\r\n	return 返回值;\r\n}\r\n//简写，适用于函数体内部只有一行return\r\n(参数列表) -> 返回值;\r\n```\r\n\r\n## 六、设计模式\r\n\r\n### 1、创建型模式\r\n\r\n#### 1）工厂方法\r\n\r\n工厂方法定义一个用于创建对象的接口，让子类决定实例化哪一个类，工厂方法让一个类的实例化延迟到其子类实现。目的是为了使创建对象和使用对象分离。使用者总是引用抽象工厂和抽象产品，而不是具体的类。\r\n\r\n#### 2）抽象工厂\r\n\r\n#### 3）建造者\r\n\r\n#### 4）原型\r\n\r\n用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。也就是说在创建新对象的时候，需要根据现有的原型来创建。\r\n\r\n#### 5）单例\r\n\r\n\r\n\r\n### 2、结构型模式\r\n\r\n#### 1）适配器\r\n\r\n将一个类的接口A转换成客户希望的另一个接口B，使得原本由于接口不兼容而不能一起工作的类可以一起工作。对于一个适配器，我们在适配器内部要实现目标接口B，而适配器的内部会持有一个待转换的接口A。目标接口就可以调用这个适配器进行工作。而不需要调用之前那个不兼容的接口。适配器相当于一个中间商。\r\n\r\n#### 2）桥接\r\n\r\n#### 3）组合\r\n\r\n#### 4）装饰器\r\n\r\n动态的给一个对象添加一些额外的职责\r\n\r\n#### 5）外观\r\n\r\n为子系统中的一组接口提供一个一致的界面\r\n\r\n#### 6）享元\r\n\r\n核心就是共享数据，如果一个对象实例一经创建就不可变，那么我们就没有必要反复创建相同的实例，直接返回一共享的实例。\r\n\r\n#### 7）代理\r\n\r\n为其他对象提供一个代理以控制对这个对象的访问，在代理类中我们可以对该对象返回的数据进一步操作。代理有虚代理，调用这目前只有一个代理对象，而代理对象中的真正的对象还没有被创建，只有在必须调用的时候才会创建。保护代理，这个代理可以控制调用方对这个真正的对象的访问权限。智能代理，在没有外部方调用的时候会释放真正对象以节约系统资源。\r\n\r\n### 3、行为型模式\r\n\r\n#### 1）责任链\r\n\r\n多个对象都有机会处理某个请求，请求的发送者和真正的接收者之间没有耦合关系。将处理请求的对象连成一条链，并沿着这条链传递请求直到有一个对象处理它为止。那么每个请求处理者只关心自己责任范围内的请求，对超出自己责任范围的，扔给下一个审核者处理。将来继续添加审核者的时候，就不需要改变现有的逻辑。\r\n\r\n#### 2）命令\r\n\r\n#### 3）解释器\r\n\r\n#### 4）迭代器\r\n\r\n遍历一个对象时通过一个逻辑的方法而不需要了解对象具体的物理实现方式，比如说链表和顺序表的遍历，顺序表可以通过数组下标逐个访问，而链表需要通过指针，这样调用者在遍历元素时需要知道两个表具体物理实现方式，而通过迭代器，提供了一个统一的接口来遍历\r\n\r\n#### 5）中介\r\n\r\n引入中介将多个对象之间的交互变成双方的交互，每一方只需要和中介打交道。\r\n\r\n#### 6）备忘录\r\n\r\n主要是用于捕获一个对象内部的状态，以便在将来的某个时刻恢复此状态\r\n\r\n#### 7）观察者\r\n\r\n让发送通知的一方和接收通知的一方彼此分离互不影响\r\n\r\n#### 8）状态\r\n\r\n#### 9）策略\r\n\r\n\r\n\r\n#### 10）模板方法\r\n\r\n定义一个操作的一系列步骤，对于暂时确定不下来的，就留给子类去实现，也就是只定义框架。\r\n\r\n#### 11）访问者\r\n\r\n\r\n\r\n## 七、反射\r\n\r\n\r\n\r\n## 八、注解\r\n\r\n### 1、注解的介绍\r\n\r\n注解是放在Java源码的类、方法、字段、参数前的一种特殊的注释。注解是用作标注的元数据，会被编译器直接忽略。如何使用注解则由应用程序本身决定。Java的注解可分为三类。\r\n\r\n* 由编译器使用的注解。这类注解不会被编译进class文件，在编译之后就被扔掉了。如：\r\n  * @Override：让编译器检查是否正确实现了覆写\r\n  * @SuppressWarnings：告诉编译器忽略此处产生的代码警告\r\n* 由工具处理class文件使用的注解。如有些工具在加载class时对class做动态的修改实现一些功能。\r\n* 程序运行期能够读取到的注解。加载之后一直存在于JVM中，是最常用的注解。\r\n\r\n### 2、元注解\r\n\r\n有些注解可以修饰其他注解，这些注解叫做元注解。\r\n\r\n#### @Target\r\n\r\n是最常用的注解，定义注解能被应用在源码的哪些位置，语法如下：\r\n\r\n* 应用于类或者接口：`ElementType.TYPE`\r\n* 应用于字段：`ElementType.FIELD`\r\n* 应用于方法：`ElementType.METHOD`\r\n* 应用于构造方法：`ElementType.CONSTRUCTOR`\r\n* 应用于方法参数：	`ElementType.PARAMETER`\r\n\r\n定义注解可以用在方法上，需要添加注解。`@Target(ElementType.METHOD)`\r\n\r\n定义注解可以用在方法和字段上，注解的参数需要是一个{}数组。`@Target({ElementType.METHOD, lementType.FIELD})`\r\n\r\n#### @Retention\r\n\r\nRetention n.：保持、保留的意思。定义了注解的声明周期，如果不存在该注解，则默认生命周期到class。语法如下：\r\n\r\n* 仅编译期：`RetentionPolicy.SOURCE`\r\n* 仅在class文件中：`RetentionPolicy.CLASS`\r\n* 运行期：`RetentionPolicy.RUNTIME`\r\n\r\n#### @Repeatable\r\n\r\n定义注解是否可以重复，加上后注解可以重复添加。\r\n\r\n#### @Inherited\r\n\r\n定义子类是否可以继承父类定义的注解，仅对能应用于类的注解生效。加上后对于父类使用了注解，子类默认会继承该注解。\r\n\r\n### 3、定义注解\r\n\r\n定义一个注解，还可以定义配置参数。这些参数在使用注解的时候传入。注解的配置参数可以有默认值，没有传入配置参数的时候使用默认值。大部分注解会有一个名为value的配置参数，对这个参数赋值，可以只写常量。参数必须是常量。可以包括：所有基本类型、字符串、枚举类型。下面是定义一个注解的格式，Java使用@interface 来定义一个注解。\r\n\r\n```java\r\npublic @interface Report{\r\n	int type() default 0;\r\n    String level() default \"info\";\r\n    String value() default \"\";\r\n}\r\n```\r\n\r\n### 4、读取注解\r\n\r\n能存在于运行期的注解经常用到，是我们需要关注的。因此在定义注解的时候需要加上`@Retention(RetentionPolicy.RUNTIME)`，接下来说明如何读取运行期的注解。\r\n\r\n注解也是一种class类，读取注解需要使用反射。\r\n\r\n#### 判断注解是否存在\r\n\r\n即判断注解是否存在于类、字段、方法、构造器中（CLASS FIELD METHOD CONSTRUCTOR）\r\n\r\n* `Class.isAnnotationPresent(ClassName.class)`\r\n* `Field.isAnnotationPresent(ClassName.class)`\r\n* `Method.isAnnotationPresent(ClassName.class)`\r\n* `Constructor.isAnnotationPresent(ClassName.class)`\r\n\r\n例如判断注解@Report是否存在与Person类：`Person.class.isAnnotationPresent(Report.class)`\r\n\r\n#### 使用反射API读取注解\r\n\r\n* `Class.getAnnotation(ClassName.class)`\r\n* `Field.getAnnotation(ClassName.class)`\r\n* `Method.getAnnotation(ClassName.class)`\r\n* `Constructor.getAnnotation(ClassName.class)`\r\n\r\n### 5、处理注解\r\n\r\n注解如何使用，完全由程序自己决定。例如Junit会自动运行所有标记为@Test的方法\r\n\r\n以一个注解@Range定义一个`String`字段的规则：字段长度满足`@Range`的参数。处理方法如下\r\n\r\n1. 首先通过反射获取实例对象的所有字段\r\n2. 获取该字段定义的范围，如果范围存在，则获取定义注解的字段的值，判断值是否满足注解的条件\r\n3. 如果不满足条件，抛出异常\r\n\r\n那么这样一来，我们就自己定义了一个方法，获取字段的注解，并判断实例对象是否满足该注解的条件。检查逻辑是我们自己编写的，JVM并不会添加任何逻辑，因此检查方法好坏由我们自己决定。\r\n\r\n## 九、泛型\r\n\r\n### 1、泛型标记符\r\n\r\n实际上Java中的泛型就是把参数的类型也当做是一个特殊的参数，我们叫做**类型参数**，参数的类型可以由不同的标记符标记。\r\n\r\n* E element 元素，在集合中使用\r\n* T type Java类\r\n* K key 键\r\n* V value 值\r\n* N number 数值\r\n* ? 不确定\r\n\r\n### 2、泛型方法\r\n\r\n泛型方法在调用的时候可以接收不同类型的参数，根据传递给泛型方法的参数类型，编译器会处理对方法的调用，定义泛型方法的规则如下：\r\n\r\n* 泛型方法在声明的时候，也要声明**类型参数**，在方法的返回类型前，使用尖括号分割。\r\n* 类型参数的声明可以由一个或者多个类型参数，之间用逗号隔开。\r\n* 类型参数不仅可以用在传入的参数上，也可以用作返回的类型上。\r\n* 如果希望限制参数的类型种类，既不是某个特定的类型，也不能传递任意的类型，而是希望参数的类型是在某个特定的区间内，我们可以使用extends关键字，后面跟上类型的范围。\r\n\r\n```java\r\npublic static <T> void print(T data){}  					//泛型作为方法参数类型\r\npublic static T print(String data){}						//泛型作为规定返回值类型\r\npublic static <T extends Comparable<T>> void print(T data){}//规定只接受comparable类及其子类作为方法的类型\r\n```\r\n\r\n### 3、泛型类\r\n\r\n泛型类的声明规则与泛型方法类似，但是类型参数是声明在类名的后面，用于规定类内的属性的类型。\r\n\r\n## 十 、Maven\r\n\r\n## 十一、集合\r\n\r\nJava标准库自带的`java.util`包提供了集合类`collection`，他是除了`Map`之外的所有集合类的根接口。Java主要提供了三种类型的集合。Java的集合接口和实现类分离，支持泛型。访问集合可以通过抽象的迭代器来实现，这样就无需知道集合内部元素存储方式。\r\n\r\n* List 顺序表或者链表\r\n* Set 没有重复元素的集合\r\n* Map 键值对\r\n\r\n<img src=\"E:\\StudyDoc\\6.阅读笔记\\图片\\java_collections_overview.png\" alt=\"img\" style=\"zoom:150%;\" />\r\n\r\n* Collection接口：List接口、Queue接口、Set接口继承了Collection接口，他们之间是泛化的关系。\r\n  * List接口：ArrayList类、LinkedList类实现了List接口，他们之间是接口与类的实现关系\r\n  * Queue接口：BlockingQueue接口、Deque接口继承了Queue接口，LinkedList、PriorityQueue类实现了Queue接口。\r\n    * Deque接口：LinkedList类、ArrayDeque类实现了Deque接口，BlockingDeque接口继承了Deque接口\r\n  * Set接口：HashSet类实现了Set接口。SortedSet继承了Set接口，NavigableSet又继承了SortedSet接口，TreeSet最终实现了SortedSet接口。\r\n* Map接口：EnumMap HashMap实现了Map接口。SortedMap接口继承了Map接口，TreeMap类最终实现了SortedMap接口。\r\n\r\n总体来讲，集合类所所实现的数据结构可由带颜色的圆点看出，一共有链表List、数组Array、红黑树Red-Black Tree、哈希表Hash Table、二叉堆Binary Tree几种数据结构\r\n\r\n### 1）List\r\n\r\n* List<E>接口有以下几种方法：\r\n\r\n  * 在末尾添加一个元素\r\n\r\n  * 在指定的索引后添加一种元素\r\n\r\n  * 删除指定索引的元素\r\n\r\n  * 删除某个元素\r\n\r\n  * 获取指定索引的元素\r\n\r\n  * 获取列表的大小\r\n  * 返回某个元素的索引\r\n  * 判断List是否存在某个元素\r\n\r\n* List<E>接口常用的主要有两种实现：LinkedList 链表，但不仅可以用所链表，还可以用作栈、队列、双向队列。ArrayList 是动态数组\r\n\r\n* 遍历访问 List 最好使用迭代器 Iterator 访问\r\n\r\n* 转换成数组：使用`toArray(T[List.size()])`方法传递一个与LIst元素类型相同的数组，List会自动将所有元素复制到数组中。\r\n\r\n### 2）Set\r\n\r\n\r\n\r\n### 3）Map\r\n\r\n* Map<E>接口主要有三种实现：EnumMap TreeMap HashMap\r\n\r\n## 十二、多线程\r\n\r\n### 1、并发问题三要素\r\n\r\n多线程是一种并发的操作，并发操作会出现一些问题，这些问题有三个特点：\r\n\r\n* 可见性：由CPU的缓存引起，在多CPU的情况下，每个CPU都有自己的高速缓存，由于CPU和主存之间速度不匹配的问题，其中一个CPU对共享变量的修改并不会立即写回主存中，此时另一个线程从主存中读取该值并加载到另一个CPU高速缓存中。另一个线程并没有看到该变量已经被修改过了，这就是线程之间共享数据的可见性问题。\r\n* 原子性：一个操作或多个操作，是不能被任何因素打断的执行。否则就不执行。由于操作系统分时复用CPU，就会导致这些操作可能会被打断。\r\n* 有序性：程序执行按照代码的先后顺序执行。编译程序会优化指令执行次序，会导致有序性被破坏。发生指令重新排序\r\n  * 编译器优化的重排序，编译器在不改变单线程程序语义情况下，重新安排语句执行次序\r\n  * 指令级并行重排序，如果不存在数据依赖性，处理器可以改变语句对应的机器指令的执行顺序\r\n  * 内存系统重排序，处理器有高速缓存和读写缓冲区，写回内存时间在微观上不确定，加载和存储操作可能是在乱序进行\r\n\r\n### 2、Java解决并发问题方法\r\n\r\n#### 1）关键字\r\n\r\n##### volatile\r\n\r\n\r\n\r\n##### synchronized\r\n\r\n\r\n\r\n##### final\r\n\r\n\r\n\r\n#### 2）Happens-Before (在其之前要发生)规则\r\n\r\n* 单一线程原则：在一个线程内，程序前面的操作要先于后面的操作发生\r\n* 管程锁定原则：对于同一个锁，解锁操作要先于加锁操作\r\n* 变量读写原则：对于有volatile关键字的变量，写操作要先于读操作完成。\r\n* 线程启动原则：线程对象的start()方法调用先于此线程的每一个动作\r\n* 线程加入规则：线程对象的结束先于其他线程的加入join()方法\r\n* 线程中断规则：对某个线程调用中断方法先于被中断线程检测到中断时间的发生\r\n* 对象终结原则：对象初始化完成先于它的结束方法finalize()\r\n* 传递性：操作A先于操作B，操作B先于操作C，那么操作A先于操作C\r\n\r\n### 3、线程安全\r\n\r\n#### 1）概念\r\n\r\n一个类可以被多个线程安全的调用时就是线程安全的，根据共享数据需要的安全程度可以分为五类：不可变、绝对线程安全、相对线程安全、线程兼容、线程对立。\r\n\r\n* 不可变：不可变的对象一定是线程安全的，只要这个对象被正确的构建出来，在它整个生命周期中就不可变。不可变的类型有以下几种：\r\n\r\n  * final关键字修饰的基本数据类型\r\n\r\n  * String类 字符串\r\n\r\n  * 枚举类型\r\n\r\n  * Number的部分子类，Long Double BigInteger BigDecimal\r\n\r\n  * 使用Collection.unmodifiableXX()方法获取的集合\r\n\r\n* 绝对线程安全：对于某个对象，不管运行环境如何，调用者都不需要考虑线程安全的问题\r\n\r\n* 相对线程安全：对于这个对象单独的操作时线程安全的，但是对于特定顺序的连续调用，需要使用额外的同步手段。Java语言中大部分线程安全类属于这种类型。\r\n\r\n* 线程兼容：指的是对象本身不是线程安全的，但是通过正确使用同步手段可以保证对象在并发环境下安全的使用。\r\n\r\n* 线程对立：指的是无论是否采取同步措施，都无法保证多线程环境中并发造成的问题。很少出现\r\n\r\n#### 2）解决方法\r\n\r\n\r\n\r\n\r\n\r\n### 4、Java多线程的实现\r\n\r\n#### 1）线程状态的分类\r\n\r\n![](E:\\StudyDoc\\6.阅读笔记\\图片\\java_thread_condition.png)\r\n\r\n* New 新建状态：指的是一个线程被创建出来，但没有启动。\r\n* Runnable 可运行的状态：指的是线程可能在运行，也可能在等待时间片轮转。\r\n* Blocked 阻塞状态：等待获取一个排他锁\r\n* Time Waiting 等待状态：在一定时间后会被系统自动唤醒，阻塞和等待的区别是阻塞是被动的，是需要获取一个资源。而等待是主动的，通过调用Object.wait() Thread.sleep()等进入\r\n* Waiting 一直等待状态：等待其他线程唤醒\r\n* Terminated 结束状态：结束了任务或者产生了异常\r\n\r\n#### 2）Java中执行多线程的方法：\r\n\r\n总得来说就是实现接口、继承Thread。实现接口更好一些，因为接口可以多实现，一个类可能要求并不高，单独为其创建一个线程开销过大。具体方法如下：\r\n\r\n* 自定义的类继承（extends）Thread类，然后覆写它的run方法。然后定义并启动这个类\r\n* 创建Thread实例时，传入一个Runnable实例。也就是自定义一个类实现Runnable接口，需要实现run方法\r\n* 自定义类实现Callable接口，但它可以有返回值。创建Thread实例时，传入这个类的实例\r\n\r\n#### 3）线程机制\r\n\r\n* Excutor 线程执行器：能够管理多个异步任务的执行，主要有三种：缓冲线程池、固定线程池、单例线程池\r\n* Daemon 守护线程：是程序运行时在后台提供服务的线程，所有非守护线程结束后，程序会终止。\r\n* sleep方法：会休眠当前正在执行的线程\r\n* yield方法：说明当前线程中涉及到线程安全重要的部分已经完成，接下来可以切换给其他线程运行\r\n* interrupt方法：会中断当前线程，之后我们可以调用interrupted() 方法来判断线程是否处于中断状态。如果该线程处于阻塞或等待状态，会抛出中断异常从而提前结束该线程。这种中断不能中断因I/O请求阻塞和同步锁阻塞。\r\n\r\n## 十一、网络编程\r\n\r\n### 1、socket\r\n\r\nsocket是在网络层和应用层之间的一个数据结构，负责管理着网络层和应用层中需要关心的数据。一个应用程序通过socket来建立一个远程连接。socket内部通过TCP/IP协议把数据传输到网络。因为仅仅通过IP地址来通信是不够的，同一台不同应用程序进程之间，在只有IP地址的情况下，操作系统不知道究竟应该发给哪一个应用程序。所以在网络层之上添加了socket接口，每个应用程序有对应的socket接口。数据报通过socket接口来正确的发送到对应的应用程序。\r\n\r\nsocket由IP地址和端口号组成，端口号有操作系统分配，在0~65535之间。使用socket进行网络通信，就是两个进程之间的通信，其中一个进程需要充当服务端，监听指定的端口。另一个充当客户端，主动连接服务器IP地址和指定端口。连接成功后，服务端和客户端就建立了TCP连接。\r\n\r\n### 2、TCP编程\r\n\r\n首先，上文说到socket是两个进程，服务器端和客户端之间的通信，那么两者的任务是不一样的。\r\n\r\n* 对于服务器端，需要实现对指定IP和端口的监听。Java标准库实现了这个功能，我们只需要传入想要它监听的端口，即可开始监听，之后不断的监听，发现有客户端传来的链接，则为其分配一个线程来处理。具体代码实现如下。\r\n\r\n```java\r\nServerSocket ss=new ServerSocket(8080);\r\nwhile(true){\r\n    Socket newSocket=ss.accept();	//客户端传来的socket连接\r\n    Thread t=new Hander(newSocket); //新开一个线程处理该连接\r\n}\r\n/************Hander的handle方法处理两个进程之间的数据传输**************/\r\nprivate void handle(InputStream input,OutputStream output) throw IOException{\r\n    \r\n}\r\n```\r\n\r\n* 对于客户端，通过socket连接指定的服务器和端口，连接建立后，进行数据传输操作。传输完毕关闭连接\r\n\r\n```java\r\nSocket s=new Socket(\"localhost\",8080);\r\n//数据传输操作\r\ns.close();\r\n```\r\n\r\n### 3、UDP编程\r\n\r\n* 对于UDP服务器和客户端之间的通信，服务器端Java提供了DatagramSocket来实现监听指定端口的信息。我们传入想监听的端口，之后开始监听。通过DatagramPacket类，里面存放了与客户端交互的逻辑，使用它的实例接收UDP数据报，并向客户端回复数据。\r\n\r\n```java\r\nDatagramSocket ds=new DatagramSocket(8080);\r\nwhile(true){\r\n    DatagramPacket packet = new DatagramPacket(参数);\r\n	ds.receive(packet);		//从客户端收取一个UDP数据包，放在packet中\r\n    packet.setData(response);//回复客户端一条数据（response）\r\n    ds.send(packet);\r\n}\r\n```\r\n\r\n* 客户端使用UDP时，只需要直接向服务端发送数据包，然后接收返回的数据包。\r\n\r\n### 4、HTTP编程\r\n\r\nHTTP是基于TCP协议之上的超文本传输协议，是需要进行请求-相应的协议。目的是为了传输数据。\r\n\r\n浏览器希望访问某个网站时，浏览器和网站服务器首先要建立TCP连接，然后浏览器向服务器发出**HTTP请求**，服务器收到后返回**HTTP响应**，里面包含了网页内容。\r\n\r\n#### 1）HTTP请求\r\n\r\nHTTP请求的格式是固定的，由HTTP Header和HTTP Body两部分构成。\r\n\r\nHTTP Header：第一行总是 `请求方法 路径 HTTP协议`，后续每一行都是 `Header : Value 格式`。例如：\r\n\r\n```\r\nGET / HTTP/1.1\r\nHost : www.sina.com.cn\r\nUser-Agent : Mozilla/5 MSIE\r\nAccept : */*\r\nAccept-lauguage : zh-CN,EN\r\n```\r\n\r\n**GET POST 请求的区别**\r\n\r\n* 如果是GET请求，那么请求只有HTTP Header，没有HTTP Body。如果是POST 请求，带有HTTP Header和HTTP Body，两者之间用一个空行分割。\r\n* `POST`请求通常要设置`Content-Type`表示Body的类型，`Content-Length`表示Body的长度，这样服务器就可以根据请求的Header和Body做出正确的响应。\r\n* `GET`请求的参数必须附加在URL上，并以URLEncode方式编码，因为URL的长度限制，`GET`请求的参数不能太多。而`POST`请求的参数必须放到Body中。参数就没有长度限制，`POST`请求的参数不一定是URL编码，可以按任意格式编码，只需要在`Content-Type`中正确设置。\r\n\r\n**HTTP请求头信息**\r\n\r\n| 属性        | 描述                         | 举例          |\r\n| ----------- | ---------------------------- | ------------- |\r\n| method      | 请求方法                     | GET POPST     |\r\n| requestURI  | 请求路径                     | /hello /login |\r\n| queryString | 请求参数，通常为GET方法所用  |               |\r\n| parameter   | 请求参数，通常为Post方法所用 |               |\r\n| contentType | 请求Body的类型               |               |\r\n| contentPath |                              |               |\r\n| cookies     |                              |               |\r\n|             |                              |               |\r\n|             |                              |               |\r\n\r\n\r\n\r\n#### 2）HTTP响应\r\n\r\nHTTP响应也是由Header和Body两部分组成。\r\n\r\nHTTP Header：第一行总是`HTTP版本 响应代码 响应说明`，后续每一行都是 `Header : Value 格式`。HTTP Body通常是一个HTML文档，或者其他信息。\r\n\r\n#### 3）HTTP 客户端\r\n\r\nHTTP 客户端编程的过程如下，发送一个HTTP请求，接收服务器响应然后获得响应内容。\r\n\r\n```java\r\nURL url=new URL(网站名);\r\nHttpURLConnection conn = (HttpURLConnection)url.openConnection();\r\nconn.setXXX();			//设置请求参数\r\nconn.connect();			//连接并发送请求\r\nif(conn.getResponseCode()!=200){\r\n    throw new RuntimeException();\r\n}\r\nMap<String,List<String>> map = conn.getHeaderFields();		//获取响应头\r\nInputStream input = conn.getInputStream();				   //获取响应内容\r\n```\r\n\r\n#### 4）HTTP 服务端\r\n\r\nHTTP 服务端本质上是一个TCP服务器，由之前所创建的服务器代码，在其处理不同进程数据传输的Hander的handle方法中添加如下逻辑：读取http请求，处理请求，并返回响应结果。需要考虑的事情有：\r\n\r\n* 识别正确和错误的HTTP请求；\r\n* 识别正确和错误的HTTP头；\r\n* 复用TCP连接；\r\n* 复用线程；\r\n* IO异常处理；\r\n\r\n## 十二、Web开发\r\n\r\n### 1、Servlet介绍\r\n\r\n实际上要编写一个完善的http服务器需要耗费大量的时间，考虑许多东西。所以Java就提供了运行在Web服务器的程序叫做Servlet，一些底层的任务比如说识别错误正确的请求，解析http协议等交给它去做。我们使用Servlet提供的API来处理HTTP请求。\r\n\r\nServlet主要执行以下任务：\r\n\r\n* 读取客户端发来的显式数据，主要是网页上的HTML表单产生的数据。\r\n* 读取客户端发来的隐式请求数据，包括Cookies、媒体类型、浏览器能够理解的压缩格式等。\r\n* 处理数据并生成结果。解析客户端发来的数据。\r\n* 发送显式的数据到客户端，这些数据格式可以是多种多样的，包括文本文件，二进制文件等。\r\n* 发送隐式的HTTP响应到客户端。比如说HTTP请求头的内容，设置Cookies、缓存参数、设置返回文档类型。\r\n\r\n### 2、Servlet生命周期\r\n\r\nServlet生命周期是Servlet对象从创建到毁灭的整个过程。\r\n\r\n* Servlet 初始化后调用init()方法\r\n* Servlet 调用 service()方法来处理客户端请求\r\n* Servlet 销毁前调用 destroy()方法\r\n* Servlet 由JVM的垃圾回收器回收它所占用的内存\r\n\r\n#### 1）init()\r\n\r\n一个Servlet对象创建于用户第一次调用该Servlet对应的URL时，只调用一次，后续每次用户请求时都不再调用。用户每次调用这个Servlet，都会创建一个实例对象，也就是说每一个用户请求都会产生一个新线程。init()方法会简单的创建或者加载一些数据，这些数据将用于Servlet整个生命周期。\r\n\r\n#### 2）service()\r\n\r\nservice()方法是执行实际任务的主要方法，容纳Servlet对象的那个容器（通产是Web服务器）会调用service()方法处理客户端发来的请求，然后将格式化的响应发给客户端。service()方法会检查HTTP请求类型，判断是GET POST PUT DELETE。然后调用doGet(), doPost() doPut() doDelete() 方法。\r\n\r\n我们自己编写的Servlet需要继承`HttpServlet`，用户最常用的请求类型是Get Post，因此我们覆写`doGet() doPost()`方法。这两个方法传入了`HttpServletRequest`和`HttpServletResponse`两个对象，分别代表HTTP请求和响应。这两个对象已经封装好了请求和响应。我们需要简单的获取请求参数，设置正确的响应类型，然后在写入响应即可。\r\n\r\n**`HttpServletRequest`**\r\n\r\n浏览器发来的HTTP请求都封装到了`HttpServletRequest`这个对象中，我们通过`HttpServletRequest`提供的方法可以拿到所有的HTTP请求信息。`HttpServletRequest`从`ServletRequest`继承而来。通过`getXXX()`方法获取。\r\n\r\n**`HttpServletResponse`**\r\n\r\n服务器发送的HTTP响应需要封装到`HttpServletResponse`这个对象中，那么就需要设置响应头，通过`setXXX()`方法设置。\r\n\r\n#### 3）destroy()\r\n\r\ndestroy()方法只会调用一次，可以在这里关闭数据库连接、停止后台线程、执行一些清理活动。\r\n\r\n####　4）总结\r\n\r\n实际上我们在web应用程序中并没有创建Servlet对象，也没有自己确定Servlet对象在何时会调用，没有实现服务器端和客户端之间的通信如TCP连接，解析HTTP协议的具体细节。因此对于web应用程序，我们必须先需要一个服务器来替我们做这些工作，再由服务器加载我们编写的Servlet，这样就可以让Servlet处理浏览器发送的请求。我们就需要找一个支持Servlet API的Web服务器。\r\n\r\nTomcat是一个WEB服务器，也是由Java编写的，启动Tomcat服务器实际上启动了Java虚拟机，执行了Tomcat的main()方法，然后Tomcat负责加载我们自己写的程序，创建一个Servlet实例，以多线程的模式来处理HTTP请求。\r\n\r\n那么Tomcat服务器就是一个Servlet的容器。在容器中的Servlet有以下的特点：\r\n\r\n* 无法在代码中直接通过new创建Servlet实例，必须由Servlet容器自动创建Servlet实例\r\n* Servlet容器只会给每个Servlet类创建唯一实例\r\n* Servlet会多线程的执行doGet() doPost()方法\r\n\r\n### 3、Servlet开发\r\n\r\n#### 1）Dispatcher\r\n\r\n一个web应用程序由一个或者多个Servlet组成的，每个Servlet通过注解说明自己能处理的URL路径。对于用户不同的请求路径要交给不同的Servlet处理。那么客户端发来的HTTP请求总是由WEB服务器先接收，然后根据Servlet配置的映射路径。不同的路径转发给不同的Servlet处理。那么就需要一个中间商来处理请求交个哪一个Servlet处理。这个中间商所实现的功能称为分发（Dispatch），中间商我们称为分发器（Dispatcher）。\r\n\r\n分发器收到请求，判断路径，交给不同的Servlet，代码实现可以如下\r\n\r\n```java\r\n//收到一个浏览器发来的路径 String path;\r\nif(path.equals(\"hello\")){\r\n	dispatchTo(helloServlet);\r\n}else if(path.equals(\"login\")){\r\n	dispathTo(loginServlet);\r\n}else{\r\n    dispatchTo(indexServlet);\r\n}\r\n```\r\n\r\n####　2）Redirect\r\n\r\n重定向指的是当浏览器请求一个URI时，服务器返回一个 重定向指令，告诉浏览器地址已经变了，需要使用新的URI再次重新发送请求。\r\n\r\n比如说我们已经编写了一个能处理路径为`/hello`的Servlet，如果收到的路径是`/hi`，我们希望让浏览器看到路径为`/hello`的Servlet，那么再编写一个Servlet命名为`RedirectServlet`，在这个Servlet内部实现重定向到`/hello`。\r\n\r\n如果浏览器发送`GET /hi`请求，`RedirectServlet`将处理此请求。由于`RedirectServlet`在内部又发送了重定向响应。浏览器会根据服务器发回的指示发送一个新的`GET /hello`请求。整个过程浏览器发送了两次HTTP请求。\r\n\r\n重定向有两种：一种是302响应，称为临时重定向。一种是301响应，称为永久重定向。对于永久重定向，浏览器会缓存`/hi`到`/hello`这个重定向的关联，下次请求`/hi`的时候，浏览器就直接发送`/hello`请求了。\r\n\r\n重定向的目的是当WEB应用升级后，如果请求路径发生了变化，可以将原来的路径重定向到新的路径，避免浏览器找不到在原路径上的资源。\r\n\r\n#### 3）Forward\r\n\r\nForward是指内部转发。当一个Servlet处理请求的时候，它可以决定自己不继续处理，而是转发给另一个Servlet处理。对于浏览器来说，它只发出了一个HTTP请求。浏览器并不知道服务器在其内部做了一次转发。\r\n\r\n#### 4）Session\r\n\r\n对于要注册登录的应用，需要跟踪用户身份，服务器可以向浏览器分配一个唯一的ID，并用Cookies的形式发送到浏览器，浏览器在后续访问的时候带上这个Cookies，服务器就可以识别用户身份。基于唯一ID识别用户身份的机制叫做Session (n.意为一段时间)。用户第一次访问服务器会自动获得一个Session ID，如果用户在一段时间内没有访问这个服务器，那么Session就会自动失效。下次访问服务器会分配一个新的Session ID，将该用户看作是一个新用户。识别用户的名为Session机制是通过Cookies来实现的。\r\n\r\n以用户登录为例，`HttpServletRequest`这个对象里面封装了用户请求信息，同时也提供了生成session ID的方法。登录时判断用户名和密码，如果正确的话，对这个请求获取一个session，并将用户名称放入这个session中。之后在其他的servlet中，我们可以从`HttpServletRequest`（封装了HTTP请求和Session）对象中获取到session。识别用户身份，进而继续处理用户的请求。用户登出的话，就是从`HttpSession`中移除该用户的信息。\r\n\r\n```java\r\nHttpSession session = request.getSession();\r\nsession.setAttribute(\"user\",userName);\r\n```\r\n\r\n#### 5）Cookies\r\n\r\n是服务器识别用户身份，跟踪用会话的一串字符。服务器可以设置一个Cookies，发送给浏览器。浏览器下次就可以带着这个Cookies对服务器请求。服务器就可以识别用户身份。\r\n\r\n#### 6）Filter\r\n\r\n在一个复杂的应用程序中，有多个Servlet来处理不同的URI。有些功能的请求需要用户通过登录后才给放行，否则我们需要直接跳转到登录页面。那么这个判断登录的逻辑需要在这些Servlet中都写一遍。为了实现代码复用，我们把这些相同的功能从各个Servlet中抽离出来，在HTTP请求到达某些Servlet之前，先被一个中间商处理，然后在交给对应的Servlet。注意到这个分发器是不同的，这个中间商只对某些用户请求起作用，起到了对用户请求的预处理作用。因此我们把它叫做过滤器（Filter）。\r\n\r\n对于那些需要用户登录才能操作的功能，我们把它放在更下一级的目录，对于这些URI的请求，都会先经过过滤器，然后才会分发到对应的Servlet。\r\n\r\n多个过滤器会组成一个从前往后的链条，对于每个到达的请求会被链条上的过滤器依次处理。如果中间的某个过滤器内部在处理请求的时候，发现这个请求不符合预订的规则，调用了重定向，那么后续的过滤器将没有机会在处理该请求了。\r\n\r\n#### 7）Listener\r\n\r\n\r\n\r\n',
        'Java的学习指南', 1, 'https://wx1.sinaimg.cn/mw1024/007g5KNhgy1h623hx23uxg30dc0dc1l3.gif', '0', '0', 0, '0',
        14787164048663, '2022-09-10 10:20:12', NULL, NULL, 0);
INSERT INTO `pei_article`
VALUES (11, 'Spring Boot——一种Java的框架',
        '## 一、Spring\r\n\r\n### 1、`IoC`容器\r\n\r\n#### 1）容器的概念\r\n\r\n容器是为某些特定组件对象提供必要支持的一个软件环境。他提供了一些底层服务，让容器所承载的对象不必在考虑这些问题。Tomcat就是一个Servlet容器，底层实现了TCP连接，解析HTTP协议等非常复杂的服务。我们自己就无需在组件中编写这些复杂的逻辑。IoC容器它可以管理所有轻量级的JavaBean组件，提供的底层服务包括组件的生命周期管理、配置和组装服务、AOP支持，以及建立在AOP基础上的声明式事务服务等。\r\n\r\n#### 2）控制反转IoC\r\n\r\n`IoC`意为控制反转（Inversion of Control），对程序中对象的创建、配置这样的控制权由应用程序转移到了`IoC`容器，那对于某个具体的实例对象它的所有组件对象不再由应用程序自己创建和配置，而是通过`IoC`容器负责。这样应用程序能够直接使用已经创建并配置好的组件。\r\n\r\n在设计上`IoC`容器是一个无侵入的容器，应用程序的组件无需实现Spring的特定接口，那么这些组件即可以在spring容器中运行，又能够自己编写代码组装他所需要的对象。还有就是在测试的时候，也就不需要实现接口，不依赖与Spring容器，可单独测试。\r\n\r\n#### 3）依赖注入\r\n\r\n这些组件需要通过注入机制来装入到实例对象中，供实例对象使用。依赖注入的方式可以有两种，一种是通过`setXXX()`方法注入，另一种是通过构造方法实现。Spring的IoC容器同时支持属性注入和构造方法注入，并允许混合使用。\r\n\r\n因为`IoC`容器需要负责实例化所有组件对象，所以需要告诉容器如何创建组件对象，以及各个组件对象之间的依赖关系，即装配方式。在Spring可以通过两种方式实现，一种是XML配置文件，另一种是通过注解。\r\n\r\n#### 4）组件装配\r\n\r\n##### I   通过XML装配组件\r\n\r\n我们需要自己将组件之间的依赖关系描述出来，然后交给容器来创建并装配。\r\n\r\n**第一步 编写配置文件application.xml**\r\n\r\n我们需要编写一个特定的名叫application的配置文件`application.xml`告诉Spring容器应该如何创建、并按顺序正确的注入到相应的组件中。Bean表示这是一个Java Bean或者说是一个组件。id唯一标识了一个Java Bean，class提供了文件路径。每个Java Bean内部可以有一个或多个需要注入的属性，以property标签表示。而这些属性也是一个Java Bean，name表示在这个组件内部这个需要注入的属性的名称是什么。ref表示这个需要注入的属性所指向的Java Bean的id。这些Java Bean在配置文件的相对位置并不重要，但是每个组件中要注入的属性需要写全，不写全的画spring会漏掉注入该属性。如果注入的不是Java Bean那么将ref改为value。\r\n\r\n总结来说，Java Bean通过引用注入，数据类型通过value注入。\r\n\r\n```xml\r\n<bean id=\"userService\" class=\"com.itranswarp.learnjava.service.UserService\">\r\n    <property name=\"mailService\" ref=\"mailService\" />			<!--引用注入-->\r\n    <property name=\"username\" value=\"root\" />				    <!--值注入-->\r\n    <property name=\"password\" value=\"password\" />\r\n</bean>\r\n```\r\n\r\n**第二步 在代码中加载配置文件**\r\n\r\n我们需要创建一个`Spring IoC`容器的实例，然后加载配置文件。接下来我们就可以从Spring容器中取出组件并使用它。Spring容器命名为应用程序上下文，就是`ApplicationContext`，它是一个接口，用来加载配置文件，有很多实现类。通过xml加载需要`ClassPathXmlApplicationContext`实现类来帮我们自动从项目路径下查找指定的配置文件，参数为配置文件名。通过注解加载需要`AnnotationConfigApplicationContext`实现类，参数为配置类名称，必须传入一个标注了`@Configuration`的类名。。\r\n\r\n##### II   通过注解装配组件\r\n\r\n见组件详解\r\n\r\n### 2、AOP\r\n\r\n在实际开发中有很多功能是许多组件通用的，但又是非核心的业务逻辑。让框架把一些很多个不同的组件之间通用的非核心的业务逻辑通过某种方法，织入到组件中。那么AOP要把切面即一些非核心、但又必要的逻辑织入核心逻辑中，我们在调用某个业务方法时，spring会对该方法进行拦截，并在拦截前后进行安全检查、日志、事务等处理。从而完成了整个业务流程。有3种方式实现。\r\n\r\n* 编译期，由编译器把切面（非核心的逻辑）编译进字节码。\r\n* 类加载器：当目标被装载到JVM时，通过一个特殊的类加载器，对目标类的字节码重新增强\r\n* 运行期：通过动态代理实现运行期动态织入。\r\n\r\nSpring的AOP实现就是基于JVM的动态代理，通过AOP技术，可以让我们把一些常用的功能如权限检查、日志、事务等，从每个业务方法中剥离出来。\r\n\r\n我们使用AOP非常简单，一共需要三步：\r\n\r\n1. 定义切入方法，并在方法上通过AspectJ的注解告诉Spring应该在何处调用此方法；\r\n2. 在需要切入方法的地方标记`@Component`和`@Aspect`；\r\n3. 在`@Configuration`类上标注`@EnableAspectJAutoProxy`。\r\n\r\n我们还可以通过自定义注解来切入功能。在那些需要切入这种常用的功能的方法头上，标记一个自定义注解，而在切入方法（常用的功能逻辑所在的方法）的AOP注解参数中填入该注解的名称，参数格式为`\"@annotation(your_annotation_name)\"`，那么只要标注了你自定义注解的地方，spring都会把切入方法切入到里面。\r\n\r\n## 二、Spring Web\r\n\r\n### 1、Controller层\r\n\r\n在MVC模式中，controller作为控制器，控制视图和模型之间的交流，使视图和模型分离开。在Web应用中，也是类似的概念，控制层接受前端发来的请求，交由对应的服务层处理，然后返回响应结果。在整个架构中，我们大致上可以把Controller看做是前端和后端交互的中介，由于前端发来的请求多种多样，后端负责处理这些请求的类以及方法也都不同，因此我们需要一个中间商，接收前端发来的请求，先对其进行简单的处理，识别该请求的意图，然后交由对应的方法去处理。Controller层因此有着承前启后的作用。\r\n\r\nHTTP请求分为请求行、请求头、请求体三部分。请求行中携带了请求方法、URL、HTTP协议版本。请求头中携带了HTTP请求的一些必要信息，而请求体中是请求所携带的数据。每一个请求向服务器请求的数据都不太一样，因此请求行、请求头、请求体中的内容也不太一样。服务器要根据这些请求返回不同的数据，首先就是要分辨这些请求到底是想请求什么。\r\n\r\nWeb应用中Controller负责接收HTTP请求，那么Controller层就需要对请求进行分析处理。分析HTTP请求的意图，然后交由Service层去处理。在Controller层中，我们有两大任务，获取请求信息、返回响应数据。为了处理好这两大任务，我们划分出以下几个步骤：\r\n\r\n1. 首先，请求是多种多样的，单一的Controller无法满足所有请求的要求。我们先把请求分类，不同的URL对应着不同种类的请求。URL是有层级的，我们可以对请求的种类再进一步细分。因此我们设置了不同的Controller类、不同的Controller方法、来处理不同种类的请求，这时候就需要**指定请求的映射规则**。\r\n2. 其次，对于同一类的请求，我们就具体的了解请求的数据是什么，那么我们就需要**获取请求参数**或者**获取请求体**，来进一步识别请求是想要获取哪些数据。\r\n3. 还有一点，对于服务器中某些私密的资源，我们不可能让任意的请求都能获取到，因此需要识别HTTP请求的身份，是否具有相关的权限去获取资源。那么我们就需要**获取请求头**。\r\n4. 如果上面的方法不能够满足我们需要的话，我们可以直接获取封装在一个对象中的HTTP请求的全部信息，这叫做**获取原生对象**。\r\n5. \r\n\r\n#### 1）指定请求映射规则\r\n\r\n@RequestMapping用于映射前端HTTP发来的Request请求，对于前端发来的不同请求，我们应该指定不同的Controller、不同的方法来处理。RequestMapping注解就是让我们设置HTTP请求映射到对应controller方法上的相关规则，比如说指定一个controller方法处理的请求路径、请求方式、请求参数等等一系列配置。施加@RequestMapping注解上配置的参数会限制HTTP请求映射到该方法上的范围。\r\n\r\n@RequestMapping注解参数说明\r\n\r\n| 参数         | 值       | 说明                                                         |\r\n| ------------ | -------- | ------------------------------------------------------------ |\r\n| name         | String   | 为该RequestMapping设置一个名字                               |\r\n| value / path | String[] | 指定接收的URI路径。支持Ant样式路径匹配方法，yml占位符如.`${path}` |\r\n| method       | emum[]   | 指定接收的请求方法。`public enum RequestMethod {GET,HEAD,POST,PATCH,DELETE,OPTIONS,TRACE}` |\r\n| params       | String[] | 指定接受的请求参数。只有HTTP请求带有对应的参数时，才会被该Controller处理，使用`!`表示不能具有该类请求。 |\r\n| header       | String[] | 指定接收的请求头。具有某些请求头或者某些请求头有特定的值，才会被该Controller处理，使用`!`表示不能具有该类请求头。 |\r\n| consumes     | String[] | 指定接收的请求内容类型Content-Type                           |\r\n| produces     | String[] | 指定从HTTP请求中发来的可接受响应的Content-Type               |\r\n\r\n注：\r\n\r\n1、注意到@RequestMapping可以使用在类上和方法上，在方法上的@RequestMapping会继承类上已有的设置。\r\n\r\n2、Ant样式路径匹配方法\r\n\r\n| 路径 | 说明                        | 实例                                                         |\r\n| ---- | --------------------------- | ------------------------------------------------------------ |\r\n| ?    | 匹配任意单个字符，不包含`/` | `/p?ttern`匹配该文件夹下符合该规则的的文件夹（不包含子文件夹） |\r\n| *    | 匹配0或者任意数量的字符     | `/*.jsp`匹配当前文件夹下任何JSP文件（不包含子文件夹）        |\r\n| **   | 匹配0或者更多的目录         | `/**/*.jsp`匹配该文件夹及其子文件夹任何JSP文件               |\r\n\r\n#### 2）获取请求参数\r\n\r\n##### 获取路径参数\r\n\r\n@PathVariable用来获取通过URL路径传递的请求参数，通常添加在Controller方法的参数中，Controller方法所映射的路径中需要写明通过路径传递了哪些参数。@PathVariable注解参数有两个，分别是value：映射请求路径参数，required：请求路径参数是否必须\r\n\r\n```java\r\n@RequestMapping(\"/user/{id}/{name}\")\r\npublic String findUser(@PathVariable(\"id\")  Integer id,\r\n                       @PathVariable(\"name\") String name){\r\n    // TODO\r\n}\r\n```\r\n\r\n##### 获取请求体中JSON格式参数\r\n\r\n@RequestsBody用来获取请求体中的JSON数据，并将JSON数据转化为JAVA对象，需要JSON数据属性名和JAVA对象变量名一一对应，才回将数据传递到Java对象中，否则无法获取对应的请求数据。\r\n\r\n注意：使用@RequestsBody获取请求体数据，需要请求头中的 Content-Type 值为application/json否则会无法获取。\r\n\r\n##### 获取QueryParameter格式参数\r\n\r\n@RequestParam用于获取QueryParameter格式参数。类似于`URI?name1=value1&name2=value2`格式在URL上传输的参数叫做QueryParameter格式参数，默认情况下，Controller映射到的请求参数都是QueryParameter类型的参数，且需要请求中参数名和Controller方法中变量名一一对应，才能映射成功。\r\n\r\n**总结：**通过`@RequestsBody`和`@RequestParam`两个注解，我们可以直接单独获取每一个请求参数，也可以将参数封装到自定义实体对象中，实体类中的成员变量要和请求参数名对应上。并且要提供对应的set/get方法。\r\n\r\n##### `@RequestsBody`和`@RequestParam`注解的其他属性\r\n\r\n| 属性         | 值      | 说明                                     |\r\n| ------------ | ------- | ---------------------------------------- |\r\n| required     | boolean | 请求参数是否必须传入                     |\r\n| defaultValue | String  | 如果没有传入对应请求参数，指定一个默认值 |\r\n\r\n##### 参数类型转换\r\n\r\n// TODO\r\n\r\n#### 3）获取请求头和cookie\r\n\r\n@RequestsHeader用于获取请求头信息，在注解中填写请求头名称我们就可以获取到对应请求头的值\r\n\r\n```java\r\n@Controller\r\npublic class RequestResponseController {\r\n    @RequestMapping(\"/getHeader\")\r\n    public String getHeader(@RequestHeader(value = \"device-type\") String deviceType){\r\n        System.out.println(deviceType);\r\n        return \"test\";\r\n    }\r\n}\r\n```\r\n\r\n @CookieValue用于获取cookie信息，使用方法和@RequestsHeader注解类似，在注解中填写cookie的名称我们就可以获取到对应cookie的值\r\n\r\n```java\r\n@Controller\r\npublic class RequestResponseController {\r\n    @RequestMapping(\"/getCookie\")\r\n    public String getCookie(@CookieValue(\"JSESSIONID\") String sessionId){\r\n        System.out.println(sessionId);\r\n        return \"test\";\r\n    }\r\n}\r\n```\r\n\r\n#### 4）获取原生对象\r\n\r\n我们之前使用servlet的时候，Controller获取的是request对象，response，session对象等。SpringMVC帮助我们简化了对请求信息的处理，因此我们可以通过一些注解直接获取到我们想要的信息。但是SpringMVC中也提供了获取这些原生对象的方法，只需要在方法上添加对应类型的参数就行。SpringMVC会把我们需要的对象传给我们的形参。不过这时候我们就需要使用servlet的API来处理这些数据，会稍显繁琐和麻烦。通常在我们需要设置响应头或者进行文件传输时会获取原生的对象，数据传输只需要写入响应体就可以了。\r\n\r\n```java\r\n@Controller\r\npublic class RequestResponseController {\r\n    @RequestMapping(\"/getReqAndRes\")\r\n    public String getReqAndRes(HttpServletRequest request, HttpServletResponse response, HttpSession session){\r\n        return \"test\";\r\n    }\r\n}\r\n```\r\n\r\n#### 5）设置返回响应体\r\n\r\n我们通过添加@ResponseBody注解就可以返回JSON格式的响应体，springMVC会为我们自动将Java对象转化为JSON\r\n\r\n#### 6）文件传输\r\n\r\n##### 文件上传\r\n\r\nHTTP请求需要满足条件：1、请求方式为POST。2、请求头Content-Type为multipart/form-data\r\n\r\nSpringMVC接收文件：需要Controller方法中的参数为MutipartFile类型的。该类型有以下几种常见的方法\r\n\r\n| 方法 | 说明 |\r\n| ---- | ---- |\r\n|      |      |\r\n\r\n##### 文件下载\r\n\r\nSpringMVC封装HTTP响应需要的条件：1、设置响应头的Content-Type属性为对应文件的MIME类型。2、设置响应头的Content-Disposition。3、文件数据以二进制形式写入响应体中。\r\n\r\n### 2、拦截器\r\n\r\n\r\n\r\n![image-20220426221837696](E:\\StudyDoc\\同步空间\\4.阅读笔记\\图片\\image-20220426221837696.png)\r\n\r\n\r\n\r\n### 3、异常处理\r\n\r\nSpringMVC为我们提供了注解@ControllerAdvice声明一个类为spring管理的一个组件，可以为特定的Controller添加“通知”。是AOP原理的实现，也就是说将@ControllerAdvice中声明的方法织入到Controller中。\r\n\r\n@ExceptionHandler用于捕获Controller中抛出的异常，与@ExceptionHandler注解配合，我们可以通过自定义的拦截规则在Controller发生异常之后进行拦截，在拦截之后，我们转而通过自定义的方法来继续拦截后的处理，从而返回给前端自定义的异常信息。\r\n\r\n默认情况下，@ControllerAdvice会在发生异常后拦截所有的Controller然后进行处理。@RestControllerAdvice会将返回值写入响应体中，相当于@ControllerAdvice + @ResponseBody 。总结来说可以通过@ControllerAdvice和@ExceptionHandler实现全局的异常处理。\r\n\r\n```java\r\n@ControllerAdvice\r\npublic class MyControllerAdvice {\r\n    @ExceptionHandler({NullPointerException.class,ArithmeticException.class})\r\n    @ResponseBody\r\n    public Result handlerException(Exception ex){\r\n        Result result = new Result();\r\n        result.setMsg(ex.getMessage());\r\n        result.setCode(500);\r\n        return result;\r\n    }\r\n}\r\n\r\n```\r\n\r\n### 4、SpringMVC执行流程\r\n\r\n1. 用户发起请求被DispatchServlet所处理\r\n2. DispatchServlet通过HandlerMapping根据HTTP请求内容查找能够处理这个请求的Handler（Controller）。HandlerMapping就是用来处理HTTP请求和处理方法之间的映射关系\r\n3. HandlerMapping返回一个能够处理请求的执行链给DispatchServlet，包含了Handler方法和拦截器\r\n4. HandlerAdapter执行对应的Handler方法，把HTTP请求数据转换成合适的类型，作为Handler的方法参数传入\r\n5. Handler方法执行完成之后的返回值被放到响应体中，然后返回给DispatchServlet，然后发送响应数据\r\n\r\n## 三、SpringBoot\r\n\r\n\r\n\r\n## 四、Druid\r\n\r\n\r\n\r\n## 五、Mybatis\r\n\r\n### 1、介绍\r\n\r\n![mybatis架构](E:\\StudyDoc\\同步空间\\4.阅读笔记\\图片\\mybatis-1.png)\r\n\r\n我们把mybatis的功能架构分为了三层：\r\n\r\n1. 接口层：提供给程序员调用的接口API，程序员通过这些API来操作数据库，接口层收到调用请求就会转而调用数据处理层来完成具体的数据处理。\r\n2. 数据处理层：负责对具体的从参数映射、SQL语句的解析、执行、以及执行结果的映射处理等，主要的作用就是根据调用的请求完成一次数据库的操作。\r\n3. 基础支撑层：负责最基础的功能支撑，包括连接池管理、事务管理、配置的加载、缓存处理。这些都是进行数据库查询通用的东西，我们把他从数据库操作中抽取出来作为最基本的组件，为上层的数据处理层提供最基础的支撑。\r\n\r\n最后是引导层，引导层不参与SQL语句的处理，它只是为了在应用程序中配置mybatis的各种功能如何去运行。\r\n\r\n### 2、总体框架设计\r\n\r\n#### 1）接口层\r\n\r\n接口层是mybatis提供给程序员调用的应用程序接口，我们通过接口层就可以方便的调用数据库获取数据。目前mybatis提供两种方式与数据库进行交互。\r\n\r\n* 创建SqlSession对象。第一种是创建一个SQL语句会话对象（SqlSession）使用该对象完成对数据库的交互，该对象内部维护了与数据库的连接，提供了与数据库进行增删改查操作的方法。\r\n* 使用Mapper接口。第二种是通过接口调用的方式，mybatis中应用程序的某个对象与数据库某个表连接的桥梁是通过mapper映射实现的，配置文件中的每一个mapper结点都对应着一个mapper接口。接口中的每一个方法对应这配置文件中每一条SQL语句。我们在配置好以后，mybatis会根据相应的接口方法通过动态代理生成一个mapper实例，我们在调用mapper接口的某一个方法的时候，mybatis会根据这个方法的名称还有参数类型，确定SQL语句，实现对数据库的操作。\r\n\r\n#### 2）数据处理层\r\n\r\n我们在Java中调用这些对数据库增删改查方法的时候，会传入一些参数，这些参数可能是具体要存的数据，或者是其他的东西，mybatis的数据处理层所要实现的功能就是从这里展开的，主要完成两个功能\r\n\r\n* 一是通过传入的参数构建动态的SQL语句\r\n* 二是执行对应的SQL语句并封装查询结果映射到Java对象中。\r\n\r\n#### 3）框架支撑层\r\n\r\n框架支撑层，负责数据库查询中一些通用的东西，主要有以下几点内容\r\n\r\n* 事务管理机制：\r\n* 连接池管理机制：\r\n* 缓存机制：为了减少数据库的压力，提高数据利用率，mybatis会对一些查询结果缓存到本地中，在一定的时间间隔内多次的同一查询，mybatis会直接返回缓存的内容，而不会再去数据库中查找。\r\n* SQL语句的配置方式：Java程序中SQL语句配置方式有两种，一种是通过XML来配置，另一种是在mapper接口上使用注解来配置。这个功能就是为了识别并处理两种不同的配置方式而存在的。\r\n\r\n### 3、实现功能的层次结构\r\n\r\n1. 我们使用mybatis查询数据库，首先就是要创建一个SQL会话对象，也就是SqlSession，创建完成之后，就开启了一个与数据库的连接会话，我们可以通过这个对象，来执行SQL语句、提交或者回滚事务。\r\n2. 但是实际上出于分离职责、防止一个对象身兼太多职责，SqlSession只是执行数据库查询的第一层对象，它会紧接着调用Executor对象，这个对象会负责SQL动态语句的生成，对查询出来的结果进行缓存，对这些结果进行维护，定期删除等。\r\n3. 其次是语句处理器对象，由于Java程序在底层与数据库的交互是通过JDBC实现的，mybatis是在JDBC的基础上做出了进一步的封装。因此语句处理器对象StatementHandler主要负责与JDBC语句之间的交互。设置语句参数，将返回的结果映射到Java对象。\r\n4. 接下来就是JDBC层，是真正负责查询数据库的东西。\r\n\r\n![实现功能而层次结构](E:\\StudyDoc\\同步空间\\4.阅读笔记\\图片\\mybatis-2.png)\r\n\r\n### 4、mybatis初始化\r\n\r\n我们如果想要在自己的程序中引入一个插件或者是框架，单单只把软件包导入进来是没有作用的，我们要在程序中使用它就需要进行一系列的配置，就比如Java的那些内置工具，他就在那但我们不能直接使用，我们调用的时候新建该对象，需要传入一些参数。类比到框架的初始化及配置上，就是这个道理。\r\n\r\nmybatis初始化的方式主要有两种：一种是通过XML配置。第二种是基于Java的API\r\n\r\n#### 1）XML配置初始化\r\n\r\n#### 2）Java的API初始化\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n## 六、Mybatis Plus\r\n\r\n### 1、在项目中引入Mybatis Plus\r\n\r\n* 第一步，添加相应依赖\r\n* 第二步，需要在 Spring Boot 启动类中添加 `@MapperScan` 注解，扫描 Mapper 文件夹\r\n* 第三步，编写 Mapper 包下的接口，继承Mybatis Plus提供的`BaseMapper<T>`\r\n\r\n默认情况下，Mybatis Plus 实体类有如下的映射关系：\r\n\r\n| 映射关系                       | 说明                                                      |\r\n| ------------------------------ | --------------------------------------------------------- |\r\n| 下划线映射为实体类的驼峰式命名 | 表名：st_user -> stUser 类。字段名：real_name -> realName |\r\n| 数据表主键名为 id              | 插入数据时会自增，不需要我们进行指定                      |\r\n| 字段名与实体类属性一一对应     |                                                           |\r\n\r\n对应注解\r\n\r\n| 注解        | 说明                         |\r\n| ----------- | ---------------------------- |\r\n| @TableName  | 表名注解，标识实体类对应的表 |\r\n| @TableId    | 主键注解，用于实体类主键字段 |\r\n| @TableField | 非主键的字段注解             |\r\n\r\n## 七、Spring操作Redis\r\n\r\nSpring通过模板方式提供了对Redis的数据查询和操作功能。\r\n\r\nRedisTemplate就是在一个方法中定义了一个算法的骨架，但是把进一步的步骤延迟到子类去实现，模板方法使得子类可以在不改变算法结构的情况下，重新定义算法的某些步骤。\r\n\r\nRedisTemplate对Redis中的物种基础类型，分别提供了五个子类进行操作。\r\n\r\n```java\r\nValueOperations valueOperations = redisTemplate.opsForValue();\r\nHashOperations valueOperations = redisTemplate.opsForHash();\r\nListOperations valueOperations = redisTemplate.opsForList();\r\nSetOperations valueOperations = redisTemplate.opsForSet();\r\nZsetOperations valueOperations = redisTemplate.opsForZset();\r\n\r\n```\r\n\r\n\r\n\r\n## 八、ElasticSearch\r\n\r\n\r\n\r\n## 九、Mongodb\r\n\r\n\r\n\r\n##  十、Lombok\r\n\r\n| 注解                     | 说明                                                         |\r\n| ------------------------ | ------------------------------------------------------------ |\r\n| @Slf4j                   | 自动生成该类的log静态常量                                    |\r\n| @Log4j2                  | 注解在类上。为类提供一个 属性名为log 的 log4j 日志对象，和@Log4j注解类似。 |\r\n| @Setter                  | 注解在属性上，为属性提供setter方法。注解在类上，为所有属性添加setter方法 |\r\n| @Getter                  | 注解在属性上，为属性提供getter方法。注解在类上，为所有属性添加getter方法 |\r\n| @EqualsAndHashCode       |                                                              |\r\n| @RequiredArgsConstructor |                                                              |\r\n| @NoArgsConstructor       |                                                              |\r\n| @AllArgsConstructor      |                                                              |\r\n| @NotNull                 |                                                              |\r\n| @NullAble                |                                                              |\r\n| @ToString                |                                                              |\r\n| @Value                   | 所有变量为final，等同于添加@Getter @ToString @EqualsAndHashCode @RequiredArgsConstructor |\r\n| @Data                    | 等同于添加@Getter/@Setter @ToString @EqualsAndHashCode @RequiredArgsConstructor |\r\n| @Builder                 | 自动生成流式 set 值写法                                      |\r\n\r\n注：@EqualsAndHashCode默认情况下，会使用所有非瞬态(non-transient)和非静态(non-static)字段来生成equals和hascode方法，也可以指定具体使用哪些属性。如果某些变量不想加入判断通过exclude排除，或者使用of指定使用某些字段\r\n\r\n## 十一、Swagger\r\n\r\n### 1、SpringBoot集成Swagger\r\n\r\n1. 添加对应的依赖\r\n2. 新建一个配置类，添加@EnableSwagger2和@Configuration注解，打开并自定义配置Swagger\r\n3. 通过`http://项目IP:端口/swagger-ui.html`访问API接口文档\r\n\r\n[附：SpringBoot集成Swagger详细教程](http://www.imooc.com/wiki/swaggerlesson/springbootswagger.html)\r\n\r\n### 2、常用注解\r\n\r\nSwagger是为了解决企业中接口（api）中定义统一标准规范的文档生成工具。可以通过在代码中添加Swagger的注解来生成统一的API接口文档。注解主要有以下几种：\r\n\r\n| 注解名称           | 使用地方         | 说明                          |\r\n| ------------------ | ---------------- | ----------------------------- |\r\n| @Api               | 类               | 描述后端API接口类级别上的说明 |\r\n| @ApiOperation      | 方法             | 描述后端API接口的信息         |\r\n| @ApiParam          | 方法、参数、字段 | 对方法、参数添加元数据        |\r\n| @ApiModel          | 类               | 对类进行说明                  |\r\n| @ApiModelPropery   | 方法、字段       | 对类的属性说明                |\r\n| @ApiIgnore         | 类、方法、参数   | Swagger将会忽略这些           |\r\n| @ApiImplicitParam  | 方法             | 单独请求的参数                |\r\n| @ApiImplicitParams | 方法             |                               |\r\n\r\n| 注解参数    | 类型     | 默认值 | 涉及注解      | 说明                 |\r\n| ----------- | -------- | ------ | ------------- | -------------------- |\r\n| value       | String   |        |               | 描述接口用途         |\r\n| tags        | String[] |        |               | 接口分组             |\r\n| notes       | String   |        | @ApiOpreation | 对接口做出进一步描述 |\r\n| httpMethod  | String   |        | @ApiOpreation | 接口请求方法         |\r\n| nickname    | String   |        | @ApiOpreation | 接口别名             |\r\n| protocols   | String   |        |               | 接口使用的网络协议   |\r\n| hidden      | Boolean  |        |               | 是否隐藏该接口       |\r\n| code        | int      |        | @ApiOpreation | 接口返回状态码       |\r\n| description |          |        | @Api          |                      |\r\n| produces    |          |        | @Api          |                      |\r\n| consumes    |          |        | @Api          |                      |\r\n\r\n### 3、Swagger配置\r\n\r\n创建Swagger的配置代码如下：\r\n\r\n```java\r\n@EnableSwagger2\r\n@Configuration\r\npublic Class Swagger2Config{\r\n    @Bean\r\n    public Docket createApiDoc(){\r\n        return new Docket(DocumentationType.SWAGGER_2)\r\n            .apiInfo(apiInfo())\r\n            .select()\r\n            .apis(RequestHandlerSelector.basePackage(\"your_package_name\"))\r\n            .paths(PathSelectors.any())\r\n            .build();\r\n    }\r\n    private ApiInfo apiInfo(){\r\n        return new ApiInfoBuilder()\r\n            .title()\r\n            .description()\r\n            .version()\r\n            .build();\r\n    }\r\n}\r\n```\r\n\r\n| 方法名      | 描述            |\r\n| ----------- | --------------- |\r\n| title       | 填写API文档标题 |\r\n| description | 填写API文档描述 |\r\n| version     | 填写API文档版本 |\r\n| bulid       | 创建ApiInfo实例 |\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n## 附录\r\n\r\n### 1、Spring注解详解\r\n\r\n#### 1）配置类注解\r\n\r\n| 注解                     | 说明                                                         |\r\n| ------------------------ | ------------------------------------------------------------ |\r\n| @SpringBootApplication   | 声明让Spring Boot自动给程序进行必要的配置，等同于@Configuration ，@EnableAutoConfiguration 和 @ComponentScan 三个配置。 |\r\n| @Configuration           | 说明这是一个配置类                                           |\r\n| @EnableAutoConfiguration | Spring Boot自动配置，尝试根据你添加的jar依赖自动配置你的Spring应用。 |\r\n| @ComponentScan           | 自动搜索当前类所在的包以及子包，把所有标注为需要装配的的Bean自动创建出来。默认会装配标识了@Controller，@Service，@Repository，@Component注解的类到spring容器中。如果通过注解实现装配组件，这个配置类需要位于项目的根目录，让Spring明白在哪里扫描。以便扫描到整个项目的组件类 |\r\n| @Import                  | 引入带有@Configuration的java类。                             |\r\n| @ImportResourse          | 引入spring配置文件 applicationContext.xml                    |\r\n\r\n注：@Configuration注解的配置类有如下要求：\r\n\r\n1. @Configuration不可以是final类型；\r\n2. @Configuration不可以是匿名类；\r\n3. 嵌套的configuration必须是静态类。\r\n\r\n#### 2）组件注解\r\n\r\n| 注解           | 说明                                                         |\r\n| -------------- | ------------------------------------------------------------ |\r\n| @Component     | 说明这是一个交给Spring保管的JAVA Bean。泛指各种组件。        |\r\n| @Bean          | 产生一个Bean对象，将它交给spring管理，产生方法只会调用一次。 |\r\n| @Scope         | 声明一个原型（Prototype）的Bean时，需要添加一个额外的`@Scope`注解 |\r\n| @Order         | 指明注入的Bean的顺序                                         |\r\n| @PostConstruct | 定义组件初始化时运行的方法                                   |\r\n| @PreDestroy    | 定义组件销毁前运行的方法                                     |\r\n\r\n注：@Bean属性说明\r\n\r\n属性有：value、name、autowire、initMethod、destroyMethod。\r\n\r\n* name 和 value 两个属性是相同的含义的， 在代码中定义了别名。为 bean 起一个名字，如果默认没有写该属性，那么就使用方法的名称为该 bean 的名称。\r\n\r\n* autowire指定 bean 的装配方式， 根据名称 和 根*[欢迎转载听雨的人博客]*据类型 装配， 一般不设置，采用默认即可。autowire指定的装配方式 有三种Autowire.NO (默认设置)、Autowire.BY_NAME、Autowire.BY_TYPE。\r\n\r\n* initMethod和destroyMethod指定bean的初始化方法和销毁方法， 直接指定方法名称即可，不用带括号。\r\n\r\n#### 3）注入注解\r\n\r\n| 注解       | 说明                                                 |\r\n| ---------- | ---------------------------------------------------- |\r\n| @Resource  | 按名称注入                                           |\r\n| @Autowired | 按类型注入                                           |\r\n| @Inject    | 按类型注入                                           |\r\n| @Value     | 将常量、配置文件中的值、其他bean的属性值注入到变量中 |\r\n\r\n##### @Resource\r\n\r\n需要JAVA Bean注入时使用，可以写到字段和setter方法上，选其一即可。Resource默认按照名称自动注入，属性 name 解析为bean的名字，type解析为bean的类型。注入规则如下：\r\n\r\n- 如果同时指定了name和type，则从Spring上下文中找到唯一匹配的bean进行装配，找不到则抛出异常。\r\n- 如果指定了name，则从上下文中查找名称（id）匹配的bean进行装配，找不到则抛出异常。\r\n- 如果指定了type，则从上下文中找到类似匹配的唯一bean进行装配，找不到或是找到多个，都会抛出异常。\r\n- 如果既没有指定name，又没有指定type，则自动按照byName方式进行装配；如果没有匹配，则回退为一个原始类型进行匹配，如果匹配则自动装配。\r\n\r\n##### @Autowired\r\n\r\n需要JAVA Bean注入时使用，可以写到字段和setter方法上，选其一即可。但是`Autowired`只按类型注入，默认情况下要求依赖的对象必须存在，如果允许null值，需要设置属性required=false，如果需要按名称来装配，需要和@Qualifier注解一起使用。\r\n\r\n##### @Inject\r\n\r\n需要JAVA Bean注入时使用，可以作用在变量、setter方法、构造函数上。默认根据类型type进行自动装配的，如果需要按名称进行装配，则需要配合@Named。\r\n\r\n##### @Value\r\n\r\n通过注解将常量、配置文件中的值、其他bean的属性值注入到变量中，作为变量的初始值。bean属性、系统属性、表达式注入，使用@Value(\"#{}\")。bean属性注入*[Power By听雨的人]*需要注入者和被注入者属于同一个IOC容器，或者父子IOC容器关系，在同一个作用域内。配置文件属性注入@Value*[Power By听雨的人]*(\"${}\")\r\n\r\n#### 4）MVC注解\r\n\r\n| 注解               | 说明                                                         |\r\n| ------------------ | ------------------------------------------------------------ |\r\n| @Controller        | 负责处理由DispatcherServlet 分发的请求，把用户请求的数据经过处理封装成一个模型，然后再把这个模型返回给对应的视图进行展示。Controller 不会直接依赖于HttpServletRequest 和HttpServletResponse 等HttpServlet 对象，它们可以通过Controller 的方法参数灵活的获取到。 |\r\n| @Service           | 修饰MVC中Service层的组件                                     |\r\n| @Repository        | 注解DAO层（Mapper层）                                        |\r\n| @RequestBody       | 修饰返回的数据，当返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用。 |\r\n| @RestController    | 相当于@Controller和@ResponseBody                             |\r\n| @RequestMapping    | 是用来处理请求地址映射的注解，可以用于类或者方法上。用在类上表示类中所有响应请求的方法都是以该地址作为父路径。一共有六个属性。 |\r\n| @RequestParam      | 获取前端请求传来的参数，有三个属性：defaultValue 表示设置默认值，required 通过boolean设置是否是必须要传入的参数，value 值表示接受的传入的参数类型。 |\r\n|                    |                                                              |\r\n| @ModelAttribute    |                                                              |\r\n| @SessionAttributes |                                                              |\r\n| @PathVarible       |                                                              |\r\n\r\n注：@RequestMapping的六个属性\r\n\r\n1. value：指定请求的实际地址（默认属性）\r\n2. method：指定请求的类型，GET POST DELETE PUT\r\n3. consumes：指定处理请求的Content-Type(内容类型)\r\n4. produces：指定返回的内容类型，仅当请求包含该类型时才回返回相应的数据\r\n5. params：指定请求必须包含某些参数值才会处理该请求\r\n6. headers：指定请求必须包含某些指定的header值才会处理该请求\r\n\r\n#### 5）AOP切面注解\r\n\r\nSpring支持AspectJ的注解式aop编程，需要在java的配置类中使用@EnableAspectJAutoProxy注解开启Spring对AspectJ代理的支持。\r\n\r\n| 注解                   | 说明                                                         |\r\n| ---------------------- | ------------------------------------------------------------ |\r\n| @EnableAspectAutoProxy | 开启Aspect代理，使用AOP注解必备                              |\r\n| @Aspect                | 声明一个切面类，该类中的方法都会在合适的时机中插入到需要该方法的地方，方法也需要注解标识 |\r\n| @Before                | 在指定方法执行前执行此方法，需要在注解参数中传入指定方法全名 |\r\n| @After                 | 在指定方法执行后执行此方法                                   |\r\n| @AfterRunning          | 在方法返回结果后执行此方法                                   |\r\n| @AfterThrowing         | 在方法抛出异常后执行此方法                                   |\r\n| @Around                | 围绕着方法执行                                               |\r\n| @PointCut              |                                                              |\r\n\r\n## ',
        '学好Java就来看看这个哦', 1, 'https://wx4.sinaimg.cn/mw1024/c44b7d4aly1h60ktjod5qj20u0140acz.jpg', '0', '0', 0,
        '1', 14787164048663, '2022-09-10 10:20:12', NULL, NULL, 0);

-- ----------------------------
-- Table structure for pei_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `pei_article_tag`;
CREATE TABLE `pei_article_tag`
(
    `article_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章id',
    `tag_id`     bigint NOT NULL DEFAULT 0 COMMENT '标签id',
    PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_article_tag
-- ----------------------------
INSERT INTO `pei_article_tag`
VALUES (1, 4);
INSERT INTO `pei_article_tag`
VALUES (2, 1);
INSERT INTO `pei_article_tag`
VALUES (2, 4);
INSERT INTO `pei_article_tag`
VALUES (3, 4);
INSERT INTO `pei_article_tag`
VALUES (3, 5);
INSERT INTO `pei_article_tag`
VALUES (8, 6);

-- ----------------------------
-- Table structure for pei_category
-- ----------------------------
DROP TABLE IF EXISTS `pei_category`;
CREATE TABLE `pei_category`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT,
    `name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
    `pid`         bigint                                                        NULL DEFAULT -1 COMMENT '父分类id，如果没有父分类为-1',
    `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '状态0:正常,1禁用',
    `create_by`   bigint                                                        NULL DEFAULT NULL,
    `create_time` datetime                                                      NULL DEFAULT NULL,
    `update_by`   bigint                                                        NULL DEFAULT NULL,
    `update_time` datetime                                                      NULL DEFAULT NULL,
    `del_flag`    int                                                           NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_category
-- ----------------------------
INSERT INTO `pei_category`
VALUES (1, 'java', -1, 'wsd', '0', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pei_category`
VALUES (2, 'PHP', -1, 'wsd', '0', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pei_category`
VALUES (3, '日常', -1, '无聊啦，枯燥啦', '0', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for pei_comment
-- ----------------------------
DROP TABLE IF EXISTS `pei_comment`;
CREATE TABLE `pei_comment`
(
    `id`                 bigint                                                        NOT NULL AUTO_INCREMENT,
    `type`               char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '评论类型（0代表文章评论，1代表友链评论）',
    `article_id`         bigint                                                        NULL DEFAULT NULL COMMENT '文章id',
    `root_id`            bigint                                                        NULL DEFAULT -1 COMMENT '根评论id',
    `content`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
    `to_comment_user_id` bigint                                                        NULL DEFAULT -1 COMMENT '所回复的目标评论的userid',
    `to_comment_id`      bigint                                                        NULL DEFAULT -1 COMMENT '回复目标评论id',
    `create_by`          bigint                                                        NULL DEFAULT NULL,
    `create_time`        datetime                                                      NULL DEFAULT NULL,
    `update_by`          bigint                                                        NULL DEFAULT NULL,
    `update_time`        datetime                                                      NULL DEFAULT NULL,
    `del_flag`           int                                                           NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 49
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_comment
-- ----------------------------
INSERT INTO `pei_comment`
VALUES (1, '0', 1, -1, 'asS', -1, -1, 1, '2022-01-29 07:59:22', 1, '2022-01-29 07:59:22', 0);
INSERT INTO `pei_comment`
VALUES (2, '0', 1, -1, '[哈哈]SDAS', -1, -1, 1, '2022-01-29 08:01:24', 1, '2022-01-29 08:01:24', 0);
INSERT INTO `pei_comment`
VALUES (3, '0', 1, -1, '是大多数', -1, -1, 1, '2022-01-29 16:07:24', 1, '2022-01-29 16:07:24', 0);
INSERT INTO `pei_comment`
VALUES (4, '0', 1, -1, '撒大声地', -1, -1, 1, '2022-01-29 16:12:09', 1, '2022-01-29 16:12:09', 0);
INSERT INTO `pei_comment`
VALUES (5, '0', 1, -1, '你再说什么', -1, -1, 1, '2022-01-29 18:19:56', 1, '2022-01-29 18:19:56', 0);
INSERT INTO `pei_comment`
VALUES (6, '0', 1, -1, 'hffd', -1, -1, 1, '2022-01-29 22:13:52', 1, '2022-01-29 22:13:52', 0);
INSERT INTO `pei_comment`
VALUES (9, '0', 1, 2, '你说什么', 1, 2, 1, '2022-01-29 22:18:40', 1, '2022-01-29 22:18:40', 0);
INSERT INTO `pei_comment`
VALUES (10, '0', 1, 2, '哈哈哈哈[哈哈]', 1, 9, 1, '2022-01-29 22:29:15', 1, '2022-01-29 22:29:15', 0);
INSERT INTO `pei_comment`
VALUES (11, '0', 1, 2, 'we全文', 1, 10, 3, '2022-01-29 22:29:55', 1, '2022-01-29 22:29:55', 0);
INSERT INTO `pei_comment`
VALUES (12, '0', 1, -1, '王企鹅', -1, -1, 1, '2022-01-29 22:30:20', 1, '2022-01-29 22:30:20', 0);
INSERT INTO `pei_comment`
VALUES (13, '0', 1, -1, '什么阿是', -1, -1, 1, '2022-01-29 22:30:56', 1, '2022-01-29 22:30:56', 0);
INSERT INTO `pei_comment`
VALUES (14, '0', 1, -1, '新平顶山', -1, -1, 1, '2022-01-29 22:32:51', 1, '2022-01-29 22:32:51', 0);
INSERT INTO `pei_comment`
VALUES (15, '0', 1, -1, '2222', -1, -1, 1, '2022-01-29 22:34:38', 1, '2022-01-29 22:34:38', 0);
INSERT INTO `pei_comment`
VALUES (16, '0', 1, 2, '3333', 1, 11, 1, '2022-01-29 22:34:47', 1, '2022-01-29 22:34:47', 0);
INSERT INTO `pei_comment`
VALUES (17, '0', 1, 2, '回复weqedadsd', 3, 11, 1, '2022-01-29 22:38:00', 1, '2022-01-29 22:38:00', 0);
INSERT INTO `pei_comment`
VALUES (18, '0', 1, -1, 'sdasd', -1, -1, 1, '2022-01-29 23:18:19', 1, '2022-01-29 23:18:19', 0);
INSERT INTO `pei_comment`
VALUES (19, '0', 1, -1, '111', -1, -1, 1, '2022-01-29 23:22:23', 1, '2022-01-29 23:22:23', 0);
INSERT INTO `pei_comment`
VALUES (20, '0', 1, 1, '你说啥？', 1, 1, 1, '2022-01-30 10:06:21', 1, '2022-01-30 10:06:21', 0);
INSERT INTO `pei_comment`
VALUES (21, '0', 1, -1, '友链添加个呗', -1, -1, 1, '2022-01-30 10:06:50', 1, '2022-01-30 10:06:50', 0);
INSERT INTO `pei_comment`
VALUES (22, '1', 1, -1, '友链评论2', -1, -1, 1, '2022-01-30 10:08:28', 1, '2022-01-30 10:08:28', 0);
INSERT INTO `pei_comment`
VALUES (23, '1', 1, 22, '回复友链评论3', 1, 22, 1, '2022-01-30 10:08:50', 1, '2022-01-30 10:08:50', 0);
INSERT INTO `pei_comment`
VALUES (24, '1', 1, -1, '友链评论4444', -1, -1, 1, '2022-01-30 10:09:03', 1, '2022-01-30 10:09:03', 0);
INSERT INTO `pei_comment`
VALUES (25, '1', 1, 22, '收到的', 1, 22, 1, '2022-01-30 10:13:28', 1, '2022-01-30 10:13:28', 0);
INSERT INTO `pei_comment`
VALUES (26, '0', 1, -1, 'sda', -1, -1, 1, '2022-01-30 10:39:05', 1, '2022-01-30 10:39:05', 0);
INSERT INTO `pei_comment`
VALUES (27, '0', 1, 1, '说你咋地', 1, 20, 14787164048662, '2022-01-30 17:19:30', 14787164048662, '2022-01-30 17:19:30',
        0);
INSERT INTO `pei_comment`
VALUES (28, '0', 1, 1, 'sdad', 1, 1, 14787164048662, '2022-01-31 11:11:20', 14787164048662, '2022-01-31 11:11:20', 0);
INSERT INTO `pei_comment`
VALUES (29, '0', 1, -1, '你说是的ad', -1, -1, 14787164048662, '2022-01-31 14:10:11', 14787164048662,
        '2022-01-31 14:10:11', 0);
INSERT INTO `pei_comment`
VALUES (30, '0', 1, 1, '撒大声地', 1, 1, 14787164048662, '2022-01-31 20:19:18', 14787164048662, '2022-01-31 20:19:18',
        0);
INSERT INTO `pei_comment`
VALUES (37, '0', 5, -1, '评论', -1, -1, 14787164048663, '2022-01-31 20:19:18', 14787164048662, '2022-01-31 20:19:18',
        0);
INSERT INTO `pei_comment`
VALUES (38, '0', 5, 37, '你说你有意思吗[可爱]', 14787164048663, 37, 14787164048663, '2022-01-31 20:19:18',
        14787164048662, '2022-01-31 20:19:18', 0);
INSERT INTO `pei_comment`
VALUES (39, '0', 1, 22, '嗯呢呢[可怜]', 1, 23, 14787164048663, '2022-01-31 20:19:18', 14787164048662,
        '2022-01-31 20:19:18', 0);
INSERT INTO `pei_comment`
VALUES (40, '0', 8, -1, '我是小沛，欢迎大家', -1, -1, 14787164048663, '2022-09-10 21:15:43', 14787164048663,
        '2022-09-10 21:15:43', 0);
INSERT INTO `pei_comment`
VALUES (41, '0', 8, -1, '我是小沛的小号[嘻嘻]', -1, -1, 14787164048664, '2022-09-10 23:54:51', 14787164048664,
        '2022-09-10 23:54:51', 0);
INSERT INTO `pei_comment`
VALUES (42, '0', 8, 40, '你好呀，小沛', 14787164048663, 40, 14787164048664, '2022-09-10 23:55:02', 14787164048664,
        '2022-09-10 23:55:02', 0);
INSERT INTO `pei_comment`
VALUES (43, '0', 8, -1, '嘿哈，欢迎大家', -1, -1, 14787164048663, '2022-09-11 10:28:15', 14787164048663,
        '2022-09-11 10:28:15', 0);
INSERT INTO `pei_comment`
VALUES (44, '0', 9, -1, '来了来了[嘻嘻]', -1, -1, 14787164048665, '2022-09-11 11:17:36', 14787164048665,
        '2022-09-11 11:17:36', 0);
INSERT INTO `pei_comment`
VALUES (45, '0', 8, -1, '小沛加油[鼓掌]', -1, -1, 14787164048666, '2022-09-11 12:42:29', 14787164048666,
        '2022-09-11 12:42:29', 0);
INSERT INTO `pei_comment`
VALUES (46, '0', 8, 45, '嘿嘿', 14787164048666, 45, 14787164048663, '2022-09-11 12:44:17', 14787164048663,
        '2022-09-11 12:44:17', 0);
INSERT INTO `pei_comment`
VALUES (47, '0', 8, -1, '路过[棒棒]', -1, -1, 14787164048667, '2022-09-28 22:50:53', 14787164048667,
        '2022-09-28 22:50:53', 0);
INSERT INTO `pei_comment`
VALUES (48, '0', 8, -1, '<script>alert(1)</script><h1>nihao</h1>', -1, -1, 14787164048663, '2022-11-09 17:31:56',
        14787164048663, '2022-11-09 17:31:56', 0);

-- ----------------------------
-- Table structure for pei_link
-- ----------------------------
DROP TABLE IF EXISTS `pei_link`;
CREATE TABLE `pei_link`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT,
    `name`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `logo`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `address`     varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网站地址',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '2' COMMENT '审核状态 (0代表审核通过，1代表审核未通过，2代表未审核)',
    `create_by`   bigint                                                        NULL DEFAULT NULL,
    `create_time` datetime                                                      NULL DEFAULT NULL,
    `update_by`   bigint                                                        NULL DEFAULT NULL,
    `update_time` datetime                                                      NULL DEFAULT NULL,
    `del_flag`    int                                                           NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '友链'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_link
-- ----------------------------
INSERT INTO `pei_link`
VALUES (1, 'sda',
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975',
        'sda', 'https://www.baidu.com', '1', NULL, '2022-01-13 08:25:47', NULL, '2022-01-13 08:36:14', 0);
INSERT INTO `pei_link`
VALUES (2, 'sda',
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975',
        'dada', 'https://www.qq.com', '1', NULL, '2022-01-13 09:06:10', NULL, '2022-01-13 09:07:09', 0);
INSERT INTO `pei_link`
VALUES (3, 'sa',
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975',
        'da', 'https://www.taobao.com', '1', NULL, '2022-01-13 09:23:01', NULL, '2022-01-13 09:23:01', 0);

-- ----------------------------
-- Table structure for pei_tag
-- ----------------------------
DROP TABLE IF EXISTS `pei_tag`;
CREATE TABLE `pei_tag`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT,
    `name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签名',
    `create_by`   bigint                                                        NULL DEFAULT NULL,
    `create_time` datetime                                                      NULL DEFAULT NULL,
    `update_by`   bigint                                                        NULL DEFAULT NULL,
    `update_time` datetime                                                      NULL DEFAULT NULL,
    `del_flag`    int                                                           NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pei_tag
-- ----------------------------
INSERT INTO `pei_tag`
VALUES (1, 'Mybatis', NULL, NULL, NULL, '2022-01-11 09:20:50', 0, 'weqwe');
INSERT INTO `pei_tag`
VALUES (2, 'asdas', NULL, '2022-01-11 09:20:55', NULL, '2022-01-11 09:20:55', 1, 'weqw');
INSERT INTO `pei_tag`
VALUES (3, 'weqw', NULL, '2022-01-11 09:21:07', NULL, '2022-01-11 09:21:07', 1, 'qweqwe');
INSERT INTO `pei_tag`
VALUES (4, 'Java', NULL, '2022-01-13 15:22:43', NULL, '2022-01-13 15:22:43', 0, 'sdad');
INSERT INTO `pei_tag`
VALUES (5, 'WAD', NULL, '2022-01-13 15:22:47', NULL, '2022-01-13 15:22:47', 0, 'ASDAD');
INSERT INTO `pei_tag`
VALUES (6, '休闲', NULL, '2022-01-13 15:22:47', NULL, '2022-01-13 15:22:47', 0, '休闲');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                  NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                                                     NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
    `is_frame`    int                                                     NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `menu_type`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   bigint                                                  NULL DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint                                                  NULL DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2028
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '菜单权限表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 0, '2021-11-12 10:46:19', 0, NULL,
        '系统管理目录', '0');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 0,
        '2021-11-12 10:46:19', 1, '2022-07-31 15:47:58', '用户管理菜单', '0');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 0,
        '2021-11-12 10:46:19', 0, NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 0,
        '2021-11-12 10:46:19', 0, NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu`
VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL,
        '', '0');
INSERT INTO `sys_menu`
VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 0, '2021-11-12 10:46:19', 0,
        NULL, '', '0');
INSERT INTO `sys_menu`
VALUES (2017, '内容管理', 0, 4, 'content', NULL, 1, 'M', '0', '0', NULL, 'table', NULL, '2022-01-08 02:44:38', 1,
        '2022-07-31 12:34:23', '', '0');
INSERT INTO `sys_menu`
VALUES (2018, '分类管理', 2017, 1, 'category', 'content/category/index', 1, 'C', '0', '0', 'content:category:list',
        'example', NULL, '2022-01-08 02:51:45', NULL, '2022-01-08 02:51:45', '', '0');
INSERT INTO `sys_menu`
VALUES (2019, '文章管理', 2017, 0, 'article', 'content/article/index', 1, 'C', '0', '0', 'content:article:list',
        'build', NULL, '2022-01-08 02:53:10', NULL, '2022-01-08 02:53:10', '', '0');
INSERT INTO `sys_menu`
VALUES (2021, '标签管理', 2017, 6, 'tag', 'content/tag/index', 1, 'C', '0', '0', 'content:tag:index', 'button', NULL,
        '2022-01-08 02:55:37', NULL, '2022-01-08 02:55:50', '', '0');
INSERT INTO `sys_menu`
VALUES (2022, '友链管理', 2017, 4, 'link', 'content/link/index', 1, 'C', '0', '0', 'content:link:list', '404', NULL,
        '2022-01-08 02:56:50', NULL, '2022-01-08 02:56:50', '', '0');
INSERT INTO `sys_menu`
VALUES (2023, '写博文', 0, 0, 'write', 'content/article/write/index', 1, 'C', '0', '0', 'content:article:writer',
        'build', NULL, '2022-01-08 03:39:58', 1, '2022-07-31 22:07:05', '', '0');
INSERT INTO `sys_menu`
VALUES (2024, '友链新增', 2022, 0, '', NULL, 1, 'F', '0', '0', 'content:link:add', '#', NULL, '2022-01-16 07:59:17',
        NULL, '2022-01-16 07:59:17', '', '0');
INSERT INTO `sys_menu`
VALUES (2025, '友链修改', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:edit', '#', NULL, '2022-01-16 07:59:44',
        NULL, '2022-01-16 07:59:44', '', '0');
INSERT INTO `sys_menu`
VALUES (2026, '友链删除', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:remove', '#', NULL, '2022-01-16 08:00:05',
        NULL, '2022-01-16 08:00:05', '', '0');
INSERT INTO `sys_menu`
VALUES (2027, '友链查询', 2022, 2, '', NULL, 1, 'F', '0', '0', 'content:link:query', '#', NULL, '2022-01-16 08:04:09',
        NULL, '2022-01-16 08:04:09', '', '0');
INSERT INTO `sys_menu`
VALUES (2028, '导出分类', 2018, 1, '', NULL, 1, 'F', '0', '0', 'content:category:export', '#', NULL,
        '2022-01-21 07:06:59', NULL, '2022-01-21 07:06:59', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '角色名称',
    `role_key`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`   int                                                     NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`   bigint                                                  NULL DEFAULT NULL COMMENT '创建者',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint                                                  NULL DEFAULT NULL COMMENT '更新者',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '0', '0', 0, '2021-11-12 10:46:19', 0, NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '0', '0', 0, '2021-11-12 10:46:19', 0, '2022-01-01 22:32:58', '普通角色');
INSERT INTO `sys_role`
VALUES (11, '嘎嘎嘎', 'aggag', 5, '0', '0', NULL, '2022-01-06 14:07:40', NULL, '2022-01-07 03:48:48', '嘎嘎嘎');
INSERT INTO `sys_role`
VALUES (12, '友链审核员', 'link', 1, '0', '0', NULL, '2022-01-16 06:49:30', NULL, '2022-01-16 08:05:09', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (0, 0);
INSERT INTO `sys_role_menu`
VALUES (2, 1);
INSERT INTO `sys_role_menu`
VALUES (2, 102);
INSERT INTO `sys_role_menu`
VALUES (2, 1013);
INSERT INTO `sys_role_menu`
VALUES (2, 1014);
INSERT INTO `sys_role_menu`
VALUES (2, 1015);
INSERT INTO `sys_role_menu`
VALUES (2, 1016);
INSERT INTO `sys_role_menu`
VALUES (2, 2000);
INSERT INTO `sys_role_menu`
VALUES (3, 2);
INSERT INTO `sys_role_menu`
VALUES (3, 3);
INSERT INTO `sys_role_menu`
VALUES (3, 4);
INSERT INTO `sys_role_menu`
VALUES (3, 100);
INSERT INTO `sys_role_menu`
VALUES (3, 101);
INSERT INTO `sys_role_menu`
VALUES (3, 103);
INSERT INTO `sys_role_menu`
VALUES (3, 104);
INSERT INTO `sys_role_menu`
VALUES (3, 105);
INSERT INTO `sys_role_menu`
VALUES (3, 106);
INSERT INTO `sys_role_menu`
VALUES (3, 107);
INSERT INTO `sys_role_menu`
VALUES (3, 108);
INSERT INTO `sys_role_menu`
VALUES (3, 109);
INSERT INTO `sys_role_menu`
VALUES (3, 110);
INSERT INTO `sys_role_menu`
VALUES (3, 111);
INSERT INTO `sys_role_menu`
VALUES (3, 112);
INSERT INTO `sys_role_menu`
VALUES (3, 113);
INSERT INTO `sys_role_menu`
VALUES (3, 114);
INSERT INTO `sys_role_menu`
VALUES (3, 115);
INSERT INTO `sys_role_menu`
VALUES (3, 116);
INSERT INTO `sys_role_menu`
VALUES (3, 500);
INSERT INTO `sys_role_menu`
VALUES (3, 501);
INSERT INTO `sys_role_menu`
VALUES (3, 1001);
INSERT INTO `sys_role_menu`
VALUES (3, 1002);
INSERT INTO `sys_role_menu`
VALUES (3, 1003);
INSERT INTO `sys_role_menu`
VALUES (3, 1004);
INSERT INTO `sys_role_menu`
VALUES (3, 1005);
INSERT INTO `sys_role_menu`
VALUES (3, 1006);
INSERT INTO `sys_role_menu`
VALUES (3, 1007);
INSERT INTO `sys_role_menu`
VALUES (3, 1008);
INSERT INTO `sys_role_menu`
VALUES (3, 1009);
INSERT INTO `sys_role_menu`
VALUES (3, 1010);
INSERT INTO `sys_role_menu`
VALUES (3, 1011);
INSERT INTO `sys_role_menu`
VALUES (3, 1012);
INSERT INTO `sys_role_menu`
VALUES (3, 1017);
INSERT INTO `sys_role_menu`
VALUES (3, 1018);
INSERT INTO `sys_role_menu`
VALUES (3, 1019);
INSERT INTO `sys_role_menu`
VALUES (3, 1020);
INSERT INTO `sys_role_menu`
VALUES (3, 1021);
INSERT INTO `sys_role_menu`
VALUES (3, 1022);
INSERT INTO `sys_role_menu`
VALUES (3, 1023);
INSERT INTO `sys_role_menu`
VALUES (3, 1024);
INSERT INTO `sys_role_menu`
VALUES (3, 1025);
INSERT INTO `sys_role_menu`
VALUES (3, 1026);
INSERT INTO `sys_role_menu`
VALUES (3, 1027);
INSERT INTO `sys_role_menu`
VALUES (3, 1028);
INSERT INTO `sys_role_menu`
VALUES (3, 1029);
INSERT INTO `sys_role_menu`
VALUES (3, 1030);
INSERT INTO `sys_role_menu`
VALUES (3, 1031);
INSERT INTO `sys_role_menu`
VALUES (3, 1032);
INSERT INTO `sys_role_menu`
VALUES (3, 1033);
INSERT INTO `sys_role_menu`
VALUES (3, 1034);
INSERT INTO `sys_role_menu`
VALUES (3, 1035);
INSERT INTO `sys_role_menu`
VALUES (3, 1036);
INSERT INTO `sys_role_menu`
VALUES (3, 1037);
INSERT INTO `sys_role_menu`
VALUES (3, 1038);
INSERT INTO `sys_role_menu`
VALUES (3, 1039);
INSERT INTO `sys_role_menu`
VALUES (3, 1040);
INSERT INTO `sys_role_menu`
VALUES (3, 1041);
INSERT INTO `sys_role_menu`
VALUES (3, 1042);
INSERT INTO `sys_role_menu`
VALUES (3, 1043);
INSERT INTO `sys_role_menu`
VALUES (3, 1044);
INSERT INTO `sys_role_menu`
VALUES (3, 1045);
INSERT INTO `sys_role_menu`
VALUES (3, 1046);
INSERT INTO `sys_role_menu`
VALUES (3, 1047);
INSERT INTO `sys_role_menu`
VALUES (3, 1048);
INSERT INTO `sys_role_menu`
VALUES (3, 1049);
INSERT INTO `sys_role_menu`
VALUES (3, 1050);
INSERT INTO `sys_role_menu`
VALUES (3, 1051);
INSERT INTO `sys_role_menu`
VALUES (3, 1052);
INSERT INTO `sys_role_menu`
VALUES (3, 1053);
INSERT INTO `sys_role_menu`
VALUES (3, 1054);
INSERT INTO `sys_role_menu`
VALUES (3, 1055);
INSERT INTO `sys_role_menu`
VALUES (3, 1056);
INSERT INTO `sys_role_menu`
VALUES (3, 1057);
INSERT INTO `sys_role_menu`
VALUES (3, 1058);
INSERT INTO `sys_role_menu`
VALUES (3, 1059);
INSERT INTO `sys_role_menu`
VALUES (3, 1060);
INSERT INTO `sys_role_menu`
VALUES (3, 2000);
INSERT INTO `sys_role_menu`
VALUES (11, 1);
INSERT INTO `sys_role_menu`
VALUES (11, 100);
INSERT INTO `sys_role_menu`
VALUES (11, 101);
INSERT INTO `sys_role_menu`
VALUES (11, 102);
INSERT INTO `sys_role_menu`
VALUES (11, 103);
INSERT INTO `sys_role_menu`
VALUES (11, 104);
INSERT INTO `sys_role_menu`
VALUES (11, 105);
INSERT INTO `sys_role_menu`
VALUES (11, 106);
INSERT INTO `sys_role_menu`
VALUES (11, 107);
INSERT INTO `sys_role_menu`
VALUES (11, 108);
INSERT INTO `sys_role_menu`
VALUES (11, 500);
INSERT INTO `sys_role_menu`
VALUES (11, 501);
INSERT INTO `sys_role_menu`
VALUES (11, 1001);
INSERT INTO `sys_role_menu`
VALUES (11, 1002);
INSERT INTO `sys_role_menu`
VALUES (11, 1003);
INSERT INTO `sys_role_menu`
VALUES (11, 1004);
INSERT INTO `sys_role_menu`
VALUES (11, 1005);
INSERT INTO `sys_role_menu`
VALUES (11, 1006);
INSERT INTO `sys_role_menu`
VALUES (11, 1007);
INSERT INTO `sys_role_menu`
VALUES (11, 1008);
INSERT INTO `sys_role_menu`
VALUES (11, 1009);
INSERT INTO `sys_role_menu`
VALUES (11, 1010);
INSERT INTO `sys_role_menu`
VALUES (11, 1011);
INSERT INTO `sys_role_menu`
VALUES (11, 1012);
INSERT INTO `sys_role_menu`
VALUES (11, 1013);
INSERT INTO `sys_role_menu`
VALUES (11, 1014);
INSERT INTO `sys_role_menu`
VALUES (11, 1015);
INSERT INTO `sys_role_menu`
VALUES (11, 1016);
INSERT INTO `sys_role_menu`
VALUES (11, 1017);
INSERT INTO `sys_role_menu`
VALUES (11, 1018);
INSERT INTO `sys_role_menu`
VALUES (11, 1019);
INSERT INTO `sys_role_menu`
VALUES (11, 1020);
INSERT INTO `sys_role_menu`
VALUES (11, 1021);
INSERT INTO `sys_role_menu`
VALUES (11, 1022);
INSERT INTO `sys_role_menu`
VALUES (11, 1023);
INSERT INTO `sys_role_menu`
VALUES (11, 1024);
INSERT INTO `sys_role_menu`
VALUES (11, 1025);
INSERT INTO `sys_role_menu`
VALUES (11, 1026);
INSERT INTO `sys_role_menu`
VALUES (11, 1027);
INSERT INTO `sys_role_menu`
VALUES (11, 1028);
INSERT INTO `sys_role_menu`
VALUES (11, 1029);
INSERT INTO `sys_role_menu`
VALUES (11, 1030);
INSERT INTO `sys_role_menu`
VALUES (11, 1031);
INSERT INTO `sys_role_menu`
VALUES (11, 1032);
INSERT INTO `sys_role_menu`
VALUES (11, 1033);
INSERT INTO `sys_role_menu`
VALUES (11, 1034);
INSERT INTO `sys_role_menu`
VALUES (11, 1035);
INSERT INTO `sys_role_menu`
VALUES (11, 1036);
INSERT INTO `sys_role_menu`
VALUES (11, 1037);
INSERT INTO `sys_role_menu`
VALUES (11, 1038);
INSERT INTO `sys_role_menu`
VALUES (11, 1039);
INSERT INTO `sys_role_menu`
VALUES (11, 1040);
INSERT INTO `sys_role_menu`
VALUES (11, 1041);
INSERT INTO `sys_role_menu`
VALUES (11, 1042);
INSERT INTO `sys_role_menu`
VALUES (11, 1043);
INSERT INTO `sys_role_menu`
VALUES (11, 1044);
INSERT INTO `sys_role_menu`
VALUES (11, 1045);
INSERT INTO `sys_role_menu`
VALUES (11, 2000);
INSERT INTO `sys_role_menu`
VALUES (11, 2003);
INSERT INTO `sys_role_menu`
VALUES (11, 2004);
INSERT INTO `sys_role_menu`
VALUES (11, 2005);
INSERT INTO `sys_role_menu`
VALUES (11, 2006);
INSERT INTO `sys_role_menu`
VALUES (11, 2007);
INSERT INTO `sys_role_menu`
VALUES (11, 2008);
INSERT INTO `sys_role_menu`
VALUES (11, 2009);
INSERT INTO `sys_role_menu`
VALUES (11, 2010);
INSERT INTO `sys_role_menu`
VALUES (11, 2011);
INSERT INTO `sys_role_menu`
VALUES (11, 2012);
INSERT INTO `sys_role_menu`
VALUES (11, 2013);
INSERT INTO `sys_role_menu`
VALUES (11, 2014);
INSERT INTO `sys_role_menu`
VALUES (12, 2017);
INSERT INTO `sys_role_menu`
VALUES (12, 2022);
INSERT INTO `sys_role_menu`
VALUES (12, 2024);
INSERT INTO `sys_role_menu`
VALUES (12, 2025);
INSERT INTO `sys_role_menu`
VALUES (12, 2026);
INSERT INTO `sys_role_menu`
VALUES (12, 2027);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'NULL' COMMENT '用户名',
    `nick_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'NULL' COMMENT '昵称',
    `password`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'NULL' COMMENT '密码',
    `type`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
    `email`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '邮箱',
    `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '手机号',
    `sex`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
    `avatar`      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '头像',
    `create_by`   bigint                                                        NULL     DEFAULT NULL COMMENT '创建人的用户id',
    `create_time` datetime                                                      NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint                                                        NULL     DEFAULT NULL COMMENT '更新人',
    `update_time` datetime                                                      NULL     DEFAULT NULL COMMENT '更新时间',
    `del_flag`    int                                                           NULL     DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14787164048668
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'sg', 'sg333', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', '1', '0', '23412332@qq.com',
        '18888888888', '1',
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F3bf9c263bc0f2ac5c3a7feb9e218d07475573ec8.gi',
        NULL, '2022-01-05 09:01:56', 1, '2022-01-30 15:37:03', 0);
INSERT INTO `sys_user`
VALUES (3, 'sg3', 'weqe', '$2a$10$ydv3rLkteFnRx9xelQ7elOiVhFvXOooA98xCqk/omh7G94R.K/E3O', '1', '0', NULL, NULL, '0',
        NULL, NULL, '2022-01-05 13:28:43', NULL, '2022-01-05 13:28:43', 0);
INSERT INTO `sys_user`
VALUES (4, 'sg2', 'dsadd', '$2a$10$kY4T3SN7i4muBccZppd2OOkhxMN6yt8tND1sF89hXOaFylhY2T3he', '1', '0', '23412332@qq.com',
        '19098790742', '0', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_user`
VALUES (5, 'sg2233', 'tteqe', '', '1', '0', NULL, '18246845873', '1', NULL, NULL, '2022-01-06 03:51:13', NULL,
        '2022-01-06 07:00:50', 0);
INSERT INTO `sys_user`
VALUES (6, 'sangeng', 'sangeng', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', '1', '0', '2312321',
        '17777777777', '0', NULL, NULL, '2022-01-16 06:54:26', NULL, '2022-01-16 07:06:34', 0);
INSERT INTO `sys_user`
VALUES (14787164048662, 'weixin', 'weixin', '$2a$10$y3k3fnMZsBNihsVLXWfI8uMNueVXBI08k.LzWYaKsW8CW7xXy18wC', '0', '0',
        'weixin@qq.com', NULL, NULL, NULL, -1, '2022-01-30 17:18:44', -1, '2022-01-30 17:18:44', 0);
INSERT INTO `sys_user`
VALUES (14787164048663, 'pei', '小沛啦', '$2a$10$Ap11D7a0YWnqx29SmLB26eZUlcL0Iefu4xPAoSPxJYgiCTB1QRH3O', '0', '0',
        '1066365803@qq.com', NULL, '0', '704ab1f3-c798-47de-bbf0-4d5aeb2a7fd1.jpg', -1, '2022-09-10 17:06:00', NULL,
        '2022-09-11 10:28:39', 0);
INSERT INTO `sys_user`
VALUES (14787164048664, 'peipei', '我是小号', '$2a$10$YJ0Es5pKWkRk38JDHov.tu9sZypckCMmHET7BIkCLD.BT7hBDPBRu', '0', '0',
        'w1066365803@qq.com', NULL, '0', 'e7f07038-5e8a-4714-8992-d5f33eacc33e.jpg', -1, '2022-09-10 23:53:20', NULL,
        '2022-09-10 23:58:00', 0);
INSERT INTO `sys_user`
VALUES (14787164048665, '一位不知姓名的访客', '111111111',
        '$2a$10$o8HoCs8jKgHjgn7qwYrMTOKIxgIepuA1kSqR9hdCSjMepSn7Jzfry', '0', '0', '123@qq.com', NULL, NULL, NULL, -1,
        '2022-09-11 11:16:21', -1, '2022-09-11 11:16:21', 0);
INSERT INTO `sys_user`
VALUES (14787164048666, 'RayZXR', '百花肉', '$2a$10$QfuDx1F0ixxoxHUY/Bn1XuEEIwFNI9GdbD/L//i4c2d4F03JBwpEe', '0', '0',
        'rayzxr@qq.com', NULL, '0', '8e95fe6b-1df0-4a70-ae47-037dd0a45544.jpg', -1, '2022-09-11 12:16:23', NULL,
        '2022-09-11 12:27:13', 0);
INSERT INTO `sys_user`
VALUES (14787164048667, '123456', '士', '$2a$10$wYW5.G9AMnuSa2dQGhy4gOu5XNMHPvrHPNySQ5oJo6lttfocbf3Xa', '0', '0',
        '1424986967@qq.com', NULL, '0', '500e61a7-aa3e-4f58-bcfd-b7a96e7aaed5.jpeg', -1, '2022-09-28 22:46:40', NULL,
        '2022-09-28 22:47:38', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户和角色关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);
INSERT INTO `sys_user_role`
VALUES (2, 2);
INSERT INTO `sys_user_role`
VALUES (5, 2);
INSERT INTO `sys_user_role`
VALUES (6, 12);

SET FOREIGN_KEY_CHECKS = 1;
