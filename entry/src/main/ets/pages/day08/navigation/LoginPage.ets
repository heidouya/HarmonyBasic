@Component
struct LoginPage {
  build() {
    NavDestination() {
      Text("登录页").fontSize(30)
    }
  }
}

@Builder
export function LoginPageBuilder() {
  LoginPage()
}