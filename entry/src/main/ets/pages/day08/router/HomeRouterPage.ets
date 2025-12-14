import { router } from '@kit.ArkUI'
// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-router
// 新文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-router
@Entry
@Component
struct HomeRouterPage {
  build() {
    Column({space: 20}) {
      Text("首页")
      Button("跳转到我的页面-push").onClick(() => {
        router.pushUrl({
          url: "pages/day08/MeRouterPage",
          params: {
            msg: "hello"
          }
        })
      })
      Button("跳转到我的页面-replace").onClick((event: ClickEvent) => {
        router.replaceUrl({
          url: "pages/day08/MeRouterPage",
          params: {
            msg: "hello"
          }
        })
      })
    }
  }
}