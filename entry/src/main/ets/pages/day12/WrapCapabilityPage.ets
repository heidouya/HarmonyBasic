// 折行能力是指容器组件尺寸发生变化，当布局方向尺寸不足以显示完整内容时自动换行。折行能力通过使用 Flex折行布局 （将wrap属性设置为FlexWrap.Wrap）实现，当横向布局尺寸不足以完整显示内容元素时，通过折行的方式，将元素显示在下方。
@Entry
@Component
struct WrapCapabilityPage {
  @State rate: number = 0.7;
  imageList: Resource [] = [
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon')
  ];

  @Builder
  slider() {
    Slider({ value: this.rate * 100, min: 40, max: 70 })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .onChange((value: number) => {
        this.rate = value / 100;
      })
      .position({ x: '20%', y: '87%' })
  }

  build() {
    Column() {
      Flex({
        alignItems: ItemAlign.Center,
        justifyContent: FlexAlign.Start,
        wrap: FlexWrap.Wrap
      }) {
        ForEach(this.imageList, (item: Resource) => {
          Image(item)
            .width(80)
            .height(80)
            .padding(10)
        }, (item: Resource, index: number) => item.toString() + index)
      }
      .backgroundColor($r('sys.color.comp_background_primary'))
      .padding(20)
      .width(this.rate * 100 + '%')
      .borderRadius(16)

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.background_secondary'))
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}