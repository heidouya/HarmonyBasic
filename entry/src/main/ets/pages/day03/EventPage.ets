import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct EventPage {
  build() {
    Column() {
      TextInput().onChange(() => {
        try {
          promptAction.showToast({
            message: "改变了"
          })
        } catch (error) {
          // TODO: Implement error handling.
        }
      })
      Button("点我").onClick(() => {
        try {
          promptAction.showToast({
            message: "点击了"
          })
        } catch (error) {
          // TODO: Implement error handling.
        }
      })
    }
  }
}