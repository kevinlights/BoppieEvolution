<h1 align="center">Boppie Evolution</h1>
<h1 align="center">波比进化</h1>

---

# Try it [online](https://boppie-evolution.brutenis.net)! 

## A Simulation of Natural Selection based on Owl-like Creatures with Neural Networks
## 基于类似猫头鹰生物的神经网络的自然选择的模拟

> Godot 3.2.x

![](./Media/Simulation1.gif)


![](./Media/Simulation2.gif)

## Explanation

There are two types of boppies: owlies and kloppies. The owlies eat the red dots (apples), and the kloppies eat the owlies. 

有两种类型的波比：猫头鹰和 Kloppies。猫头鹰吃红点（苹果），而Kloppies吃猫头鹰。


![](./Media/FoodChain.png)

Each creature has a small neural network which tells it what to do. The neural network has two outputs, go forward/backwards and turn left/right. Notice in the gif below the two output nodes.
Currently each creature has 5 inputs (+1 bias/threshold), each input shows the distance (0 = no food, 0.5 = very far, 1.0 = very close) to the next food. As in, the neuron fires when it sees
food there.

每个生物都有一小个神经网络，告诉它该做什么。神经网络有两个输出，前进/后退和左转/右转。在下面的gif中注意两个输出节点。
目前每个生物有5个输入（+1偏置/阈值），每个输入显示到下一个食物的距离（0 = 无食物，0.5 = 非常远，1.0 = 非常近）。也就是说，当它看到食物时，神经元会发射。


![](./Media/Simulation3.gif)

## Observations

Based on this basic neural network and evolution some interesting behaviour emerges. For example, the
[prey-predator](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations) cycle appears after some time, just as it does in nature:

基于这个基本的神经网络和进化，一些有趣的行为出现了。例如，[捕食者-被捕食者](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations)周期在一段时间后出现，就像自然界中一样：


![](./Media/PreyPredatorCycle.png)

## Running it

