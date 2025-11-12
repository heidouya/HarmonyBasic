@Entry
@Component
struct BuilderParamPage2 {
  @Builder
  leftBuilder() {
    Image($r("sys.media.ohos_ic_window_menu_back"))
      .width(20)
  }
  build() {
    // Text("你好")
    Column({space: 20}) {
      Header({
        leftContent: this.leftBuilder
      })
      Header()
    }
  }
}

@Component
struct Header {
  @Builder
  LeftContentBuilder() {
    Text("左")
  }
  @Builder
  CenterContentBuilder() {
    Text("中")
  }
  @Builder
  RightContentBuilder() {
    Text("右")
  }
  @BuilderParam
  leftContent:() => void = this.LeftContentBuilder
  @BuilderParam
  centerContent:() => void = this.LeftContentBuilder
  @BuilderParam
  rightContent:() => void = this.LeftContentBuilder

  build() {
    Row() {
      this.leftContent()
      this.centerContent()
      this.rightContent()
    }
    .width("100%")
    .height(60)
    .backgroundColor(Color.Orange)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
