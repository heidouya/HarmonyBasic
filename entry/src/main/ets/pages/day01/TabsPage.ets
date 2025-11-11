@Entry
@ComponentV2
struct TabsPage {
  list = ["微信","通讯录","发现","我"];
  build() {
    Tabs({barPosition:BarPosition.End}) {
      ForEach(this.list, (item:string) => {
        TabContent(){
          Text(item)
        }.tabBar(item)
      })
    }
    .animationDuration(0)
  }
}