// @Monitor监听的状态变量为类对象时，仅能监听对象整体的变化。监听类属性的变化需要类属性被@Trace装饰。
@ObservedV2
class Info {
  @Trace name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
@Entry
@ComponentV2
struct MonitorPage4 {
  @Local info: Info = new Info('Tom', 25);
  @Monitor('info')
  infoChange() {
    console.info(`info change`);
  }
  @Monitor('info.name')
  infoPropertyChange() {
    console.info(`info name change`);
  }
  build() {
    Column() {
      Text(`name: ${this.info.name}, age: ${this.info.age}`)
      Button('change info')
        .onClick(() => {
          this.info = new Info('Lucy', 18);
        })
      Button('change info.name')
        .onClick(() => {
          this.info.name = Date.now() + "";
        })
    }
  }
}