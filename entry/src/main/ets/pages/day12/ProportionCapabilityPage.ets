/*
占比能力是指子组件的宽高按照预设的比例，随父容器组件发生变化。

占比能力通常有两种实现方式：
1. 将子组件的宽高设置为父组件宽高的百分比，详见尺寸设置及长度类型。
2. 通过layoutWeight属性配置互为兄弟关系的组件在父容器主轴方向的布局权重。

注意：仅当父容器是Row、Column或者Flex时，layoutWeight属性才会生效。
*/
@Entry
@Component
struct ProportionCapability {
  @State rate: number = 0.5;

  // Bottom slider - adjust container size through slider drag interaction.
  @Builder
  slider() {
    Row() {
      Slider({ value: 100, min: 25, max: 50 })
        .blockColor(Color.White)
        .width('60%')
        .height(50)
        .onChange((value: number) => {
          this.rate = value / 100;
        })
      Text(Math.floor(this.rate * 100) + "%").fontSize(30)
    }
  }

  build() {
    Column() {
      Row() {
        Row()
          .height(96)
          // 设置组件的布局权重，使组件在父容器（Row/Column/Flex）的主轴方向按照权重分配尺寸。
          .layoutWeight(1)
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)

        Row()
          .height(96)
          .layoutWeight(1)
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)

        Row()
          .height(96)
          .layoutWeight(1)
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
      }
      .width(this.rate * 100 + '%')
      .height(96)
      .borderRadius(16)
      .backgroundColor('#FFFFFF')

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
  }
}