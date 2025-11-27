@Entry
@Component
struct StackPage {
  build() {
    // 堆叠布局，子组件按照顺序依次入栈，后一个子组件覆盖前一个子组件。
    // 设置子组件在容器内的对齐方式
    Stack({
      alignContent: Alignment.TopEnd
    }){
      Image($r("app.media.startIcon"))
        .width(100)
        // 设置组件的堆叠顺序。
        // .zIndex(1)
      Text("10")
        .width(30)
        .height(30)
        .textAlign(TextAlign.Center)
        .borderRadius(30)
        .backgroundColor(Color.Red)
        // 相对偏移，组件相对原本的布局位置进行偏移。
        .offset({bottom: 8})
    }
  }
}