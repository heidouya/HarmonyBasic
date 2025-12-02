@Entry
@Component
struct RefreshListPage2 {
  isLoading = false;
  @State list:number[] = [1, 2, 3, 4, 5, 6]
  @State isRefreshing: boolean = false

  @Builder
  refreshContent() {
    Text("下拉刷新中。。。")
  }
  build() {
    Refresh({ refreshing: $$this.isRefreshing, builder:this.refreshContent() }) {
      List() {
        ForEach(this.list, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(200)
              .fontSize(30)
              .textAlign(TextAlign.Center)
          }
        })
        ListItem() {
          Text("正在加载中...")
            .width("100%")
            .textAlign(TextAlign.Center)
        }
      }
      .width('100%')
      .height('100%')
      // 列表到达末尾位置时触发。
      .onReachEnd(() => {
        if (this.isLoading) return;

        this.isLoading = true

        setTimeout(() => {
          this.list.push(7, 8)
          this.isLoading = false;
        }, 1000)
      })
    }
    // 进入刷新状态时触发回调。
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 1000)
    })
  }
}