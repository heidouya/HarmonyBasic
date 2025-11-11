interface TabInterface {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}

@Entry
@Component
struct TabsBuilderPage {
  @State currentIndex: number = 0
  @State list: TabInterface[] = [{
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]

  @Builder
  tabBarItemBuilder (item: TabInterface) {
    Column () {
      Image(item.name === this.list[this.currentIndex].name ? item.selectIcon : item.icon)
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.currentIndex].name ? "#1AAD19" : "#2A2929")
        .margin({
          top: 5
        })
    }
  }

  build() {
    Tabs({barPosition: BarPosition.End, index: $$this.currentIndex}) {
      ForEach(this.list, (item:TabInterface) => {
        TabContent(){
          Text(item.title)
        }.tabBar(this.tabBarItemBuilder(item))
      })
    }
    .animationDuration(0)
  }
}