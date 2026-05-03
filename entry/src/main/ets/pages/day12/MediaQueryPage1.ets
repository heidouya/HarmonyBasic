/*
媒体查询是一种更通用、更灵活的监听机制，它允许开发者监听多种媒体特征的变化，而不仅仅是窗口宽度。这些特征包括：
1. 窗口尺寸（宽度、高度）
2. 屏幕方向（横屏、竖屏）
3. 外观模式（深色、浅色主题）
4. 设备类型（手机、平板、车机等1）
5. 分辨率、刷新率等
*/
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