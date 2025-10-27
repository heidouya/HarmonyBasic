@Component
export default struct Footer {
  build() {
    Row(){
      Text("Footer")
        .width("100%")
        .textAlign(TextAlign.Center)
    }
    .width("100%")
    .height(50)
    .backgroundColor(Color.Yellow)
  }
}