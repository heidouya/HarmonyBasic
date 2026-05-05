import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct GridRowPage1 {
  @State userName:string = ""
  @State password:string = ""
  @State currentBp: string = 'unknown'

  build() {
    Column() {
      Text(this.currentBp).fontSize(100)
      GridRow({
        // 设置布局列数
        // columns: 5,
        columns: {
          xs: 6,
          sm: 8,
          md: 10,
          lg: 12
        },
        // 栅格布局间距
        gutter: { x: 5, y: 10 },
        // 设置断点值的断点数列以及基于应用窗口或容器尺寸的相应参照
        breakpoints: {
          // 设置断点位置的单调递增数组
          value: ['400vp', '600vp', '800vp'],
          // 断点切换参照物 以窗口为参照
          reference: BreakpointsReference.WindowSize
        },
        // 栅格布局排列方向
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: {
            xs: 4,
            sm: 6,
            md: 8,
            lg: 10
          },
          offset: 1
        }) {
          Column({space: 20}) {
            TextInput({text: this.userName!!, placeholder: "请输入用户名"}).height(50)
            TextInput({text: this.password!!, placeholder: "请输入密码"}).height(50)
            Button("登录").width("100%").onClick(() => {
              if (this.userName == "admin" && this.password == "123") {
                promptAction.showToast({
                  message: "登录成功"
                })
              } else {
                promptAction.showToast({
                  message: "账号或密码错误，请重新输入"
                })
              }
            })
          }
        }
      }
      .width('100%')
      .height('100%')
      // 断点发生变化时触发回调
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }
  }
}