// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style

// 定义在全局的@Styles封装的样式
// 1. @Styles不支持参数
// 2. 不支持在@Styles方法内使用逻辑组件
// 3. 只能在当前文件内使用@Styles，不支持export

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
      Text("鸿蒙1")
        .globalFancy()
        .fontSize(20)
        .textAlign(TextAlign.Center)

      Text("鸿蒙2")
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