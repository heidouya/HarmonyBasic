// @BuilderParam装饰的方法只能被自定义构建函数（@Builder装饰的方法）初始化。

interface IHotItem {
  id: string
  title: string
}

@Entry
@Component
struct BuilderParamPage1 {
  @Builder NewsIndex() {
    Image($r("app.media.like"))
      .width(10)
      .fillColor(Color.Red)
  }

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
  ]
  fixedData:IHotItem[] = [
    {
      "id": "0",
      "title": "鸿蒙开发鸿蒙开发鸿蒙开发",
    }
  ]

  build() {
    Column() {
      HotItem({
        item: this.fixedData[0],
        newsIndex: this.NewsIndex
      })
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

  @Builder NewsIndex(index:string) {
    Text(index).fontColor(this.color)
  }

  @BuilderParam newsIndex:(index:string) => void = this.NewsIndex

  build() {
    Row({space: 10}) {
      this.newsIndex(this.index)
      Text(this.item.title)
    }
    .height(40)
    .justifyContent(FlexAlign.Start)
  }
}

export {}