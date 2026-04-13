import { router } from '@kit.ArkUI';

// 自定义组件生命周期：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-custom-component-lifecycle#build
@Entry
@Component
struct LifeCirclePage {
  @State isShow:boolean = true;

  // 页面显示时（如路由跳转至该页、应用从后台回到前台）
  onPageShow() {
    console.log("parent onPageShow")
  }
  // 页面隐藏时（如跳转到其他页、应用退到后台）
  onPageHide() {
    console.log("parent onPageHide")
  }
  /*
  用户点击返回键
  返回值：
    true：拦截默认返回逻辑（如弹出“确认离开”提示）
    false：执行默认返回行为。
  */
  onBackPress() {
    console.log("parent onBackPress")
  }

  aboutToAppear() {
    console.log("parent aboutToAppear")
  }

  onDidBuild() {
    console.log("parent onDidBuild")
  }

  aboutToDisappear() {
    console.log("parent aboutToDisappear")
  }

  build() {
    Column({space: 20}) {
      Button("显示/隐藏子组件").onClick(() => {
        this.isShow = !this.isShow
      })
      Button("下一页").onClick(() => {
        router.push({
          url: "pages/day06/onBackPressPage"
        })
      })
      Text("---下面是子组件---").fontSize(30)
      if (this.isShow) {
        Child()
      }
    }
    .padding({top: 50})
  }
}

@Component
struct Child{
  // aboutToAppear函数在创建自定义组件的新实例后，在其build()函数执行前调用。
  // 组件即将出现时触发（父组件onDidBuild后执行）。
  aboutToAppear() {
    console.log("child aboutToAppear")
  }

  // onDidBuild函数在自定义组件的build()函数执行后调用，开发者可以在这个阶段实现埋点数据上报等不影响实际UI的功能。
  // 组件构建完成后触发。
  onDidBuild() {
    console.log("child onDidBuild")
  }

  // aboutToDisappear函数在自定义组件析构销毁时执行。
  // 组件即将移除时触发。
  aboutToDisappear() {
    console.log("child aboutToDisappear")
  }

  build() {
    Text("我是子组件").fontSize(30)
  }
}