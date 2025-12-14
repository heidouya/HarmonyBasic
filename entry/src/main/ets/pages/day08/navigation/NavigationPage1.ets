// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-navigation-navigation

// Navigation组件文档地址： https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-navigation

interface IParams {
  name:string
  age:number
}

@Entry
@Component
struct NavigationPage1 {
  params:IParams = {
    name: "hi",
    age: 18
  }
  pageInfos: NavPathStack = new NavPathStack();

  @Builder
  navDestination(name:string, param:IParams) {
    if (name == "detail") {
      // 作为子页面的根容器，用于显示Navigation的内容区。
      NavDestination() {
        Text(JSON.stringify(param)).fontSize(30)
      }
    }
  }
  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button("去详情页").onClick(() => {
          this.pageInfos.pushPath({name: "detail",param: this.params})
        })
      }
    }
    // 设置页面标题。
    .title("首页")
    // 创建NavDestination组件。使用builder函数，基于name和param构造NavDestination组件。
    .navDestination(this.navDestination)
  }
}

export {}