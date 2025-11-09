@Entry
@Component
struct VPPage {
  build() {
    /*
屏幕像素单位：px。屏幕上的实际像素，1px代表手机屏幕上的一个像素点。

视窗逻辑像素单位：lpx。视窗逻辑像素单位，lpx单位为实际屏幕宽度与逻辑宽度（通过designWidth配置）的比值，designWidth默认值为720。当designWidth为720时，在实际宽度为1440物理像素的屏幕上，1lpx为2px大小。
适用场景：确保组件在不同设备（如桌面、平板、手机等）上看起来一致时使用。

虚拟像素单位：vp。屏幕密度相关像素，根据屏幕像素密度转换为屏幕物理像素，当数值不带单位时，默认单位vp。vp与px的比例与屏幕像素密度有关。使用虚拟像素，使 UI 元素在不同密度的设备上具有一致性大小视觉感受。
适用场景：确保组件在不同屏幕尺寸上保持相对大小。

字体像素单位：fp。字体像素大小默认情况下与 vp 相同，即默认情况下 1 fp = 1 vp。如果用户在设置中选择了更大的字体，字体的实际显示大小就会在vp的基础上乘以scale系数，即 1 fp = 1 vp * scale。
     * */
    Column() {
      Text("字体vp")
        .width(100)
        .height(100)
        .fontSize(30)
        .backgroundColor(Color.Red)
      Text("字体fp")
        .width("100vp")
        .height("100vp")
        .fontSize("30fp")
        .backgroundColor(Color.Orange)
      Text()
        .width("100px")
        .height("100px")
        .backgroundColor(Color.Green)
    }
    .width("100%")
  }
}