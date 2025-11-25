// import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct GridPage {
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  build() {
    // Flex({
    //   wrap:FlexWrap.Wrap,
    //   justifyContent:FlexAlign.SpaceEvenly,
    //   space: {
    //     main:LengthMetrics.vp(20),
    //     cross:LengthMetrics.vp(15)
    //   }
    // }) {
    //   ForEach(this.arr, () => IconItem())
    // }

    Grid() {
      ForEach(this.arr, () => {
        GridItem() {
          IconItem()
        }
      })
    }
    // 设置当前网格布局列的数量、固定列宽或最小列宽值，不设置时默认1列。
    .columnsTemplate("1fr 1fr 1fr")
    // 设置行与行的间距。设置为小于0的值时，按默认值显示。
    .rowsGap(10)
    .height(200) // 超出高度可以滚动
  }
}

@Component
struct IconItem {
  build() {
    Column({space: 5}) {
      Image($r("app.media.startIcon"))
        .width(60)
      Text("应用")
        .textAlign(TextAlign.Center)
    }
  }
}