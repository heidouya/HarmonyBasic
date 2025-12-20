// @Computed为方法装饰器，装饰getter方法。@Computed会检测被计算的属性变化，当被计算的属性变化时，@Computed只会被求解一次。不推荐在@Computed中修改变量，对于简单计算，不建议使用计算属性，因为计算属性本身也有开销。
class Person {
  name:string
  constructor(name:string) {
    this.name = name
  }
  get getName() {
    return this.name
  }
}
@Entry
@ComponentV2
struct ComputedPage {
  @Local firstName:string = "hello"
  @Local lastName:string = "world"

  person:Person = new Person("a");

  @Computed
  get fullName() {
    console.log("执行了")
    return this.firstName + ' ' + this.lastName;
  }

  build() {
    Column() {
      Text(this.fullName)
      Text(this.fullName)
      Text(this.person.getName)
      Button("改名").onClick(() => {
        this.firstName = "hi"
      })
    }
  }
}