interface IHotItem {
  id: string
  title: string
}

@Entry
@ComponentV2
struct HotPage {
  hotList:IHotItem[] = [
    {
      id: "1",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    },
    {
      id: "2",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    },
    {
      id: "3",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    },
    {
      id: "4",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    },
    {
      id: "5",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    },
    {
      id: "6",
      title: "鸿蒙开发鸿蒙开发鸿蒙开发"
    }
  ];

  build() {
    Column() {
      ForEach(this.hotList, (item:IHotItem, index) => {
        HotItem({
          item,
          color:index == 0 ? "#ff403a" : index == 1 ? "#ff9500" : index == 2 ? "#fc0" : Color.Grey,
          index: index + 1 + ""
        })
      })
    }
    .width("100%")
  }
}

@Component
struct HotItem {
  @Prop item:IHotItem
  @Prop index:string
  @Prop color:ResourceColor = Color.Grey

  build() {
    Row({space: 10}) {
      Text(this.index).fontColor(this.color)
      Text(this.item.title)
    }
    .height(40)
    .justifyContent(FlexAlign.Center)
  }
}

export {}