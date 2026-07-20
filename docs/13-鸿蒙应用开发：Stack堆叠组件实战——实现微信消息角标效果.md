## 一、引言

在鸿蒙应用开发中，布局是构建用户界面的基础。`Stack`（堆叠）组件是一种非常实用的布局容器，它允许子组件按照顺序层叠排列，后一个子组件会覆盖在前一个子组件之上。这种特性非常适合实现一些特殊的UI效果，比如在应用图标上显示消息角标。

本文将以实现微信来信息后，在应用图标上显示数字角标为例，带你掌握`Stack`组件的核心用法。

## 二、Stack堆叠组件基础

### 2.1 什么是Stack组件

`Stack` 组件是鸿蒙ArkUI框架提供的一种容器组件，它采用**堆叠**的方式排列子组件。简单来说，就是先放入的子组件在底层，后放入的子组件在上层，形成类似“叠罗汉”的效果。

### 2.2 基本语法

```typescript
Stack({ alignContent: Alignment }) {
    // 子组件
}
```

- `alignContent`：可选参数，用于设置所有子组件在容器内的对齐方式，默认为`Alignment.Center`。

### 2.3 对齐方式

`Stack`组件支持多种对齐方式，常用的包括：

| 对齐方式 | 说明 |
|---------|------|
| `Alignment.TopStart` | 顶部起始（左上） |
| `Alignment.TopCenter` | 顶部居中 |
| `Alignment.TopEnd` | 顶部尾部（右上） |
| `Alignment.Center` | 居中（默认） |
| `Alignment.BottomStart` | 底部起始（左下） |
| `Alignment.BottomEnd` | 底部尾部（右下） |

## 三、实战：实现微信消息角标

### 3.1 效果分析

微信收到新消息时，应用图标右上角会显示一个红色圆形角标，里面带有未读消息数量。这个效果用 `Stack` 组件实现非常合适：

- **底层**：放置应用图标（图片组件）
- **上层**：放置角标（文本组件，带红色背景）

### 3.2 完整代码实现

```typescript
@Entry
@Component
struct MessageBadgeDemo {
  // 模拟未读消息数量
  @State unreadCount: number = 5

  build() {
    Column() {
      // 堆叠容器：图标 + 角标
      Stack({ alignContent: Alignment.TopEnd }) {
        // 底层：应用图标
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
          .borderRadius(16)

        // 上层：消息角标
        if (this.unreadCount > 0) {
          Text(this.unreadCount > 99 ? '99+' : this.unreadCount.toString())
            .fontSize(12)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .borderRadius(10)
            .width(20)
            .height(20)
            .textAlign(TextAlign.Center)
            .position({ x: 60, y: -5 }) // 微调角标位置
        }
      }
      .width(80)
      .height(80)

      // 显示未读数量控制按钮
      Row({space: 30}) {
        Button('+1')
          .onClick(() => {
            this.unreadCount++
          })
          .width("30%")
        Button('清零')
          .onClick(() => {
            this.unreadCount = 0
          })
          .width("30%")
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
```

### 3.3 代码解析

1. **`Stack({ alignContent: Alignment.TopEnd })`**：设置堆叠容器为**顶端尾部对齐**，这样角标就会出现在图标的右上角。

2. **底层图片**：使用`Image`组件加载应用图标，并设置宽高和圆角。

3. **上层角标**：使用`Text`组件显示未读数量，通过`backgroundColor(Color.Red)`设置红色背景，`borderRadius(10)`实现圆形效果。

4. **条件渲染**：通过`if (this.unreadCount > 0)`控制，当未读数为0时隐藏角标。

5. **数量上限处理**：当未读数超过99时，显示`99+`，避免角标显示不下。

### 3.4 效果展示

运行上述代码，你会看到：

- 应用图标右上角显示红色圆形角标，里面显示数字`5`
- 点击`+1`按钮，角标数字递增
- 点击`清零`按钮，角标消失

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/6d3b0c9fe3624b42acb21579c2cfeec5.png)
## 四、进阶技巧

### 4.1 使用position精确控制位置

除了通过`alignContent`控制整体对齐，还可以使用`position`属性对单个子组件进行微调：

```typescript
Text('3')
    .position({ x: 55, y: -8 }) // 相对于父容器左上角的偏移
```

### 4.2 支持多种角标样式

```typescript
// 红点模式（仅提示，不显示数字）
Circle()
    .width(10)
    .height(10)
    .fill(Color.Red)
    .position({ x: 65, y: -3 })

// 带边框的角标
Text('新消息')
    .fontSize(10)
    .fontColor(Color.White)
    .backgroundColor(Color.Red)
    .border({ width: 1, color: Color.White })
    .borderRadius(8)
    .padding({ left: 6, right: 6, top: 2, bottom: 2 })
```

## 五、总结

通过本文的实战，我们学习了：

1. `Stack` 堆叠组件的基本用法和对齐方式
2. 如何利用 `Stack` 实现应用图标消息角标效果
3. 条件渲染和数量上限处理技巧
4. 进阶的样式定制方法

`Stack`组件在鸿蒙开发中应用广泛，除了角标效果，还可以用于实现悬浮按钮、遮罩层、卡片叠加等场景。掌握好这个组件，能让你的UI开发更加得心应手。

## 六、思考与练习

1. 尝试实现一个带“红点”和“数字”两种模式的角标组件
2. 如何让角标支持动画效果（如缩放出现）？
3. 思考 `Stack` 和 `Flex` 布局在什么场景下配合使用效果更好？
