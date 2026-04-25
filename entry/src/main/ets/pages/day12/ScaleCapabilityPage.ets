// 缩放能力是指子组件的宽高按照预设的比例，随容器组件发生变化，且变化过程中子组件的宽高比不变。
// 缩放能力通过使用百分比布局配合固定宽高比（aspectRatio属性）实现当容器尺寸发生变化时，内容自适应调整。
@Entry
@Component
struct ScaleCapability {
  @State sliderWidth: number = 220;
  @State sliderHeight: number = 220;

  @Builder
  slider() {
    Row() {
      Text("宽：").fontSize(30)
      Slider({
        value: this.sliderWidth,
        min: 100,
        max: 220,
        style: SliderStyle.OutSet
      })
        .blockColor(Color.White)
        .width('60%')
        .height(50)
        .onChange((value: number) => {
          this.sliderWidth = value;
        })
      Text(this.sliderWidth + "").fontSize(30)
    }
    Row() {
      Text("高：").fontSize(30)
      Slider({
        value: this.sliderHeight,
        min: 100,
        max: 220,
        style: SliderStyle.OutSet
      })
        .blockColor(Color.White)
        .width('60%')
        .height(50)
        .onChange((value: number) => {
          this.sliderHeight = value;
        })
      Text(this.sliderHeight + "").fontSize(30)
    }
  }

  build() {
    Column() {
      Column() {
        Column() {
          Image($r('app.media.startIcon'))
            .width('100%')
            .height('100%')
        }
        // 指定当前组件的宽高比，aspectRatio=width/height。设置aspectRatio属性后，组件宽高会受父组件内容区大小限制
        .aspectRatio(1)
      }
      .backgroundColor(Color.Orange)
      .height(this.sliderHeight)
      .width(this.sliderWidth)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      this.slider()
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}