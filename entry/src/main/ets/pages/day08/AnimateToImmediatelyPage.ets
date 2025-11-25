@Entry
@Component
struct AnimateToImmediatelyPage {
  @State y:number = 0
  @State opacitySize:number = 1;
  build() {
    Column() {
      Text("功德+1")
        .opacity(this.opacitySize)
        .translate({ x: 0, y: `${this.y}lpx` })
        .backgroundColor(Color.Orange)

      Button("动画").onClick(() => {
        animateToImmediately({
          duration: 1000,
          onFinish:() => {
            this.y = 0
            this.opacitySize = 0
          }
        }, () => {
          this.y = -100
          this.opacitySize = 1
        })
      })
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Orange)
    .justifyContent(FlexAlign.Center)
  }
}