## 一、Grid组件简介

在鸿蒙应用开发中，Grid 组件是一种强大的网格布局容器，能够将子元素按照行和列的网格形式进行排列。与Flex布局相比，Grid 布局更加灵活，特别适合实现九宫格、商品列表、图片墙等规整的布局效果。

## 二、基础九宫格实现

下面我们来看如何使用 Grid 组件实现一个基础的九宫格布局：

```typescript
@Entry
@Component
struct GridExample {
  // 定义九宫格数据
  private gridData: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

  build() {
    Column() {
      Grid() {
        ForEach(this.gridData, (item: string) => {
          GridItem() {
            // 自定义的九宫格项组件
            GridItemContent({ text: item })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr') // 设置3列，每列等宽
      .rowsGap(12) // 行间距
      .columnsGap(12) // 列间距
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}

// 九宫格项组件
@Component
struct GridItemContent {
  @Prop text: string

  build() {
    Column() {
      // 图片组件
      Image($r('app.media.startIcon'))
        .width(60)
        .height(60)
        .borderRadius(8)
      
      // 文本组件
      Text(this.text)
        .fontSize(16)
        .margin({ top: 8 })
    }
    .width('100%')
    .height(120)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#00000020', offsetX: 0, offsetY: 2 })
  }
}
```
运行效果：

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/53dd4f92093743dda19bed614f90fa15.png)


**关键点说明：**
1. **Grid的直接子元素必须是GridItem**：Grid 组件内部需要使用 GridItem 来包裹实际的子元素
2. **ForEach遍历数据**：使用 ForEach 来遍历数组数据，动态生成网格项
3. **columnsTemplate设置列数**：`'1fr 1fr 1fr'`表示将父组件宽度平均分成 3 列

## 三、Grid核心属性详解

### 3.1 columnsTemplate - 列模板配置

`columnsTemplate`属性用于定义网格的列数和每列的宽度比例：

```typescript
// 3列等宽布局
.columnsTemplate('1fr 1fr 1fr')

// 4列等宽布局
.columnsTemplate('1fr 1fr 1fr 1fr')

// 不等宽布局：第一列占2份，其余各占1份（总共5份）
.columnsTemplate('2fr 1fr 1fr 1fr')

// 混合单位：固定宽度+自适应
.columnsTemplate('100px 1fr 2fr')
```

### 3.2 rowsTemplate - 行模板配置

类似地，我们可以使用`rowsTemplate`来定义行的高度：

```typescript
// 定义3行，高度分别为：100px、自适应、200px
.rowsTemplate('100px 1fr 200px')
```

### 3.3 间距控制

Grid提供了灵活的间距控制属性：

```typescript
Grid() {
  // ... GridItem内容
}
.rowsGap(16)    // 行间距16vp
.columnsGap(16)  // 列间距16vp
```

### 3.4 滚动支持

当Grid的内容超出容器高度时，会自动显示滚动条：

```typescript
Grid() {
  // ... 多个GridItem
}
.height(400)  // 固定高度，超出则滚动
.scrollable(ScrollDirection.Vertical)  // 垂直滚动
```

## 四、高级九宫格示例

下面是一个更完整的九宫格应用示例，包含点击事件和动态数据：

```typescript
@Entry
@Component
struct AdvancedGridExample {
  // 九宫格数据模型
  private gridItems: GridItemData[] = [
    { id: 1, title: '相册', icon: $r('app.media.startIcon'), color: '#FF6B6B' },
    { id: 2, title: '音乐', icon: $r('app.media.startIcon'), color: '#4ECDC4' },
    { id: 3, title: '视频', icon: $r('app.media.startIcon'), color: '#45B7D1' },
    { id: 4, title: '文档', icon: $r('app.media.startIcon'), color: '#96CEB4' },
    { id: 5, title: '下载', icon: $r('app.media.startIcon'), color: '#FFEAA7' },
    { id: 6, title: '设置', icon: $r('app.media.startIcon'), color: '#DDA0DD' },
    { id: 7, title: '帮助', icon: $r('app.media.startIcon'), color: '#98D8C8' },
    { id: 8, title: '关于', icon: $r('app.media.startIcon'), color: '#F7DC6F' },
    { id: 9, title: '更多', icon: $r('app.media.startIcon'), color: '#BB8FCE' }
  ]

  build() {
    Column() {
      Text('应用九宫格')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Grid() {
        ForEach(this.gridItems, (item: GridItemData) => {
          GridItem() {
            this.buildGridItem(item)
          }
          .onClick(() => {
            // 处理点击事件
            this.onItemClick(item)
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .rowsGap(15)
      .columnsGap(15)
      .width('90%')
      .aspectRatio(1) // 保持正方形
      .layoutDirection(GridDirection.Row)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#F5F5F5')
  }

  // 构建网格项
  @Builder
  buildGridItem(item: GridItemData) {
    Column() {
      Image(item.icon)
        .width(40)
        .height(40)
        .objectFit(ImageFit.Contain)

      Text(item.title)
        .fontSize(14)
        .margin({ top: 8 })
        .fontColor('#333333')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .shadow({ radius: 6, color: '#00000015', offsetX: 0, offsetY: 3 })
  }

  // 点击事件处理
  onItemClick(item: GridItemData) {
    console.log(`点击了：${item.title}`)
    // 这里可以添加导航逻辑
  }
}

// 数据模型接口
interface GridItemData {
  id: number
  title: string
  icon: Resource
  color: string
}
```
运行效果：

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/e2630a11447a400a8187a0bc864a3d5d.png)

