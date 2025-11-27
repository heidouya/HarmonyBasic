import { router } from '@kit.ArkUI';

// 自定义组件生命周期：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-custom-component-lifecycle#build
@Entry
@Component
struct LifeCirclePage {
  @State isShow:boolean = false;

  onPageShow() {
    console.log("onPageShow")
  }
  onPageHide() {
    console.log("onPageHide")
  }
  build() {
    Column() {
      if (this.isShow) {
        CustomComp()
      }
      Button("显示/隐藏").onClick(() => {
        this.isShow = !this.isShow
      })
      Button("下一页").onClick(() => {
        router.push({
          url: "pages/day06/onBackPressPage"
        })
      })
    }
  }
}

@Component
struct CustomComp{
  // aboutToAppear函数在创建自定义组件的新实例后，在其build()函数执行前调用。
  // 组件即将出现时触发（父组件onDidBuild后执行）。
  aboutToAppear() {
    console.log("aboutToAppear")
  }
  // onDidBuild函数在自定义组件的build()函数执行后调用，开发者可以在这个阶段实现埋点数据上报等不影响实际UI的功能。
  // 组件构建完成后触发。
  onDidBuild() {
    console.log("onDidBuild")
  }
  // aboutToDisappear函数在自定义组件析构销毁时执行。
  // 组件即将移除时触发。
  aboutToDisappear() {
    console.log("aboutToDisappear")
  }
  build() {
    Text("生命周期")
  }
}