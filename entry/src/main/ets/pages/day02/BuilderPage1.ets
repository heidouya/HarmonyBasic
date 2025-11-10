/*
@Builder：轻量的UI元素复用，其内部UI结构固定，仅与使用方进行数据传递。开发者可将重复使用的UI元素抽象成函数，在build函数中调用。

@Builder装饰器有两种使用方式：
1. 私有自定义构建函数
2. 全局自定义构建函数

@Builder装饰器严格禁止在其内部定义状态变量或使用生命周期函数，必须通过参数传递或者访问所属组件的状态变量完成数据交互。

调用@Builder装饰的函数默认按值传递。当传递的参数为状态变量时，状态变量的改变不会引起@Builder函数内的UI刷新。所以当使用状态变量的时候，推荐使用按引用传递。
 * */
import { showTextBuilder3 } from './components/TextItemBuilder'

@Builder
function showTextBuilder1() {
  Text('全局自定义构建函数-内部')
    .fontSize(20)
    .fontWeight(FontWeight.Bold)
}

@Entry
@Component
struct BuilderPage1 {
  @Builder
  showTextBuilder2() {
    // @Builder装饰此函数，使其能以链式调用的方式配置并构建Text组件
    Text('私有自定义构建函数-无参')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }

  @Builder
  showTextValueBuilder(param: string) {
    Text(param)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }

  build() {
    Column({space: 20}) {
      // 全局
      showTextBuilder1()
      // 外部
      showTextBuilder3()

      // 无参数
      this.showTextBuilder2()
      // 有参数
      this.showTextValueBuilder("私有自定义构建函数-有参")
    }
    .width("100%")
  }
}