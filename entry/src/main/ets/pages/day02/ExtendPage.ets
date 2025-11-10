// @Extend，用于扩展组件样式
// 1. @Extend仅支持在全局定义，不支持在组件内部定义。
// 2. @Extend装饰的方法支持参数
// 3. @Extend的参数可以为状态变量
// 4. @Extend支持封装指定组件的私有属性、私有事件和自身定义的全局方法
// 5. 不支持导出
@Extend(Text)
function fancyText() {
  .width(100)
  .height(100)
  // Text 组件特有属性
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function superFancyText(fontSize:number, weightValue: number, color: Color) {
  .fontSize(fontSize)
  .fontWeight(weightValue)
  .backgroundColor(color)
  .onClick(() => {
  })
  .fancyText()
}

@Entry
@Component
struct ExtendPage {
  // Use the '@Extend(Text)' decorator only in the global scope. <ArkTSCheck>
  // @Extend(Text)

  @State fontSize: number = 20;
  build() {
    Column({ space: 10 }) {
      Text("鸿蒙")
        .superFancyText(this.fontSize, 100, Color.Blue)
      Text("鸿蒙")
        .superFancyText(this.fontSize, 200, Color.Pink)
      Text("鸿蒙")
        .superFancyText(this.fontSize, 300, Color.Orange)
      Button("调整字体").onClick(() => {
        this.fontSize++
      })
    }
    .width("100%")
  }
}
