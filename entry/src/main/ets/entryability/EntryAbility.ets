import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import display from '@ohos.display'

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  private windowObj?: window.Window
  private curBp: string = ''

  // 根据当前窗口尺寸更新断点
  private updateBreakpoint(windowWidth: number): void {
    // 获取当前窗口所在的显示屏ID（用于后续获取屏幕参数）
    let displayId = this.windowObj?.getWindowProperties().displayId

    try {
      // 将像素单位(px)转换为虚拟像素单位(vp)：
      // 1. 通过displayId获取显示屏信息
      // 2. 使用像素密度(densityPixels)进行单位转换
      let windowWidthVp = windowWidth / display.getDisplayByIdSync(displayId).densityPixels

      // 根据转换后的vp宽度确定响应式断点
      let newBp: string = ''
      if (windowWidthVp < 320) {   // 超小屏幕设备（xs）
        newBp = 'xs'
      } else if (windowWidthVp < 600) {  // 小屏幕设备（sm）
        newBp = 'sm'
      } else if (windowWidthVp < 840) {  // 中等屏幕设备（md）
        newBp = 'md'
      } else {  // 大屏幕设备（lg）
        newBp = 'lg'
      }

      // 当断点发生变化时更新状态
      if (this.curBp !== newBp) {
        this.curBp = newBp
        // 将当前断点值存储到AppStorage实现全局状态共享
        AppStorage.setOrCreate('currentBreakpoint', this.curBp)
      }
    } catch(err) {
      // 异常处理：获取显示屏信息失败时打印错误码
      console.log("getDisplayByIdSync failed err"+err.code)
    }
  }

  // WindowStage创建后触发，用于加载UI和订阅窗口事件（如获焦/失焦、前后台切换）
  onWindowStageCreate(windowStage: window.WindowStage): void {

    // 获取主窗口对象（异步操作）
    windowStage.getMainWindow().then((windowObj) => {
      // 将获取的窗口对象保存到类的成员变量中
      this.windowObj = windowObj;

      // 获取应用启动时的窗口尺寸
      // 通过窗口属性获取初始窗口矩形区域的宽度
      this.updateBreakpoint(windowObj.getWindowProperties().windowRect.width);

      // 注册窗口尺寸变化事件监听器
      // 当窗口尺寸发生变化时触发回调函数
      windowObj.on('windowSizeChange', (windowSize) => {
        // 窗口尺寸变化时，使用新的宽度更新断点状态
        this.updateBreakpoint(windowSize.width);
      });
    }).catch((err: BusinessError) => {
      // 错误处理：捕获并打印Promise链中的异常
      console.log("窗口获取失败", JSON.stringify(err));
    });

    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/day12/BreakpointPage', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  // UIAbility实例创建时触发，仅执行一次，用于初始化轻量级业务逻辑。
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }

    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  // UIAbility销毁时触发，清理资源。
  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  // WindowStage被销毁时调用。
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  // 当WindowStage即将销毁时，系统触发该回调。开发者可以在该生命周期中取消windowStage事件的监听。
  onWindowStageWillDestroy(windowStage: window.WindowStage): void {
    console.log("onWindowStageWillDestroy")
  }

  // UIAbility从后台进入前台时触发，恢复资源或业务。
  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  // UIAbility从前台进入后台时触发，释放非必要资源。
  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }

  // 当已经启动的UIAbility实例再次被拉起时，系统会触发该回调。若在特定场景下（参见Scenarios），不需要触发该生命周期回调，可以使用setOnNewWantSkipScenarios接口设置。
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log("onNewWant")
  }
}