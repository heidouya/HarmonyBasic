@Entry
@Component
struct HomePage {
  pageStack = new NavPathStack()
  aboutToAppear(): void {
    this.pageStack.setInterception({
      willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
        operation: NavigationOperation, animated: boolean) => {
        if (typeof to === "string") {
          console.info("target page is navigation home page.");
          return;
        }
        // 将跳转到 ShoppingCar 的路由重定向到 LoginPage
        let target: NavDestinationContext = to as NavDestinationContext;
        const isFromLoginPage = typeof from !== "string" &&
          (from as NavDestinationContext).pathInfo.name === 'LoginPage';
        if (target.pathInfo.name === 'ShoppingCar'&& !isFromLoginPage) {
          target.pathStack.pop();
          target.pathStack.pushPath({name: "LoginPage"})
        }
      }
    })
  }
  build() {
    Navigation(this.pageStack) {
      Column({space: 20}) {
        Text("首页").fontSize(30)
        Button("去购物车").onClick(() => {
          this.pageStack.pushPath({name:"ShoppingCar"})
        })
      }
      .padding({top: 50})
    }
  }
}

export {}