// 文档地址：https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-multi-device-adaptive-layout

// 拉伸能力是指容器组件尺寸发生变化时，增加或减小的空间全部分配给容器组件内指定区域。拉伸能力通常通过Flex布局中的flexGrow和flexShrink属性实现。
@Entry
@Component
struct FlexibleCapability1 {
  @State sliderWidth: number = 1000;

  @Builder
  slider() {
    Row() {
      Slider({ value: this.sliderWidth, min: 300, max: 750 })
        .blockColor(Color.White)
        .width('60%')
        .onChange((value: number) => {
          this.sliderWidth = value;
        })
      Text(this.sliderWidth + "").fontSize(30)
    }
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Row()
          .width(150)
          .height(400)
          .backgroundColor(Color.Green)
          // 仅当父容器宽度大于所有子组件宽度的总和时，该属性生效。配置了此属性的子组件，按照比例拉伸，分配父容器的多余空间。
          .flexGrow(0)
          // 仅当父容器宽度小于所有子组件宽度的总和时，该属性生效。配置了此属性的子组件，按照比例收缩，分配父容器的不足空间。
          .flexShrink(1)
        Row()
          .width(300)
          .height(400)
          .backgroundColor(Color.Yellow)
          .flexGrow(1)
          .flexShrink(0)
        Row()
          .width(150)
          .height(400)
          .backgroundColor(Color.Orange)
          .flexGrow(0)
          .flexShrink(1)
      }
      .width(this.sliderWidth)

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}