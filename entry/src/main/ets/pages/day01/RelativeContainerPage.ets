@Entry
@Component
struct RelativeContainerPage {
  build() {
    // 相对布局组件，用于复杂场景中元素对齐的布局。
    RelativeContainer() {
      Row() {
        Text('row1')
      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor('#a3cf62')
      // alignRules 设置在相对容器中子组件的对齐规则，仅当父容器为RelativeContainer时生效
      // 自己的 left middle right
      // 自己的 top center bottom
      .alignRules({
        top: {
          // 设置作为锚点的组件的id值。
          anchor: "__container__",
          align: VerticalAlign.Top
        },
        left: {
          anchor: "__container__",
          align: HorizontalAlign.Start
        }
      })
      .id("row1")

      Row() {
        Text('row2')
      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor('#00ae9d')
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End }
      })
      .id("row2")

      Row() {
        Text('row3')
      }
      .justifyContent(FlexAlign.Center)
      .height(100)
      .backgroundColor('#0a59f7')
      .alignRules({
        top: { anchor: "row1", align: VerticalAlign.Bottom },
        left: { anchor: "row1", align: HorizontalAlign.End },
        right: { anchor: "row2", align: HorizontalAlign.Start }
      })
      .id("row3")

      Row() {
        Text('row4')
      }.justifyContent(FlexAlign.Center)
      .backgroundColor('#2ca9e0')
      .alignRules({
        top: { anchor: "row3", align: VerticalAlign.Bottom },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "row1", align: HorizontalAlign.End }
      })
      .id("row4")

      Row() {
        Text('row5')
      }.justifyContent(FlexAlign.Center)
      .backgroundColor('#30c9f7')
      .alignRules({
        right: {anchor:"__container__", align: HorizontalAlign.End},
        bottom: {anchor:"__container__", align: VerticalAlign.Bottom},
        top: {anchor: "row3", align: VerticalAlign.Bottom},
        left: {anchor: "row2", align: HorizontalAlign.Start}
      })
      .id("row5")
    }
    .width("100%").height(300)
    .border({ width: 2, color: "#6699FF" })
  }
}