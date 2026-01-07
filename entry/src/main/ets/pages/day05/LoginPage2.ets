// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-appstoragev2
/* AppStorageV2是提供状态变量在应用级全局共享的能力，开发者可以通过connect绑定同一个key，进行跨ability的数据共享。
使用限制：
1. 只支持class类型。
2. 不支持直接存储基本类型
*/
import { AppStorageV2, promptAction, router } from "@kit.ArkUI"
import { IUser, User } from "./models/User";
import { text } from "@kit.ArkGraphics2D";

@Entry
@ComponentV2
struct LoginPage1 {
  @Local userName:string = "admin"
  @Local password:string = "123"
  @Local token:string = "";
  @Local userInfo: User = new User({} as IUser)
  @Local userInfo2: User = new User({} as IUser)
  @Local keys:string[] = []
  build() {
    Scroll() {
      Column({space: 10}) {
        TextInput({text: this.userName!!})
        TextInput({text: this.password!!})
        Button("登录").onClick(() => {
          AppStorageV2.connect(String, () => new String("123"));
          this.userInfo2 = AppStorageV2.connect(User, () => new User({
            name: this.userName,
            password: this.password
          }))!;

          promptAction.showToast({
            message: "登录成功"
          })
        })
          .width("100%")
        Button("查").onClick(() => {
          this.userInfo = AppStorageV2.connect(User, () => new User({} as IUser))!;
          console.log("userInfo：", JSON.stringify(this.userInfo));
        })
          .width("100%")
        Button("删除").onClick(() => {
          AppStorageV2.remove(User)
          promptAction.showToast({
            message:"删除成功"
          })
        })
          .width("100%")
        Button("获取所有key").onClick(() => {
          this.keys = [];
          for (let key of AppStorageV2.keys()) {
            this.keys.push(key)
          }
        })
          .width("100%")
        Button("删除所有").onClick(() => {
          for (let key of AppStorageV2.keys()) {
            AppStorageV2.remove(key)
          }
        })
          .width("100%")
        Button("跳转").onClick(() => {
          router.pushUrl({
            url: "pages/day05/MePage2"
          }).catch((error:Error) => {
            console.log(error + "")
          })
        })
          .width("100%")
        Button("修改").onClick(() => {
          this.userInfo2.name = "aaa"
        })
          .width("100%")
        Button("存多个相同类型").onClick(() => {
          AppStorageV2.connect(User, "user1", () => new User({
            name: this.userName,
            password: this.password
          }))
          AppStorageV2.connect(User, "user2", () => new User({
            name: this.userName,
            password: this.password
          }))
        })
          .width("100%")
        ForEach(this.keys,(item:string, index)=>Text(`key${index + 1}：${item}`).fontSize(30))
        Text("AppStorageV2存储结果：").fontSize(30)
        Text("userName：" + this.userInfo.name).fontSize(30)
        Text("password：" + this.userInfo.password).fontSize(30)
      }
      .padding(20)
      .alignItems(HorizontalAlign.Start)
    }
  }
}

export {}