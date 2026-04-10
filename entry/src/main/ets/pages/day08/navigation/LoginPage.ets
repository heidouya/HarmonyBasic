@Component
struct LoginPage {
  pathStack: NavPathStack = {} as NavPathStack;;

  build() {
    NavDestination() {
      Column() {
        Text("登录页").fontSize(30)
        Button("登录成功").onClick(() => {
          this.pathStack.replacePath({ name: 'ShoppingCart' });
        })
      }
      .padding({top: 50})
    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

@Builder
export function LoginPageBuilder() {
  LoginPage()
}