// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-binding
@Entry
@ComponentV2
struct BindingPage {
  @Local userName:string = "haha"
  build() {
    Column() {
      Text("父组件：" + this.userName)
      TextInput({text: this.userName!!})

      InputComp({
        userName: this.userName!!
      })






      // InputComp({
      //   userName: this.userName,
      //   $userName: (val: string) => { this.userName = val; }
      // })
    }
  }
}

@ComponentV2
struct InputComp {
  @Param userName:string = ""
  @Event $userName: (userName:string) => void = () => {}

  build() {
    Column() {
      Text("子组件：" + this.userName)
      TextInput({text: this.userName})
        .onChange((val) => {
          this.$userName(val)
        })
    }
  }
}