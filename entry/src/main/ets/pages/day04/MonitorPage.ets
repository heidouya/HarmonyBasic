//@Monitor装饰器用于监听状态变量修改，当观测的属性变化时，@Monitor装饰器定义的回调方法将被调用。判断属性是否变化使用的是严格相等（===），当严格相等判断的结果是false（即不相等）的情况下，就会触发@Monitor的回调。@Monitor装饰器具有深度监听的能力，能够监听嵌套类、多维数组、对象数组中指定项的变化。对于嵌套类、对象数组中成员属性变化的监听要求该类被@ObservedV2装饰且该属性被@Trace装饰。
@Entry
@ComponentV2
struct MonitorPage {
  @Local count: number = 0;
  @Monitor('count')
  onCountChange(): void {
    console.log("count changed to "+this.count);
  }

  build() {
    Column(){
      Text(`count: ${this.count}`)
      Button("add count")
        .onClick(() => {
          this.count++;
        })
    }
  }
}