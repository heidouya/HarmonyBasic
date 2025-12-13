import { router } from '@kit.ArkUI'
interface IRouterParams {
  msg: string
}
@Entry
@Component
struct MeRouterPage {
  @State msg:string = ""
  aboutToAppear(): void {
    const obj = router.getParams() as IRouterParams
    this.msg = obj.msg
    console.log("当前在页面栈内的页面数量" + router.getLength())
  }
  build() {
    Column({space: 20}) {
      Text("我")
      Text("参数" + this.msg)
      Button("返回上一页").onClick(() => {
        router.back()
      })
      Button("清空页面栈").onClick((event: ClickEvent) => {
        // 清空页面栈中的所有历史页面，仅保留当前页面作为栈顶页面
        router.clear()
      })
    }
  }
}