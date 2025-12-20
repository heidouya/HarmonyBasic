// @Watch用于监听状态变量的变化，当状态变量变化时，@Watch的回调方法将被调用。@Watch在ArkUI框架内部判断数值有无更新使用的是严格相等（===），遵循严格相等规范。当严格相等判断的结果是false（即不相等）的情况下，就会触发@Watch的回调。
/*
@Watch存在的问题：
1. 每个装饰器只能监听一个变量
2. 无法进行深度监听
3. 无法直接获取旧值
*/
@Entry
@Component
struct WatchPage {
  @State @Watch('onCountChange') count: number = 0;
  onCountChange(): void {
    console.log("count changed to "+this.count);
  }

  build() {
    Column({space: 20}){
      Text(`count: ${this.count}`).fontSize(30)
      Button("add count")
        .onClick(() => {
          this.count++;
        })
    }
  }
}