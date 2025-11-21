import { AppStorageV2, router } from '@kit.ArkUI'
import { User } from './models/User'

@Entry
@ComponentV2
struct HomePage {
  @Local user:User = AppStorageV2.connect(User, "User", () => new User({
    name: "",
    password: ""
  })) as User;

  build() {
    Column() {
      Text(this.user.name)
      Text(this.user.password)
      Button("退出").onClick(() => {
        // 使用remove接口只会将数据从AppStorageV2中删除，不影响组件中已创建的数据
        AppStorageV2.remove('User')
        this.user.name = ""
        this.user.password = ""
        router.back()
      })
      Text("AppStorageV2所有的key：" + AppStorageV2.keys())
    }
  }
}