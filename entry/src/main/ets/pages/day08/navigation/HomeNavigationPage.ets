// 注意使用router_map.json配置路由，使用预览是看不到效果的，最起码要使用模拟器
@Entry
@Component
struct HomeNavigationPage {
  pageStack = new NavPathStack()
  build() {
    Navigation(this.pageStack) {
      Button("去我的页面")
        .onClick(() => {
          this.pageStack.pushPath({ name: "MeNavigationPage"});
        })
    }
    .title("首页")
  }
}

export {}