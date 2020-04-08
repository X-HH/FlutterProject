# FlutterProject
该工程主要分为两个部分，一是作为一个Flutter工程，可以直接运行当做一个简单的App。还有一个就是提供与Native混合编程相关的改造内容。
- 作为Flutter工程，主要实现了内容的记录、保存功能，列表页使用了ListView进行显示，数据使用shared_preferences进行数据缓存。
- 与iOS的混合编程，使用了一个编译脚本编译并存放编译产物。新建podspec文件，建立pod私有库，供iOS使用pod方便引入Flutter工程的编译产物，达到混合编程的目的。
- Flutter工程运行效果：

![](https://xhhimages.oss-cn-beijing.aliyuncs.com/flutter/111.gif)
