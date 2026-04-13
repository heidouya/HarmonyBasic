import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct OnBackPressPage {
  isBack = false;

  // 当用户点击返回按钮时触发，仅@Entry装饰的自定义组件生效。
  onBackPress() {
    console.log("onBackPress")
    if (this.isBack) {
      return false;
    }
    promptAction.showToast({
      message: "再次点击您将退出当前页面？"
    })
    this.isBack = true;
    return true; // 返回true
  }

  build() {
    Column() {
      Text("onBackPress")
        .fontSize(30)
      Button("返回上一页").onClick((event: ClickEvent) => {
        router.back()
      })
    }
    .padding({top: 50})
  }
}