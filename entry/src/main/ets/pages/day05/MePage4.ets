import { User } from "./models/User"
import { PersistenceV2, router } from "@kit.ArkUI"

@Entry
@ComponentV2
struct MePage1 {
  @Local userInfo:User = PersistenceV2.connect(User, () => new User({
    name: "",
    password: ""
  }))!;
  build() {
    Column({space: 20}) {
      Text("name: " + this.userInfo.name).fontSize(20)
      Text("password: " + this.userInfo.password).fontSize(20)
      Button("修改").onClick(() => {
        this.userInfo.password = "456"
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