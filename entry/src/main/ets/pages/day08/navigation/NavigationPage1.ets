// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-navigation-navigation

// Navigation组件文档地址： https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-navigation

interface IParams {
  name:string
}

@Builder
function fancyText(val: string) {
  Text(val).fontSize(30)
}

@Entry
@Component
struct NavigationPage1 {
  pageInfos: NavPathStack = new NavPathStack();

  @Builder
  navDestination(name:string) {
    if (name == "detail") {
      Detail()
    } else if (name == "cart") {
      ShoppingCart()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: 20}) {
        Button("去详情页").onClick(() => {
          const params:IParams = {
            name: "detail"
          }
          this.pageInfos.pushPath({name: "detail",param: params})
        })
        Button("去购物车").onClick(() => {
          const params:IParams = {
            name: "cart"
          }
          this.pageInfos.pushPathByName("cart", params)
        })
      }
    }
    .title("首页")
    .navDestination(this.navDestination)
  }
}

@Component
struct Detail {
  pageInfos: NavPathStack = {} as NavPathStack;
  param:IParams = {} as IParams

  build() {
    // 作为子页面的根容器，用于显示Navigation的内容区。
    NavDestination() {
      Column({space: 20}) {
        fancyText("详情页")
        fancyText("通过路由接收到的参数")
        fancyText(JSON.stringify(this.param))
        Button("返回上一页").onClick(() => {
          this.pageInfos.pop()
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;

      // 接收传递的参数
      const param = context.pathInfo.param as IParams;
      this.param = param
    })
  }
}

@Component
struct ShoppingCart {
  pageInfos: NavPathStack = {} as NavPathStack;

  param:IParams = {} as IParams

  build() {
    NavDestination() {
      Column({space: 20}) {
        fancyText("购物车")
        fancyText("通过路由接收到的参数")
        fancyText(JSON.stringify(this.param))
        Button("返回上一页").onClick(() => {
          this.pageInfos.pop()
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;

      // 接收传递的参数
      const param = context.pathInfo.param as IParams;
      this.param = param
    })
  }
}

export {}