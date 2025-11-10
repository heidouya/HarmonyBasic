// @Link装饰器 适用于父子组件间双向同步简单数据类型（如 number, string, boolean）。
// 父组件
// 1. 父组件：使用 @State 定义状态变量，并通过 $ 语法（变量名）传递给子组件。
@Entry
@Component
struct Parent1 {
  @State parentValue: number = 0; // 父组件状态变量

  build() {
    Column() {
      // 通过$语法传递状态引用
      Child1({ childLink: $parentValue })
      Text(`父组件值：${this.parentValue}`)
    }
  }
}

// 子组件
// 2. 子组件：使用 @Link 接收参数，修改该参数会同步更新父组件的状态。
@Component
struct Child1 {
  @Link childLink: number; // 接收@Link参数

  build() {
    Button('子组件+1')
      .onClick(() => {
        this.childLink += 1; // 修改后同步到父组件
      })
  }
}
