interface IParams {
  name:string
  age:number
}

@Entry
@Component
struct HomeParamsPage {
  params:IParams = {
    name: "hi",
    age: 19
  }
  pageStack = new NavPathStack()
  build() {
    Navigation(this.pageStack) {
      Button("去我的页面")
        .onClick(() => {
          // this.pageStack.pushPath({ name: "MeParamsPage", param: this.params});
          this.pageStack.pushPathByName("MeParamsPage", this.params, (popInfo) => {
            console.log("popInfo：" + JSON.stringify(popInfo))
          });
        })
    }
    .title("首页-带参数")
  }
}

export {}