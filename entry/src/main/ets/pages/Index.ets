// @Entry装饰的自定义组件作为UI页面入口，单个UI页面中仅允许存在一个@Entry入口组件
@Entry
  // @Component 是鸿蒙（HarmonyOS）ArkTS 开发中用于声明自定义组件的装饰器
@Component
  //在鸿蒙（HarmonyOS）ArkTS开发中，struct 是定义自定义组件的基础结构
struct Index {
  // build()函数是自定义组件的核心声明式UI描述
  build() {
    Text("你好，鸿蒙")
  }
}