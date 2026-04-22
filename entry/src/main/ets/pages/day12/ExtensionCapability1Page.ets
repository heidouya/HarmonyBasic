/*
延伸能力是指容器组件内的子组件，按照其在列表中的先后顺序，随容器组件尺寸变化显示或隐藏。它可以根据显示区域的尺寸，显示不同数量的元素。

延伸能力通常有两种实现方式：
1. 通过List组件实现。
2. 通过Scroll组件配合Row组件或Column组件实现。
*/

@Entry
@Component
struct ExtensionCapability1Page {
  @State rate: number = 0.60;
  private appList: number [] = [0, 1, 2, 3, 4, 5, 6, 7];

  @Builder
  slider() {
    Slider({ value: this.rate * 100, min: 8, max: 60 })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .onChange((value: number) => {
        this.rate = value / 100;
      })
      .position({ x: '20%', y: '80%' })
  }

  build() {
    Row() {
      // The 'Scroll' component can have only one child component.
      Scroll() {
        Row({ space: 10 }) {
          ForEach(this.appList, () => {
            Column() {
              Image($r('app.media.startIcon'))
                .width(48)
                .height(48)
                .margin({ top: 8 })
              Text("鸿蒙应用")
                .width(64)
                .height(30)
                .lineHeight(15)
                .fontSize(12)
                .textAlign(TextAlign.Center)
                .margin({ top: 8 })
                .padding({ bottom: 15 })
            }
            .width(80)
            .height(102)
          }, (item: number, index: number) => item.toString() + index)
        }
        .padding({ top: 16, left: 10 })
        .height(118)
        .borderRadius(16)
        .backgroundColor(Color.White)
      }
      // 设置滚动方向。
      .scrollable(ScrollDirection.Horizontal)
      .width(this.rate * 100 + '%')

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.background_secondary'))
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}