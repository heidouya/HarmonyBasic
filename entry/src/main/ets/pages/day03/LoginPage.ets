import { PromptAction } from '@kit.ArkUI';
@Entry
@ComponentV2
struct LoginPage {
  @Local userName:string = ""
  @Local password:string = ""
  promptAction: PromptAction = this.getUIContext().getPromptAction();
  build() {
    Column({space: 20}) {
      // text 设置输入框当前的文本内容。
      // placeholder 设置无输入时的提示文本。
      // 在状态管理V2中，推荐使用!!语法糖统一处理双向绑定
      TextInput({text: this.userName!!, placeholder: "请输入用户名"})
        .onChange(() => {
        })
      TextInput({text:this.password!!, placeholder: "请输入密码"})
      // 设置输入框类型。
        .type(InputType.Password)
        .onChange(() => {
        })
      Button("登录").onClick(() => {
        if (this.userName == "admin" && this.password == "123") {
          try {
            this.promptAction.showToast({
              message: "登录成功"
            })
          } catch (error) {
            // TODO: Implement error handling.
          }
          this.userName = ""
          this.password = ""
        } else {
          try {
            this.promptAction.showToast({
              message: "用户名或密码错误"
            })
          } catch (error) {
            // TODO: Implement error handling.
          }
        }
      })
        .width("100%")
    }
    .padding(10)
  }
}