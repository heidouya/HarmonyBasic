// @Monitor监听的状态变量为类对象时，仅能监听对象整体的变化。监听类属性的变化需要类属性被@Trace装饰。
@ObservedV2
class Address{
  @Trace province:string
  @Trace city:string
  constructor(province:string, city:string) {
    this.province = province
    this.city = city
  }
}
@ObservedV2
class Info {
  @Trace name: string;
  age: number;
  address: Address
  constructor(name: string, age: number, address:Address) {
    this.name = name;
    this.age = age;
    this.address = address
  }
}
@Entry
@ComponentV2
struct MonitorPage4 {
  @Local info: Info = new Info('Tom', 25, new Address("河北", "石家庄"));
  @Monitor('info')
  infoChange() {
    console.info(`info change`);
  }
  @Monitor('info.name')
  infoPropertyChange1() {
    console.info(`info name change`);
  }
  @Monitor("info.address.city")
  infoPropertyChange2() {
    console.info(`info address.city change`);
  }
  @Monitor('info.age')
  infoPropertyChange3() {
    console.info(`info age change`);
  }
  build() {
    Column({space: 20}) {
      Text(`name: ${this.info.name}, age: ${this.info.age}, city: ${this.info.address.city}`).fontSize(20)
      Button('change info')
        .onClick(() => {
          this.info = new Info('Lucy', 18, new Address("河北", "石家庄"));
        })
      Button('change info.name')
        .onClick(() => {
          this.info.name = Date.now() + "";
        })
      Button("change info.address.city").onClick(() => {
        this.info.address.city = "邯郸"
      })
      Button("change info.age").onClick(() => {
        this.info.age++
      })
    }
  }
}