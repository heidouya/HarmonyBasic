@Entry
@Component
struct LPXPage {
  // lpx。视窗逻辑像素单位，lpx单位为实际屏幕宽度与逻辑宽度（通过designWidth配置）的比值，designWidth默认值为720。当designWidth为720时，在实际宽度为1440物理像素的屏幕上，1lpx为2px大小。
  build() {
    Column() {
      Text("vp")
        .width(375)
        .height(100)
        .fontSize(30)
        .backgroundColor(Color.Red)
        .textAlign(TextAlign.Center)
      Text("lpx")
        .width("375lpx")
        .height("100lpx")
        .fontSize(30)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
    }
  }
}