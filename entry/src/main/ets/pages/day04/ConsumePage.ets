// @Consume装饰器（跨层级传参） 适用于父组件与孙子组件直接同步数据，跳过中间子组件手动传参。

// 父组件
// 1. 父组件：用 @Provide("key") 提供数据。
@Entry
@Component
struct Father {
  // @Consume @Provide
  @Provide("reviewVote") reviewVote: number = 0; // 提供数据

  build() {
    Column() {
      Son() // 无需手动传参
      Text(`父组件值：${this.reviewVote}`).fontSize(30)
    }
  }
}

// 子组件（中间层无需处理）
@Component
struct Son {
  build() {
    Column() {
      Grandson() // 直接嵌入孙子组件
    }
  }
}

// 孙子组件
// 2. 孙子组件：用 @Consume("key") 通过相同 key 接收数据。
@Component
struct Grandson {
  @Consume("reviewVote") reviewVote: number; // 通过key接收数据

  build() {
    Column() {
      Text("孙子组件：" + this.reviewVote).fontSize(30)
      Button('孙子组件+1')
        .onClick(() => {
          this.reviewVote += 1; // 修改同步到父组件
        })
    }
  }
}

export {}
/*
总结：
 注意事项
1. 数据类型匹配：
1.1 @Link 要求父子组件变量类型严格一致（如 number）。
1.2 @ObjectLink 只能接收 @Observed 类的实例属性（非整个对象）。
2. 避免深层嵌套：
2.1 @Consume 无法感知对象深层属性变化，需搭配 @Observed 使用。
3. 性能优化：
3.1 频繁更新的场景建议使用 @Link 或 @ObjectLink，减少跨层级通信开销。
 * */
