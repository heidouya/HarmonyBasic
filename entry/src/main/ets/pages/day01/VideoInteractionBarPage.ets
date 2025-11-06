interface IVideoInteractionItem{
  icon: string,
  count: string
}

@Entry
@Component
struct VideoInteractionBarPage {
  private VideoInteractionItems:IVideoInteractionItem[] = [
    {
      icon:"app.media.like",
      count: "5万"
    },
    {
      icon:"app.media.comment",
      count: "4万"
    },
    {
      icon:"app.media.collect",
      count: "3万"
    },
    {
      icon:"app.media.share",
      count: "2万"
    }
  ]
  build() {
    Column({space:20}) {
      ForEach(this.VideoInteractionItems, (item:IVideoInteractionItem) => VideoInteractionItem({item}))
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct VideoInteractionItem {
  @Prop item: IVideoInteractionItem;
  build() {
    Column({space: 20}) {
      Image($r(this.item.icon))
        .width(30)
        .height(30)
        .fillColor(Color.White)
      Text(this.item.count)
        .fontColor(Color.White)
    }
  }
}