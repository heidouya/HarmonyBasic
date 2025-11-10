@Entry
@Component
struct IfPage {
  @State count: number = 0;

  build() {
    Column() {
      if (this.count % 3 == 0) {
        Text("绿灯行")
          .fontColor(Color.Green)
      } else if (this.count % 3 == 1) {
        Text("黄灯等")
          .fontColor(Color.Yellow)
      } else {
        Text("红灯停")
          .fontColor(Color.Red)
      }

      Button("切换灯").onClick(() => {
        this.count++
      })
    }
    .width("100%")
  }
}