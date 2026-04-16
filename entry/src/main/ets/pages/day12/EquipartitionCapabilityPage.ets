// 均分能力是指容器组件尺寸发生变化时，增加或减小的空间均匀分配给容器组件内所有空白区域。它常用于内容数量固定、均分显示的场景，比如工具栏、底部菜单栏等。均分能力可以通过将Row组件、Column组件或Flex组件的justifyContent属性设置为FlexAlign.SpaceEvenly实现，即子元素在父容器主轴方向等间距布局，相邻元素之间的间距、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样。
@Entry
@Component
struct EquipartitionCapability {
  @State rate: number = 0.8;
  private list: number [] = [0, 1, 2, 3];

  @Builder
  slider() {
    Row() {
      Slider({ value: this.rate * 100, min: 30, max: 80 })
        .blockColor(Color.White)
        .width('60%')
        .height(50)
        .onChange((value: number) => {
          this.rate = value / 100;
        })
      Text(this.rate + "").fontSize(30)
    }
  }

  @Builder
  Item() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(48)
        .height(48)
        .margin(({ top: 8 }))
      Text("鸿蒙")
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
  }

  build() {
    Column() {
      Column() {
        // Distribute remaining space evenly along the main axis of the parent container.
        Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
          ForEach(this.list, () => {
            this.Item();
          }, (item: number, index: number) => JSON.stringify(item) + index)
        }

        // Distribute remaining space evenly along the main axis of the parent container.
        Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
          ForEach(this.list, () => {
            this.Item();
          }, (item: number, index: number) => JSON.stringify(item) + index)
        }
      }
      .width(this.rate * 100 + '%')
      .height(222)
      .padding({ top: 16 })
      .backgroundColor('#FFFFFF')
      .borderRadius(16)

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
  }
}