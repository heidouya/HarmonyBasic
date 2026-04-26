/*
文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/responsive-layout-V5

断点：将窗口宽度划分为不同的范围（即断点），监听窗口尺寸变化，当断点改变时同步调整页面布局。

断点名称	              取值范围（vp）      典型设备场景
xs（超小屏幕）	        [0, 320）         智能穿戴设备（如手表）
sm（小屏幕）	          [320, 600)        手机竖屏模式
md（中等屏幕）	        [600, 840)        手机横屏/小型平板
lg（大屏幕）	          [840, +∞)         平板/折叠屏（展开状态）

其他断点：xl、xxl、xxxl等
*/
@Entry
@Component
struct BreakpointPage {
  @StorageProp('currentBreakpoint') curBp: string = 'sm'

  setColor() {
    switch (this.curBp) {
      case "sm":
        return Color.Red
      case "md":
        return Color.Orange
      case "lg":
        return Color.Blue
      default :
        return Color.Black
    }
  }

  build() {
    Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
      Text(this.curBp).fontSize(100).fontWeight(FontWeight.Medium).fontColor(this.setColor())
    }
    .width('100%')
    .height('100%')
  }
}
