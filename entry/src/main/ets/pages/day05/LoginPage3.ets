// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-appstorage
import { router } from "@kit.ArkUI"

// 应用级变量的状态管理： https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-state-management

// @ohos.arkui.StateManagement (状态管理) https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-statemanagement

// PersistentStorage：持久化存储UI状态 https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-persiststorage

PersistentStorage.persistProp("token", "");

@Entry
@Component
struct LoginPage3 {
  @State token:string = ""
  build() {
    Column({space: 20}) {
      Button("设置").onClick(() => {
        AppStorage.set("token", "123")
      })
        .width("100%")
      Button("获取").onClick(() => {
        this.token = AppStorage.get("token")!
      })
        .width("100%")
      Button("跳转").onClick(() => {
        router.pushUrl({url:"pages/day05/MePage3"})
      })
        .width("100%")
      Text("PersistentStorage存的值：").fontSize(20)
      Text(this.token).fontSize(20)
    }.padding({top:100})
  }
}

export {}