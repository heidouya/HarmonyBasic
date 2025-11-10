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
export function NewsItem(title:string, origin:string, date:string) {
  Column({space: 10}) {
    Text(title)
      .fancyText(20, Color.Black)
    Row({space:10}) {
      Text(origin)
        .fancyText()
      Text(date)
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