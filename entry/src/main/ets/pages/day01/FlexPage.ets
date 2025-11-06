import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct FlexPage {
  build() {
    // 元素超出不换行
    // Row() {
    //   Text("鸿蒙开发").padding(10)
    //   Text("鸿蒙开发").padding(10)
    //   Text("鸿蒙开发").padding(10)
    //   Text("鸿蒙开发").padding(10)
    //   Text("鸿蒙开发").padding(10)
    // }
    
    Flex({
      wrap:FlexWrap.Wrap,
      space: {
        main: LengthMetrics.vp(10),
        cross: LengthMetrics.vp(10)
      },
      // direction: FlexDirection.Column
    }) {
      Text("鸿蒙开发").padding(10).backgroundColor(Color.Gray)
      Text("鸿蒙开发").padding(10).backgroundColor(Color.Gray)
      Text("鸿蒙开发").padding(10).backgroundColor(Color.Gray)
      Text("鸿蒙开发").padding(10).backgroundColor(Color.Gray)
      Text("鸿蒙开发").padding(10).backgroundColor(Color.Gray)
    }
  }
}