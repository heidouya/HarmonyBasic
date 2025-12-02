@Entry
@Component
struct LoadMorePage {
  @State loadMore:boolean = true;
  @State isLoading:boolean = false;
  @State list:number[] = [1, 2]
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
          Text(this.loadMore ? "正在加载中..." : "暂无更多内容...")
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
          const res = [];
          if (res.length <= 0) {
            this.loadMore = false
          }
          this.list.push(...res)
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