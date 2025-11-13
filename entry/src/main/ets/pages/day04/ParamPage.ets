// @Param装饰的变量支持本地初始化，但不允许在组件内部直接修改。
@Entry
@ComponentV2
struct ParamPage {
  @Local title:string="鸿蒙开发"
  build() {
    Column() {
      Text("父组件："+this.title)
      Button("改变标题").onClick((event: ClickEvent) => {
        this.title = "华为真棒"
      })
      HotItem({
        title: this.title
      })
    }
    .width("100%")
  }
}

@ComponentV2
struct HotItem {
  @Param title:string = "";
  build() {
    Text("子组件：" + this.title)
  }
}

export {}