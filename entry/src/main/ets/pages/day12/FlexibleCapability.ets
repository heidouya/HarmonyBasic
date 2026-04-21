// 文档地址：https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-multi-device-adaptive-layout

// 拉伸能力是指容器组件尺寸发生变化时，增加或减小的空间全部分配给容器组件内指定区域。拉伸能力通常通过Flex布局中的flexGrow和flexShrink属性实现。
@Entry
@Component
struct FlexibleCapability1 {
  @State sliderWidth: number = 600;
  @State width1:number = 150
  @State width2:number = 300
  @State width3:number = 300

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
        Row() {
          Text(this.width1 + "")
            .width("100%")
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .width(150)
        .height(400)
        .onAreaChange((oldValue, newValue) => {
          const newWidth = newValue.width as number
          this.width1 = Math.floor(newWidth)
        })
        .backgroundColor(Color.Green)
        // 仅当父容器宽度大于所有子组件宽度的总和时，该属性生效。配置了此属性的子组件，按照比例拉伸，分配父容器的多余空间。
        .flexGrow(1)
        // 仅当父容器宽度小于所有子组件宽度的总和时，该属性生效。配置了此属性的子组件，按照比例收缩，分配父容器的不足空间。
        .flexShrink(1)
        Row()
        {
          Text(this.width2 + "")
            .width("100%")
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .width(300)
        .height(400)
        .onAreaChange((oldValue, newValue) => {
          const newWidth = newValue.width as number
          this.width2 = Math.floor(newWidth)
        })
        .backgroundColor(Color.Yellow)
        .flexGrow(1)
        .flexShrink(1)
        Row()
        {
          Text(this.width3 + "")
            .width("100%")
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .width(150)
        .height(400)
        .onAreaChange((oldValue, newValue) => {
          const newWidth = newValue.width as number
          this.width3 = Math.floor(newWidth)
        })
        .backgroundColor(Color.Orange)
        .flexGrow(1)
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