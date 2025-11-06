/*
 @Prop用于建立父子组件间的单向同步
 1. 父组件 → 子组件：父组件状态变量更新时，自动同步到子组件的@Prop变量
 2. 子组件 → 父组件：禁止同步（子组件对@Prop的修改不会影响父组件），子组件可直接修改@Prop变量（仅影响当前组件，不触发父组件更新）
*/

// 父组件
// 1. 父组件：使用 @State 定义状态变量，并通过键值对传递给子组件。
@Entry
@Component
struct Parent2 {
  @State parentValue: number = 0; // 父组件状态变量

  build() {
    Column() {
      Child2({ parentValue: this.parentValue })
      Text(`父组件值：${this.parentValue}`)
    }
  }
}

// 子组件
// 2. 子组件：使用 @Prop 接收参数，修改该参数不会同步更新父组件的状态。
@Component
struct Child2 {
  @Prop parentValue: number; // 接收@Link参数

  build() {
    Column() {
      Button('子组件+1')
        .onClick(() => {
          this.parentValue += 1; // 修改后同步到父组件
        })
      Text(this.parentValue+"")
    }
  }
}

