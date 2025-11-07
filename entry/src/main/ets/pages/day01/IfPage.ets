@Entry
@Component
struct IfPage {
  @State count: number = 0;

  build() {
    Column() {
      if (this.count == 1) {
        Text("绿灯行")
          .fontColor(Color.Green)
      } else if (this.count == 2) {
        Text("黄灯等")
          .fontColor(Color.Yellow)
      } else {
        Text("红灯停")
          .fontColor(Color.Red)
      }

      Button('红灯')
        .onClick(() => {
          this.count = 3;
        })

      Button('黄灯')
        .onClick(() => {
          this.count = 2;
        })
      Button('绿灯')
        .onClick(() => {
          this.count = 1;
        })
    }
  }
}