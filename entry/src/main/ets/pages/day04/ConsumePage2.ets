interface IPerson {
  name:string
  age: number
}

@Entry
@Component
struct ConsumePage2 {
  @Provide("person") person:IPerson = {
    name: "h",
    age: 18
  };
  
  build() {
    Column() {
      Child()
    }
  }
}

@Component
struct Child {
  build() {
    GrandSon()
  }
}

@Component
struct GrandSon {
  @Consume("person") person:IPerson
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