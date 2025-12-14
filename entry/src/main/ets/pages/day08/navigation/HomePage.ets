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
        if (target.pathInfo.name === 'ShoppingCar') {
          target.pathStack.pop();
          target.pathStack.pushPathByName('LoginPage', null);
        }
      }
    })
  }
  build() {
    Navigation(this.pageStack) {
      Column({space: 20}) {
        Button("去购物车").onClick(() => {
          this.pageStack.pushPath({name:"ShoppingCar"})
        })
      }
    }
    .title("首页")
  }
}

export {}