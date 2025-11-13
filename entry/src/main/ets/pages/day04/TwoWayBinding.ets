@Entry
@ComponentV2
struct BindingPage {
  @Local userName:string = "haha"
  build() {
    Column() {
      Text("父组件：" + this.userName)
      TextInput({text: this.userName!!})

      Text("子组件：" + this.userName)
      Input({
        userName: this.userName!!
      })
    }
  }
}

@ComponentV2
struct Input {
  @Param userName:string = ""
  @Event $userName: (userName:string) => void = () => {}

  build() {
    TextInput({text: this.userName!!})
      .onChange((val) => {
        this.$userName(val)
      })
  }
}