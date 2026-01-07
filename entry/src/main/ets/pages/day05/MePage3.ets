import { router } from "@kit.ArkUI"

@Entry
@Component
struct MePage1 {
  @StorageLink("token") token:string = ""
  build() {
    Column({space: 20}) {
      Text("token：" + this.token).fontSize(30)
      Button("修改").onClick(() => {
        this.token = "456"
      })
        .width("100%")
      Button("返回").onClick(() => {
        router.back()
      })
        .width("100%")
    }.padding({top: 100})
  }
}

export {}