// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-persistencev2
import { PersistenceV2, router } from "@kit.ArkUI"
import { IUser, User } from "./models/User";

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error('testTag1111', '%{public}s', `error key: ${key}, reason: ${reason}, message: ${msg}`);
});

@Entry
@ComponentV2
struct LoginPage4 {
  @Local userInfo:User = new User({} as IUser)
  build() {
    Column({space: 20}) {
      Button("存储").onClick(() => {
        this.userInfo = PersistenceV2.connect(User, () => new User({
          name: "123",
          password: "123"
        }))!;
      })
        .width("100%")
      Button("获取").onClick(() => {
        this.userInfo = PersistenceV2.connect(User, () => new User({
          name: "",
          password: ""
        }))!;
        console.log("this.userInfo" + JSON.stringify(this.userInfo))
      })
        .width("100%")
      Button("修改").onClick(() => {
        this.userInfo.name = "admin"
      })
        .width("100%")
      Button("跳转").onClick(() => {
        router.pushUrl({url:"pages/day05/MePage4"})
      })
        .width("100%")
      Text("PersistentV2存的值：").fontSize(20)
      Text("name: " + this.userInfo.name).fontSize(20)
      Text("password: " + this.userInfo.password).fontSize(20)
    }
    .padding({top:100})
  }
}

export {}