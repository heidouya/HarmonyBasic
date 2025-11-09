export {}
@Entry
@Component
struct ListPage {
  build() {
    Column(){
      TextInput({placeholder:"鸿蒙开发"})
      List() {
        ForEach([1,2,3,4,5,6,7,8,9,10], ()=>{
          ListItem(){
            NewsItem()
          }
        })
      }
      .width("100%")
      .height("100%")
    }.padding(10)
  }
}

@Component
struct NewsItem {
  build() {
    Column({space:10}){
      Text("苹果50周年：押注Apple Intelligence与折叠屏iPhone，能否开启下一个十年？")
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row() {
        Text() {
          Span("华尔街见闻 ")
          Span(" 前天19:20")
        }
        .fontSize(15)
        .fontColor(Color.Gray)
      }
    }
    .width("100%")
    .height(100)
    .border({
      width: {bottom: 1},
      color: Color.Grey,
      style: BorderStyle.Solid
    })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.Start)
  }
}