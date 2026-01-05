// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-appstorage

// 应用级变量的状态管理： https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-state-management

// @ohos.arkui.StateManagement (状态管理) https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-statemanagement

// PersistentStorage：持久化存储UI状态 https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-persiststorage
import { PersistenceV2, promptAction, router } from "@kit.ArkUI"
import { IUser } from "./models/User";

@Entry
@Component
struct LoginPage1 {
  @State userName:string = "admin"
  @State password:string = "123"
  @State token:string = "";
  @State userInfo: IUser = {} as IUser
  build() {
    Column({space: 10}) {
      TextInput({text: this.userName!!})
      TextInput({text: this.password!!})
      Button("登录").onClick(() => {
        AppStorage.SetOrCreate("token", "123");
        AppStorage.SetOrCreate("userInfo", {
          name: this.userName,
          password: this.password
        })
        promptAction.showToast({
          message: "登录成功"
        })
      })
        .width("100%")
      Button("查").onClick(() => {
        this.token = AppStorage.get("token") ?? "";
        console.log("token：", this.token);
        this.userInfo = AppStorage.get("userInfo") ?? {} as IUser
        console.log("userInfo：", JSON.stringify(this.userInfo));
      })
        .width("100%")
      Button("删").onClick(() => {
        const flag1 = AppStorage.delete("token")
        const flag2 = AppStorage.delete("userInfo")
        promptAction.showToast({
          message: flag1 || flag2 ? "删除成功" : "删除失败"
        })
        console.log(flag1 + "")
        console.log(flag2 + "")
      })
        .width("100%")
      Button("删除所有").onClick(() => {
        const flag = AppStorage.clear()
        promptAction.showToast({
          message: flag ? "删除成功" : "删除失败"
        })
        console.log(flag + "")
      })
        .width("100%")
      Button("跳转").onClick(() => {
        router.pushUrl({
          url: "pages/day05/MePage1"
        }).catch((error:Error) => {
          console.log(error + "")
        })
      })
        .width("100%")
      Button("获取所有key").onClick(() => {
        for (let key of AppStorage.keys()) {
          console.log(`key: ${key}`)
        }
      })
        .width("100%")
      Text("AppStorage存储结果：").fontSize(30)
      Text("token：" + this.token).fontSize(30)
      Text("userName：" + this.userInfo.name).fontSize(30)
      Text("password：" + this.userInfo.password).fontSize(30)
    }
    .padding(20)
    .alignItems(HorizontalAlign.Start)
  }
}

export {}