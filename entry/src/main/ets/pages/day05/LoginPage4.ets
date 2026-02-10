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
        PersistenceV2.connect(User, () => new User({
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
      Button("修改名字").onClick(() => {
        this.userInfo.name = "admin"
      })
        .width("100%")
      Button("修改密码").onClick(() => {
        this.userInfo.password = "admin"
        // 如果属性没有通过 @Trace 修饰
        // 1. 属性变化不会引起UI界面变化
        // 2. 需要手动调用 save 方法才能更新持久化数据
        PersistenceV2.save(User)
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