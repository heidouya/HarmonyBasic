import { mediaquery } from '@kit.ArkUI'

@Entry
@Component
struct MediaQueryPage1 {
  // 创建媒体查询监听器，监听视口宽度在[0vp,320vp)或[600vp,840vp)区间
  private listener: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync("(0vp<=width<320vp) or (600vp<=width<840vp)")

  @State color: Color = Color.Red

  // 页面显示时注册媒体查询监听
  aboutToAppear(): void {
    this.listener.on("change", (res: mediaquery.MediaQueryResult) => {
      if (res.matches) {
        this.color = Color.Orange
      } else {
        this.color = Color.Red
      }
    })
  }

  // 页面消失时取消媒体查询监听
  aboutToDisappear(): void {
    this.listener.off("change")
  }

  build() {
    Column()
      .width("100%")
      .height("100%")
      .backgroundColor(this.color)
  }
}