You can play with it [online](https://boppie-evolution.brutenis.net) with a web browser.
For better performance you can download the binaries [here](https://github.com/LiquidFun/BoppieEvolution/releases/latest) (Linux, Windows and Mac are all provided, the latter two have not been tested though).

你可以用网页浏览器在线玩它 [online](https://boppie-evolution.brutenis.net)。
为了更好的性能，你可以下载二进制文件 [here](https://github.com/LiquidFun/BoppieEvolution/releases/latest)（Linux、Windows和Mac都提供，后两者尚未经过测试）。


## Hotkeys

Quickstart: after starting a simulation: press `9` to simulate quickly. After a couple minutes you can press `1` to go to normal speed and inspect what the creatures are now capable of!

* `H` - See help page for up-to-date hotkey list (or click on the question mark in the bottom right corner)
* `W`/`A`/`S`/`D` - move camera around (hold **shift** to move 10x as fast)
* `Mouse click and drag` - move camera around
* `Mouse click` on boppie - follow it until it dies
* `Mouse wheel` - zoom in/out
* `Escape` - stop following boppie
* `O`/`K` - follow fittest **o**wlie/**k**loppie until it dies
* `P` - turn performance mode on/off (off by default). This improves FPS by a lot by turning off all particles and unnecessary visual effects. This is done automatically when changing to a time factor above 32x.
* `F` - **f**ollow new fittest boppie even after death
* `C` - toggle **c**ontrol of boppie if already following it (i.e. clicked on it before) (use `W`/`A`/`S`/`D` to move with it)
* `E` - add 5 **e**nergy to currently following boppie (press multiple times, then the boppie will grow and have children)
* `-`/`+` - decrease/increase time factor by 2x (min: 0.5x, max: 256x)
* Numbers `1` through `9` - set time factor to 2^(number - 1)  (e.g.: pressing 9 sets time factor to 256x)
* `Space` - pause/unpause
* `R` - show vision **r**ays for all boppies
* `T` - show vision rays for curren**t** boppie

## If you want to tinker yourself

* Download the free and open source game-engine: [Godot](https://godotengine.org/)
* Clone this repository: `git clone https://github.com/LiquidFun/BoppieEvolution` (or download via github)
* Open Godot and import the `project.godot` file
* Now press on the play button to run it 

## Ideas for future features

### Simulation

* Add obstacles
* Add more senses for the boppies, such as:
    * Instead of rays try neural network inputs with information for angle+distance
    * Cone for detection of food
    * History neuron both input/output, but cap with sigmoid as it easily escalates
* Add sexual reproduction, as in the real world merging DNA from two individuals has greatly benefited survival of the fittest
* Add loading/saving of simulations
* Add areas of high ground productivity (where more food spawns)
* Add seasons where more or less food spawns
* Add (for example), a river in the middle of the map, which separates the species on the left/right of it. 
* Encode how many creatures are reproduced in the DNA of the creature (number of children)
* Change meat-eating from boolean to a float, where it essentially becomes meat-tolerance or meat effectiveness (a factor of how much energy can be gained from meat). However high meat-tolerance means low 
* Different parallel simulations where the best are merged into one

* 添加障碍物
* 为boppies添加更多感官，例如：
    * 而不是光线，尝试使用神经网络输入，其中包含角度+距离的信息
    * 用于检测食物的锥形
    * 历史神经元作为输入/输出，但使用sigmoid函数进行上限限制，因为很容易上升
* 添加性繁殖，就像在真实世界中一样，两个个体的DNA合并极大地提高了适应性强的生物的生存率
* 添加加载/保存模拟的功能
* 添加高生产力区域（更多食物出现的地方）
* 添加季节性变化，其中食物的出现量会增多或减少
* 添加（例如）地图中间的一条河流，将地图左/右两侧的物种分隔开来。
* 在生物的DNA中编码繁殖的生物数量（子代数量）
* 将食肉行为从布尔值改为浮点值，其中它本质上变成了食肉容忍度或食肉效果（获取肉类能量的因子）。然而，高食肉容忍度意味着低 
* 不同的并行模拟，其中最好的被合并成一个


### UI/UX
* Add menu so that simulation could be configured
* Show genetic tree for entire simulation
* Add more graphs:
    * Fittest creature each second
    * Species stacked bar-plot
* Full screen on neural network, which shows actual weights
* Improve display of recurrent connections
* Use textures on the ground (fertile vs infertile land)
* Show version/commit id in application
* Add eye button to hide eye containers
* Add world configuration tab with seed and other such stuff
* Add high-contrast (bright world background) and large font mode for beamer presentations
* Plots
    * Change y-scale once higher values have been achieved
* Ease of use:
    * Make the hotkey button more apparent (e.g. show a HOTKEYS text after starting for a couple seconds)
    * Add help tooltips for boppie and world window
    * Show WASD + SHIFT display when controlling boppie
    * Add buttons for common actions 
        * Eat food, show sensors, stop following
        * Load and save simulations
* Alternative display of neural network, where the input neurons are shown at the positions of the sensory neurons near the actual boppie
* Add menu bar at the top: Simulation/Help, with multiple dropdown menu options to restart simulation, back to menu, keyboard help, explanation help etc

* 添加菜单，以便可以配置模拟
* 显示整个模拟的遗传树
* 添加更多图表：
    * 每秒最适应的生物
    * 物种堆叠条形图
* 在神经网络上全屏显示，展示实际的权重
* 改进循环连接的显示
* 在地面上使用纹理（肥沃与贫瘠的土地）
* 在应用程序中显示版本/提交ID
* 添加一个眼睛按钮来隐藏眼睛容器
* 添加一个世界配置选项卡，带有种子和其他此类内容
* 为演示添加高对比度（明亮的背景世界）和大字体模式
* 图表
    * 当达到更高值时改变y轴刻度
* 易用性：
    * 使热键按钮更加显眼（例如，启动后显示HOTKEYS文本几秒钟）
    * 为boppie和世界窗口添加帮助工具提示
    * 在控制boppie时显示WASD + SHIFT
    * 添加按钮进行常见操作
        * 吃食物，显示传感器，停止跟随
        * 加载和保存模拟
* 神经网络的替代显示，其中输入神经元显示在实际boppie附近的感官神经元的位置
* 在顶部添加菜单栏：Simulation/Help，带有多个下拉菜单选项来重新启动模拟，返回菜单，键盘帮助，解释帮助等


### Rework

* All globals should be in gamecontroller, so that those could be loaded and saved easier
* Neural networks in GDNative C++ instead of GDScript (by far largest bottleneck)
* Separate StatusBar, BoppieBar and WorldStats

* 所有全局变量都应该放在游戏控制器中，以便更容易加载和保存
* 使用GDNative C++而不是GDScript来实现神经网络（这是最大的瓶颈）
* 分离状态栏、Boppie栏和世界统计信息


### Experiments

* Can the boppies learn recurrent connections if their inputs are delayed
* Instead of sexual reproduction, only reproduce fittest creatures by crossover
* Player vs evolution game mode
    * Try to compete with evolution by creating an AI (code in game screen, use eval to evaluate code)
    * Get access to better/more sensors over time
    * Try to beat ever stronger kloppies

* 如果boppies的输入被延迟，它们是否能学习循环连接？
* 而不是性繁殖，只通过交叉繁殖最适应的生物
* 玩家对进化的游戏模式
    * 通过创建一个AI（在游戏屏幕上编写代码，使用eval来评估代码）来尝试与进化竞争
    * 随着时间的推移获得更好的/更多的传感器
    * 尝试击败越来越强大的kloppies


### Known bugs

* Currently crossover is not performed when spawning new boppies
* Cannot copy DNA over to other boppies
* Loading and saving does not work

* 目前当生成新的boppies时，没有执行交叉。
* 不能将DNA复制到其他boppies。
* 加载和保存功能无法工作。


## Changelog

### v0.4.0 (not yet released)

* UI/UX Improvements
    * Added progress bars for energy/water/offspring, improving legibility
    * Left panel is now for boppies, right panel is for world, status bar has been cleaned up
    * Fittest table now in right world panel
    * Plants now have plant icon
    * Plots
        * Current value is now displayed in the top right
    * Ease of use:
        * Added tooltips for most buttons
        * Added buttons for common actions:
            * Faster/slower game-speeds, pause play
            * Take control of boppie, make invincible, produce offspring
            * Performance mode
            * Follow fittest boppie
            * Show all vision rays
* Added meat after death of boppies

### v0.3.0 (2022-03-09)

* UI/UX Improvements
    * Show additional danger-sense near boppie
    * Disabled spike rotation and blood in performance mode
    * Improved graphs by drawing lines instead of pixels in texture, graphs can be hidden
    * Neurons have colors based on their type, can now drag neurons
    * Show importance of neural network connections
    * Can now select different profiles for displaying neural network (weights or activations)
* Added lakes, water requirement for boppies and neurons for detecting lakes
* Boppie colors now represent: hue: dna, saturation: energy, luminance: water
* Added reinforcement learning, where neural net weights are adjusted based on rewards
* New neurons/senses
    * Terrain resistance sense below and ahead of boppie
    * Timer (time encoded in DNA)
    * Hunger/thirst
    * A single large water ray for detecting water
    * Ally sense for detecting allies (same as danger sense)
* Fixed major bug where each time a new boppie was spawned the AIs and NeuronTimers would become orphaned
* Required boppie offspring energy depends on DNA

### [v0.2.0](https://github.com/LiquidFun/BoppieEvolution/releases/tag/0.2.0) (2022-02-17)

* UI/UX Improvements
    * Random seed is shown 
    * Can now drag boppies from fittest list into world
    * Camera can now be moved by dragging the mouse
    * DNA/Neural network as tabs, as they did not fit in a single column
    * Neural networks now show what each input/output neuron means
* Neural networks can have any structure (not necessarily fully connected)
* Added rotating traps with spikes and blood marks after death
* Added these senses for boppies:
    * Danger sense (for detecting traps and kloppies)
* Added boppie color as part of DNA 
* Implemented NEAT (Neuroevolution of Augmenting Topologies), such that the neural networks of the boppies change with each generation
    * Added an innovation number for each connection in the neural network, as described in NEAT
    * Crossover of creature DNA and neural networks


### [v0.1.0](https://github.com/LiquidFun/BoppieEvolution/releases/tag/0.1.0) (2021-10-19)

* Two types of creatures (Owlies and Kloppies)
* A basic neural network for each creature
* Creatures have DNA which they pass on to children
* Vision based on 5 rays extending from each boppie

## Inspired by

### Videos

* [Evolution simulator](https://www.youtube.com/watch?v=GOFws_hhZs8) by [carykh](https://www.youtube.com/channel/UC9z7EZAbkphEMg0SP7rw44A)
* [Evolv.io](https://www.youtube.com/watch?v=C9tWr1WUTuI) by [carykh](https://www.youtube.com/channel/UC9z7EZAbkphEMg0SP7rw44A)
* [MarI/O](https://www.youtube.com/watch?v=qv6UVOQ0F44) by [SethBling](https://www.youtube.com/channel/UC8aG3LDTDwNR1UQhSn9uVrw)
* [Simulating Natural Selection](https://www.youtube.com/watch?v=0ZGbIKd0XrM) by [Primer](https://www.youtube.com/channel/UCKzJFdi57J53Vr_BkTfN3uQ)
* [I programmed some creatures. They Evolved.](https://www.youtube.com/watch?v=N3tRFayqVtk) by [David Randall Miller](https://www.youtube.com/user/davidrandallmiller)
* [The Evolution of Predation in a Simulated Ecosystem](https://www.youtube.com/watch?v=rPkMoFJNcLA) by [The Bibites: Digital Life](https://www.youtube.com/c/TheBibitesDigitalLife)

### Papers

* [Neuroevolution of Augmenting Topologies](http://nn.cs.utexas.edu/downloads/papers/stanley.ec02.pdf) by K. Stanley and R. Miikkulainen, 2002

## Credits

### Fonts

* [Font awesome 5](https://fontawesome.com/versions) ([CC BY 4.0](https://fontawesome.com/license/free))
* [FredokaOne](https://fonts.google.com/specimen/Fredoka+One) ([Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL))
