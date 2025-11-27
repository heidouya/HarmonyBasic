@Entry
@Component
struct RelativeContainerPage {
  build() {
    // 相对布局组件，用于复杂场景中元素对齐的布局。
    RelativeContainer() {
      Text('text1')
      .width(100)
      .height(100)
      .textAlign(TextAlign.Center)
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
      .id("text1")

      Text('text2')
      .width(100)
      .height(100)
      .backgroundColor('#00ae9d')
      .textAlign(TextAlign.Center)
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End }
      })
      .id("text2")

      Text('text3')
      .height(100)
      .backgroundColor('#0a59f7')
      .textAlign(TextAlign.Center)
      .alignRules({
        top: { anchor: "text1", align: VerticalAlign.Bottom },
        left: { anchor: "text1", align: HorizontalAlign.End },
        right: { anchor: "text2", align: HorizontalAlign.Start }
      })
      .id("text3")

      Text('text4')
      .backgroundColor('#2ca9e0')
      .textAlign(TextAlign.Center)
      .alignRules({
        top: { anchor: "text3", align: VerticalAlign.Bottom },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "text1", align: HorizontalAlign.End }
      })
      .id("text4")

      Text('text5')
      .backgroundColor('#30c9f7')
      .textAlign(TextAlign.Center)
      .alignRules({
        right: {anchor:"__container__", align: HorizontalAlign.End},
        bottom: {anchor:"__container__", align: VerticalAlign.Bottom},
        top: {anchor: "text3", align: VerticalAlign.Bottom},
        left: {anchor: "text2", align: HorizontalAlign.Start}
      })
      .id("text5")
    }
    .width("100%").height(300)
    .border({ width: 2, color: "#6699FF" })
  }
}