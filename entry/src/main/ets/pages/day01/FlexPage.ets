import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct FlexPage {
  list = ["鸿蒙鸿蒙", "小米子", "ViVo", "oppo oppo", "苹果", "酷派", "鸿蒙鸿蒙", "小米子", "ViVo", "oppo oppo",]
  build() {
    Flex({
      wrap:FlexWrap.Wrap,
      space: {
        main: LengthMetrics.vp(10),
        cross: LengthMetrics.vp(10)
      },
      // direction: FlexDirection.Column
    }) {
      ForEach(this.list, (item:string)=>{
        Text(item)
          .padding(10)
          .backgroundColor("#f7f7f7")
      })
    }
  }
}