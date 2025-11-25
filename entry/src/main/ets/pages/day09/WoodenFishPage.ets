@Entry
@Component
struct WoodenFishPage {
  @State tapCount:number = 0
  @State y: number = 0;
  @State opacitySize: number = 0;

  build() {
    Column({space: 130}) {
      Text(this.tapCount + "")
        .fontSize(30)
        .fontColor(Color.White)
      Column() {
        Text("功德+1")
          .translate({ x: 0, y: `${this.y}lpx` })
          .opacity(this.opacitySize)
          .fontColor(Color.White)
        Image($r("app.media.wooden_fish"))
          .width(200)
          .fillColor(Color.White)
          .clickEffect({
            scale: 0.8,
            level: ClickEffectLevel.LIGHT
          })
          .onClick(() => {
            this.tapCount++
            // 提供显式动画立即下发功能。
            // value: 设置动画效果相关参数。
            // event: 指定显示动效的闭包函数，在闭包函数中导致的状态变化系统会自动插入过渡动画。
            animateToImmediately({
              duration: 0,
              // 动画播放完成回调。
              onFinish: () => {
                animateToImmediately({
                  // 动画持续时间，单位为毫秒。
                  duration: 1000,
                }, () => {
                  this.y = -100
                  this.opacitySize = 0
                })
              }
            }, () => {
              this.y = 0
              this.opacitySize = 1
            })
          })
      }
    }
    .width("100%")
    .height("100%")
    .padding({top: 100})
    .backgroundColor("#2a2a2a")
  }
}