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