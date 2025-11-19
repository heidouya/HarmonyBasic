interface IPerson {
  name:string
  age: number
}

@ObservedV2
class Person {
  @Trace name:string = ""
  @Trace age: number = 0
  constructor(name:string, age:number) {
    this.name = name
    this.age = age
  }
}

@Entry
@ComponentV2
struct ConsumePage2 {
  @Provider("person") person:Person = new Person("h", 18);

  build() {
    Column() {
      Child()
    }
  }
}

@ComponentV2
struct Child {
  build() {
    GrandSon()
  }
}

@ComponentV2
struct GrandSon {
  @Consumer("person") person:IPerson = {} as IPerson;
  build() {
    Row() {
      Text(this.person.name + "_" + this.person.age)
        .fontSize(30)
        .onClick(() => {
          this.person.name = "i"
          this.person.age++
        })
    }
  }
}

export {}