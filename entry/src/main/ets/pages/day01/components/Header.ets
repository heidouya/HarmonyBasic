@Component
export default struct Header {
  build() {
    Row(){
      Text("Header")
        .width("100%")
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Red)
  }
}