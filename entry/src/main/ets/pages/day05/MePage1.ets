import { IUser } from "./models/User";
import { router } from "@kit.ArkUI";

@Entry
@Component
struct MePage1 {
  @StorageLink("token") token:string = ""
  @StorageProp("userInfo") userInfo: IUser = {} as IUser;
  build() {
    Column({space: 20}) {
      Text("token：" + this.token).fontSize(30)
      Text("userName：" + this.userInfo?.name).fontSize(30)
      Text("password：" + this.userInfo?.password).fontSize(30)
      Button("退出登录").onClick(() => {
        AppStorage.delete("token")
        AppStorage.delete("userInfo")

        router.back()
      })
        .width("100%")

      Button("改").onClick(() => {
        this.token = "456"
      })
        .width("100%")
    }
    .alignItems(HorizontalAlign.Start)
  }
}

export {}