interface ITabItem {
  name: string
  icon: ResourceStr
  selectedIcon: ResourceStr
  title: string
}

@Entry
@Component
struct TabsBuilderPage {
  @State selectedIndex: number = 0
  @State list: ITabItem[] = [{
    icon: $r("app.media.ic_public_message"),
    selectedIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectedIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectedIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectedIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]

  @Builder
  tabBarItemBuilder (item: ITabItem) {
    Column () {
      Image(item.name === this.list[this.selectedIndex].name ? item.selectedIcon : item.icon)
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.selectedIndex].name ? "#1AAD19" : "#2A2929")
        .margin({
          top: 5
        })
    }
  }

  build() {
    Tabs({barPosition: BarPosition.End, index: $$this.selectedIndex}) {
      ForEach(this.list, (item:ITabItem) => {
        TabContent(){
          Text(item.title)
            .fontSize(50)
        }
        .tabBar(this.tabBarItemBuilder(item))
      })
    }
    .animationDuration(0)
  }
}