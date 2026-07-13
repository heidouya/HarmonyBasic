## 一、引言

在鸿蒙应用开发中，布局是构建用户界面的基础。ArkUI 提供了多种布局容器，其中 `Row`（行）和 `Column`（列）是最基础、最常用的两个组件。本文将带你快速掌握这两个组件的核心用法。

## 二、为什么需要 Row 和 Column？

在 `build` 方法中，只能有一个根节点，并且这个节点必须是一个容器组件。这意味着，如果你想要在界面上展示多个文本或图片，不能简单地将它们并列放置，而必须用一个容器组件将它们包裹起来。

`Row` 和 `Column` 就是这样的容器组件，它们负责管理内部子组件的排列方式。

## 三、Row 组件：水平布局

`Row` 组件，从字面意思理解就是“行”。它的核心特点是**沿水平方向**排列其内部的子组件。

### 3.1 基本用法

```typescript
@Entry
@Component
struct MyComponent {
  build() {
    Row() {
      Text('文本一')
      Text('文本二')
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Orange)
  }
}
```

在上面的代码中，`Row` 组件作为根容器，将两个 `Text` 组件包裹起来。运行后，你会看到“文本一”和“文本二”是沿着水平方向从左到右排列的。

### 3.2 特性：默认垂直居中

`Row` 组件有一个重要的默认特性：**它内部的子元素在垂直方向上是居中对齐的**。这意味着，即使两个文本的高度不同，它们也会在垂直方向上处于同一中心线上。

### 3.3 运行效果

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/69adc1fe0d284c949540739f145a85b5.png)

## 四、Column 组件：垂直布局

`Column` 组件，字面意思是“列”。它的核心特点是**沿垂直方向**排列其内部的子组件。

### 4.1 基本用法

```typescript
@Entry
@Component
struct MyComponent {
  build() {
    Column() {
      Text('文本一')
      Text('文本二')
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Orange)
  }
}
```

将 `Row` 替换为 `Column` 后，两个 `Text` 组件会沿着垂直方向从上到下排列。

### 4.2 特性：默认水平居中

与 `Row` 的垂直居中相对应，`Column` 组件的默认特性是：**它内部的子元素在水平方向上是居中对齐的**。

### 4.3 运行效果

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/78b365d412114227a5d798065d607049.png)
## 五、Row 和 Column 的嵌套使用

`Row` 和 `Column` 之间可以互相包含，从而实现更复杂的布局结构。

```typescript
@Entry
@Component
struct MyComponent {
  build() {
    Column() {
      Text('顶部文本').fontSize(30)
      Row() {
        Text('左侧').fontSize(30)
        Text('右侧').fontSize(30)
      }
      .width("100%")
      .height("50%")
      .backgroundColor(Color.Red)
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Orange)
  }
}
```

在这个例子中，最外层是一个 `Column`，它包含了一个 `Text` 和一个 `Row`。而内部的 `Row` 又包含了两个 `Text`。这样，我们就实现了一个“顶部文本”在上，两个并排文本在下的布局。

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/3eeda856b80043709a87571ac8439aa8.png)
## 六、设置组件属性

`Row` 和 `Column` 组件本身也是组件，因此可以像其他组件一样设置宽高、背景色等属性。

```typescript
@Entry
@Component
struct MyComponent {
  build() {
    Column() {
      Row() {
        Text('文本一')
        Text('文本二')
      }
      .width('100%')
      .height(100)
      .backgroundColor(Color.Pink)

      Column() {
        Text('文本三')
        Text('文本四')
      }
      .width('100%')
      .height(100)
      .backgroundColor(Color.Orange)
    }
  }
}
```

通过 `.width()`、`.height()` 和 `.backgroundColor()` 等属性，我们可以轻松控制容器组件的外观。

## 七、主轴与交叉轴

在布局体系中，有两个重要的概念：**主轴（Main Axis）** 和 **交叉轴（Cross Axis）**。

- **主轴**：容器排列子元素的方向所在的轴。
- **交叉轴**：与主轴垂直的另一条轴。


### 7.1 Row 组件中的主轴与交叉轴

对于 `Row` 组件来说，**主轴是水平方向（从左到右）**，**交叉轴是垂直方向（从上到下）**。`Row` 沿主轴排列子元素，同时可以在交叉轴上控制子元素的对齐方式。

**相关属性简介：**

