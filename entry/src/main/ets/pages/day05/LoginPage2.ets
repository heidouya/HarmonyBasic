import { AppStorageV2, PersistenceV2, router } from '@kit.ArkUI'
import { IUser, User } from './models/User'

// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-appstoragev2
/* AppStorageV2是提供状态变量在应用级全局共享的能力，开发者可以通过connect绑定同一个key，进行跨ability的数据共享。
使用限制：
1. 只支持class类型。
2. 不支持直接存储基本类型
*/
@Entry
@ComponentV2
struct LoginPage2 {
  @Local userName:string = "admin"
  @Local password:string = "123456"
  @Local user: User = {} as IUser;
  build() {
    Column({space: 20}) {
      TextInput({text:$$this.userName, placeholder: "请输入用户名"})
      TextInput({text:$$this.password, placeholder: "请输入密码"})
      Button("登录").onClick(() => {
        /*
        创建或获取存储的数据
        connect方法参数：
        1. type 指定的类型
        2. keyOrDefaultCreator 指定的key
        3. defaultCreator 获取默认值的构造器
        若未指定key，使用第二个参数作为默认构造器；否则使用第三个参数作为默认构造器
        */
        this.user = AppStorageV2.connect(User, "User", () => new User({
          name: this.userName,
          password: this.password
        })) as User;

        // 持久化
        PersistenceV2.connect(User, "User", ()=>new User({
          name: this.userName,
          password: this.password
        }))

        setTimeout(() => {
          router.pushUrl({
            url: "pages/day05/MePage"
          }).catch((error:Error) => {
            console.log(error + "")
          })
        }, 3000)
      })
        .width("100%")
      Text(this.user.name)
      Text(this.user.password)
    }
    .padding(20)
  }
}