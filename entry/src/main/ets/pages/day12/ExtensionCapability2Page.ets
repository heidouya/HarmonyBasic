@Entry
@Component
struct ExtensionCapability2Page {
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
      Row({ space: 10 }) {
        List({ space: 10 }) {
          ForEach(this.appList, () => {
            ListItem() {
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
            }
            .width(80)
            .height(102)
          }, (item: number, index: number) => item.toString() + index)
        }
        .padding({ top: 16, left: 10 })
        // 设置List组件排列方向。
        .listDirection(Axis.Horizontal)
        .width('100%')
        .height(118)
        .borderRadius(16)
        .backgroundColor(Color.White)
      }
      .width(this.rate * 100 + '%')

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.background_secondary'))
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}