// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-router
import { router } from '@kit.ArkUI'

@Entry
@Component
struct HomeRouterPage {
  build() {
    Column({space: 20}) {
      Text("首页")
      Button("跳转到我的页面-push").onClick(() => {
        router.pushUrl({
          url: "pages/day08/router/MeRouterPage",
          params: {
            msg: "hello"
          }
        })
      })
      Button("跳转到我的页面-replace").onClick((event: ClickEvent) => {
        router.replaceUrl({
          url: "pages/day08/router/MeRouterPage",
          params: {
            msg: "hello"
          }
        })
      })
    }
  }
}