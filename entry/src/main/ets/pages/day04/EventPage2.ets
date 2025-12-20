// 为了实现子组件向父组件要求更新@Param装饰变量的能力，开发者可以使用@Event装饰器。
// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-event

@Entry
@ComponentV2
struct EventPage2 {
  @Local title:string = "鸿蒙开发"

  changeTitle(val:string) {
    console.log(val)
    this.title = val
    console.log(val,this.title)
  }

  build() {
    Column() {
      Text("父组件：" + this.title)
      HotItem({
        title: this.title,
        changeTitle: (val: string) => {
          this.title = val
        }
      })
    }
    .width("100%")
  }
}

@ComponentV2
struct HotItem {
  @Param title:string = "";
  @Event changeTitle: (val:string) => void = () => {}

  build() {
    Text("子组件：" + this.title)
      .onClick(() => {
        // this.title = ""
        this.changeTitle("子组件修改")
      })
  }
}

export {}