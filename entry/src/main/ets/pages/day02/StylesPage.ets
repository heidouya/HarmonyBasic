// @Styles装饰器可以将多条样式设置提炼成一个方法，直接在组件声明的位置调用。通过@Styles装饰器可以快速定义并复用自定义样式。

// 定义在全局的@Styles封装的样式
// 1. @Styles不支持参数
// 2. 不支持在@Styles方法内使用逻辑组件
@Styles
function globalFancy () {
  .width(100)
  .height(100)
  .backgroundColor(Color.Orange)
}

@Entry
@Component
struct StylesPage {
  @State heightValue:number = 100
  // 定义在组件内的@Styles封装的样式
  @Styles fancy() {
    .width(100)
    .height(this.heightValue)
    .backgroundColor(Color.Red)
    .onClick(() => {
      this.heightValue = 200;
    })
  }

  build() {
    Column({space: 10}) {
      Text("鸿蒙")
        .globalFancy()
        .fontSize(30)
        .textAlign(TextAlign.Center)

      Text("鸿蒙")
        .globalFancy()
        .fontSize(30)
        .textAlign(TextAlign.Center)

      Text(this.heightValue + "")
        .fancy()
        .fontSize(30)
        .textAlign(TextAlign.Center)
    }
  }
}