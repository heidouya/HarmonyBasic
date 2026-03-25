/*
@Builder：轻量的UI元素复用，其内部UI结构固定，仅与使用方进行数据传递。开发者可将重复使用的UI元素抽象成函数，在build函数中调用。

@Builder装饰器有两种使用方式：
1. 私有自定义构建函数
2. 全局自定义构建函数

@Builder装饰器严格禁止在其内部定义状态变量或使用生命周期函数，必须通过参数传递或者访问所属组件的状态变量完成数据交互。

调用@Builder装饰的函数默认按值传递。当传递的参数为状态变量时，状态变量的改变不会引起@Builder函数内的UI刷新。所以当使用状态变量的时候，推荐使用按引用传递。

优先使用 @Builder 的场景：
1. 简单UI片段复用。重复性高、逻辑简单的UI结构（如统一样式的按钮、卡片标题栏）
无需独立状态管理，仅依赖父组件数据；
2.需要访问父组件状态。局部@Builder可直接通过this访问父组件的状态变量
3. 实现组件插槽（Slot）。通过@BuilderParam实现动态内容注入

优先使用 自定义组件 的场景：
1. 复杂独立功能模块。需要内部状态管理（如表单输入、计时器）；包含独立生命周期或事件处理逻辑
2. 跨文件/模块复用。需在多处调用的完整功能单元（如登录框、导航栏）；支持通过构造函数传递参数
3. 需要样式隔离。避免样式污染，组件内样式自动隔离
 * */
import { showTextBuilder3 } from './components/TextItemBuilder'

@Builder
function showTextBuilder1() {
  Text('全局自定义构建函数-内部11')
    .fontSize(20)
    .fontWeight(FontWeight.Bold)
    .onClick(() => {
      console.log("11111");
    })
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
      Text('全局自定义构建函数-内部12')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          console.log("11111");
        })
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