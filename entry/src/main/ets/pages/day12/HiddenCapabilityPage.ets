// 隐藏能力通过设置布局优先级（displayPriority属性）来控制显隐，当布局主轴方向剩余尺寸不足以满足全部元素时，按照布局优先级大小，从小到大依次隐藏，直到容器能够完整显示剩余元素。具有相同布局优先级的元素将同时显示或者隐藏。
@Entry
@Component
struct HiddenCapabilityPage {
  @State rate: number = 0.8;

  @Builder
  slider() {
    Slider({ value: this.rate * 100, min: 10, max: 80 })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .onChange((value: number) => {
        this.rate = value / 100;
      })
      .position({ x: '20%', y: '80%' })
  }

  build() {
    Column() {
      Row() {
        Row()
          .width(48)
          .height(48)
          .displayPriority(1)
          .backgroundColor(Color.Orange)
          .padding({ left: 12, right: 12 })

        Row()
          .width(48)
          .height(48)
          // 设置当前组件在布局容器中显示的优先级。
          .displayPriority(2)
          .backgroundColor(Color.Yellow)
          .padding({ left: 12, right: 12 })

        Row()
          .width(48)
          .height(48)
          .displayPriority(3)
          .backgroundColor(Color.Red)
          .padding({ left: 12, right: 12 })

        Row()
          .width(48)
          .height(48)
          .displayPriority(2)
          .backgroundColor(Color.Pink)
          .padding({ left: 12, right: 12 })

        Row()
          .width(48)
          .height(48)
          .displayPriority(1)
          .backgroundColor(Color.Blue)
          .padding({ left: 12, right: 12 })
      }
      .width(this.rate * 100 + '%')
      .height(96)
      .borderRadius(16)
      .backgroundColor($r('sys.color.comp_background_primary'))
      .justifyContent(FlexAlign.Center)

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.background_secondary'))
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}