## 五、布局方向与对齐方式

Grid 支持多种布局方向和对齐方式：

```typescript
Grid() {
  // ... GridItem内容
}
.layoutDirection(GridDirection.Row)     // 按行排列（默认）
// .layoutDirection(GridDirection.Column) // 按列排列

.justifyContent(FlexAlign.Start)    // 主轴起点对齐
// .justifyContent(FlexAlign.Center)  // 主轴居中对齐
// .justifyContent(FlexAlign.End)     // 主轴终点对齐
// .justifyContent(FlexAlign.SpaceBetween) // 两端对齐
// .justifyContent(FlexAlign.SpaceAround)  // 环绕对齐

.alignItems(ItemAlign.Start)        // 交叉轴起点对齐
// .alignItems(ItemAlign.Center)      // 交叉轴居中对齐
// .alignItems(ItemAlign.End)         // 交叉轴终点对齐
```

## 六、响应式网格布局

Grid 组件也支持响应式设计，可以根据屏幕尺寸动态调整列数：

```typescript
import { display } from '@kit.ArkUI'

@Entry
@Component
struct ResponsiveGridExample {
  @State columns: string = '1fr 1fr'  // 默认2列
  @State screenWidth:number = 0

  aboutToAppear() {
    // 根据屏幕宽度动态调整列数
    const screenWidth = px2vp(display.getDefaultDisplaySync().width)
    this.screenWidth = screenWidth

    if (screenWidth > 750) {
      this.columns = '1fr 1fr 1fr 1fr'  // 大屏：4列
    } else if (screenWidth > 400) {
      this.columns = '1fr 1fr 1fr'       // 中屏：3列
    } else {
      this.columns = '1fr 1fr'           // 小屏：2列
    }
  }

  build() {
    Column() {
      Text("屏幕宽度vp：" + this.screenWidth).fontSize(30)
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
          GridItem() {
            Text(`Item ${item}`)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }
          .height(80)
        })
      }
      .columnsTemplate(this.columns)
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
    }
  }
}
```
上述代码在 DevEco Studio 预览器中无法获取到真实的屏幕宽高，返回的可能为 0 或默认值。必须在模拟器或真机上运行才能正确获取。

模拟器上的运行效果：
1. 400vp < 屏幕宽度 < 750vp![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/8a280dec79ce45d68ae6db31807392cd.png)

2. 屏幕宽度 > 750vp
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c8354da8e2364dc6a3359d55834a8ddc.png)
## 七、性能优化建议

1. **避免过度嵌套**：GridItem 内部组件结构尽量简单
2. **使用键值优化**：ForEach 中为动态数据提供稳定的 key
3. **懒加载**：对于大量数据的网格，考虑使用 LazyForEach
4. **图片优化**：网格中的图片使用合适的尺寸和缓存策略

## 八、常见问题与解决方案

### 问题1：GridItem不显示
**原因**：Grid的直接子元素不是GridItem
**解决**：确保所有直接子元素都用 GridItem 包裹

### 问题2：布局错乱
**原因**：columnsTemplate 设置不当
**解决**：检查 `fr` 单位的使用，确保总和合理

### 问题3：滚动不流畅
**原因**：网格项内容过于复杂
**解决**：简化GridItem内部结构，使用缓存

## 九、总结

Grid 组件是鸿蒙应用开发中实现网格布局的强大工具，特别适合九宫格、商品列表等场景。通过合理使用columnsTemplate、rowsTemplate、间距和对齐属性，可以创建出既美观又实用的界面布局。

**核心要点回顾：**
- Grid的直接子元素必须是GridItem
- 使用columnsTemplate定义列数和宽度比例
- 通过rowsGap和columnsGap控制间距
- 支持滚动和响应式布局
- 结合ForEach实现动态数据渲染

## 十、进一步学习

要深入了解 Grid 组件的更多高级特性，建议查阅 [官方文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-create-grid) 。

通过掌握 Grid 组件，您将能够轻松应对各种复杂的网格布局需求，提升鸿蒙应用的界面开发效率。