- **`justifyContent`**：控制子元素在**主轴（水平方向）**上的对齐方式。常用值有 `FlexAlign.Start`（起始对齐）、`FlexAlign.Center`（居中对齐）、`FlexAlign.End`（末尾对齐）、`FlexAlign.SpaceBetween`（两端对齐，子元素间间距相等）、`FlexAlign.SpaceAround`（子元素周围间距相等）。
- **`alignItems`**：控制子元素在**交叉轴（垂直方向）**上的对齐方式。常用值有 `VerticalAlign.Top`（顶部对齐）、`VerticalAlign.Center`（居中对齐，默认值）、`VerticalAlign.Bottom`（底部对齐）。

**示例：**

```typescript
@Entry
@Component
struct RowAxisDemo {
  build() {
    Column() {
      // 主轴：水平居中；交叉轴：底部对齐
      Row() {
        Text('A').fontSize(20).backgroundColor(Color.Green)
        Text('B').fontSize(30).backgroundColor(Color.Yellow)
        Text('C').fontSize(40).backgroundColor(Color.Pink)
      }
      .width('100%')
      .height(100)
      .backgroundColor(Color.Orange)
      .justifyContent(FlexAlign.Center)   // 主轴居中
      .alignItems(VerticalAlign.Bottom)   // 交叉轴底部对齐

      // 主轴：两端对齐；交叉轴：顶部对齐
      Row() {
        Text('A').fontSize(20).backgroundColor(Color.Green)
        Text('B').fontSize(30).backgroundColor(Color.Yellow)
        Text('C').fontSize(40).backgroundColor(Color.Pink)
      }
      .width('100%')
      .height(100)
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceBetween) // 主轴两端对齐
      .alignItems(VerticalAlign.Top)          // 交叉轴顶部对齐
    }
    .width('100%')
    .height('100%')
  }
}
```
运行效果：

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/62e45f7d3fe648cbbd91f86dbb0035f4.png)
### 7.2 Column 组件中的主轴与交叉轴

与 `Row` 相反，`Column` 组件的**主轴是垂直方向（从上到下）**，**交叉轴是水平方向（从左到右）**。`Column` 沿主轴排列子元素，同时可以在交叉轴上控制子元素的对齐方式。

**相关属性简介：**

- **`justifyContent`**：控制子元素在**主轴（垂直方向）**上的对齐方式。常用值有 `FlexAlign.Start`（起始对齐）、`FlexAlign.Center`（居中对齐）、`FlexAlign.End`（末尾对齐）、`FlexAlign.SpaceBetween`（两端对齐）、`FlexAlign.SpaceAround`（周围间距相等）。
- **`alignItems`**：控制子元素在**交叉轴（水平方向）**上的对齐方式。常用值有 `HorizontalAlign.Start`（左对齐）、`HorizontalAlign.Center`（居中对齐，默认值）、`HorizontalAlign.End`（右对齐）。

**示例：**

```typescript
@Entry
@Component
struct ColumnAxisDemo {
  build() {
    Row() {
      // 主轴：垂直居中；交叉轴：右对齐
      Column() {
        Text('A').fontSize(20).backgroundColor(Color.Green)
        Text('B').fontSize(30).backgroundColor(Color.Yellow)
        Text('C').fontSize(40).backgroundColor(Color.Pink)
      }
      .width(150)
      .height('100%')
      .backgroundColor(Color.Orange)
      .justifyContent(FlexAlign.Center)      // 主轴居中
      .alignItems(HorizontalAlign.End)       // 交叉轴右对齐

      // 主轴：两端对齐；交叉轴：左对齐
      Column() {
        Text('A').fontSize(20).backgroundColor(Color.Green)
        Text('B').fontSize(30).backgroundColor(Color.Yellow)
        Text('C').fontSize(40).backgroundColor(Color.Pink)
      }
      .width(150)
      .height('100%')
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceBetween) // 主轴两端对齐
      .alignItems(HorizontalAlign.Start)      // 交叉轴左对齐
    }
    .width('100%')
    .height('100%')
  }
}
```
运行效果：

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/1f5233dfc4a943829e6f39f4a6992ed9.png)
## 八、总结

- **`Row`**：水平布局容器，子组件沿水平方向排列，默认垂直居中。
- **`Column`**：垂直布局容器，子组件沿垂直方向排列，默认水平居中。
- 两者可以互相嵌套，构建复杂布局。
- 支持设置宽高、背景色等通用属性。
- **主轴与交叉轴**：`Row` 的主轴为水平方向，交叉轴为垂直方向；`Column` 的主轴为垂直方向，交叉轴为水平方向。
- 通过 `justifyContent` 控制主轴对齐，`alignItems` 控制交叉轴对齐。

掌握 `Row` 和 `Column` 是学习鸿蒙布局的第一步，也是最重要的一步。希望本文能帮助你快速上手！
