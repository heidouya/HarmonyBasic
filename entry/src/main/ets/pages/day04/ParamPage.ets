@Entry
@ComponentV2
struct ParamPage {
  @Local title:string="鸿蒙开发"
  build() {
    Column({space:20}) {
      Text("父组件："+this.title).fontSize(30)
      Button("父组件修改").onClick(() => {
        this.title = "华为真棒"
      })
      HotItem({
        title: this.title
      })
    }
    .width("100%")
  }
}

// @Param装饰的变量支持本地初始化，但不允许在组件内部直接修改。
@ComponentV2
struct HotItem {
  @Require @Param title:string;
  build() {
    Column({space:20}) {
      Text("子组件：" + this.title).fontSize(30)
      Button("子组件修改").onClick(() => {
        // this.title = "子组件修改"
      })
    }
  }
}

export {}