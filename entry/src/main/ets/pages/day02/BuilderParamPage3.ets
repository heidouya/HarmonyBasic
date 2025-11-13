interface INewsItem {
  title:string
  origin:string,
  date:string
}

@Extend(Text)
function fancyText(fontSize:number = 15, fontColor:ResourceColor = Color.Grey) {
  .fontSize(fontSize)
  .fontColor(fontColor)
}

@Styles
function customWidth() {
  .width("100%")
}

@Builder
function NewsItem(item:INewsItem) {
  Column({space: 10}) {
    Text(item.title)
      .fancyText(20, Color.Black)
    Row({space:10}) {
      Text(item.origin)
        .fancyText()
      Text(item.date)
        .fancyText()
    }
    .customWidth()
  }
  .border({
    width: {bottom: 1},
    color:Color.Gray
  })
  .customWidth()
  .alignItems(HorizontalAlign.Start)
  .padding({top:10, bottom: 10})
}

@Entry
@Component
struct BuilderPage3 {
  list:INewsItem[] = [
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
  ];

  build() {
    Column() {
      NewsList({
        list: this.list,
        // @BuilderParam 传参
        // renderItem: (item:INewsItem) => {
        //   this.NewsItem(item as INewsItem)
        // }
        renderItem: NewsItem

        // renderItem:(item:INewsItem) => {
        //   NewsItem(item)
        // }
      })
    }
  }
}

@Component
struct NewsList {
  @Prop list:INewsItem[] = []

  @Builder defaultRender() {
    Text("默认内容")
  }
  @BuilderParam renderItem:(item:INewsItem)=>void = this.defaultRender;

  build() {
    List() {
      ForEach(this.list, (item:INewsItem) => {
        ListItem() {
          this.renderItem(item)
        }
      })
    }
    .width("100%")
    .height("100%")
  }
}

export {}