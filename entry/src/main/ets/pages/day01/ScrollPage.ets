@Entry
@Component
struct ScrollPage {
  build() {
    Column() {
      //  The 'Scroll' component can have only one child component.
      Scroll() {
        Column({space:10}) {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (item:number)=>ScrollItem({item}))
        }
      }
      .backgroundColor(Color.Orange)
      // 设置滚动方向。
      .scrollable(ScrollDirection.Vertical)
      // 设置边缘滑动效果。
      .edgeEffect(EdgeEffect.Spring)
    }
  }
}

@Component
struct ScrollItem {
  @Prop item:number;
  build() {
    Row(){
      Text(this.item+"")
    }
    .width("100%")
    .height(100)
    .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.Center)
  }
}