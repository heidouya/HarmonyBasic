import { promptAction } from '@kit.ArkUI';

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
      message: "您要退出当前页面吗？"
    })
    this.isBack = true;
    return true; // 返回true
  }
  build() {
    Text("onBackPress")
  }
}