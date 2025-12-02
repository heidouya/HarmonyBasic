@Entry
@Component
struct RefreshListPage {
  list:number[] = [1, 2, 3, 4, 5, 6]
  @State isRefreshing: boolean = false

  @Builder
  refreshContent() {
    Text("下拉刷新中。。。")
  }
  build() {
    // refreshing: 组件当前是否处于刷新中状态。
    // builder：自定义刷新区域显示内容。
    Refresh({ refreshing: $$this.isRefreshing, builder:this.refreshContent() }) {
      List() {
        ForEach(this.list, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(80)
              .fontSize(30)
              .textAlign(TextAlign.Center)
          }
        })
      }
      .width('100%')
      .height('100%')
    }
    // 进入刷新状态时触发回调。
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 1000)
    })
  }
}