import { IUser, User } from "./models/User";
import { AppStorageV2, router } from "@kit.ArkUI";

@Entry
@ComponentV2
struct MePage1 {
  @Local userInfo:User = AppStorageV2.connect(User, ()=>new User({} as IUser))!;

  build() {
    Column({space: 20}) {
      Text("userName：" + this.userInfo?.name).fontSize(30)
      Text("password：" + this.userInfo?.password).fontSize(30)
      Button("退出登录").onClick(() => {
        AppStorageV2.remove(User)
        router.back()
      })
        .width("100%")

      Button("改").onClick(() => {
        this.userInfo.name = "manager"
        this.userInfo.password = "1"
      })
        .width("100%")
    }
    .alignItems(HorizontalAlign.Start)
  }
}

export {}