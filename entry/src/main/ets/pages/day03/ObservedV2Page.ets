@ObservedV2
class Person {
  @Trace name:string
  age:number
  constructor(name:string, age:number) {
    this.name = name
    this.age = age
  }
}

@Entry
@ComponentV2
struct ObservedV2Page {
  @Local person:Person = new Person("h", 18)
  build() {
    Column() {
      Text(JSON.stringify(this.person))
      Text(this.person.name)
      Text(this.person.age + "")
      Button("修改").onClick(() => {
        this.person.name = "a"
        this.person.age++
      })
    }
  }
}