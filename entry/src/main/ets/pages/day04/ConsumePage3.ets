class Address {
  province:string
  city:string
  constructor(province:string, city:string) {
    this.province = province
    this.city = city
  }
}

class Person {
  name:string
  age: number
  address:Address
  constructor(name:string, age:number, address:Address) {
    this.name = name
    this.age = age
    this.address = address
  }
}

@Entry
@Component
struct ConsumePage3 {
  @Provide person:Person = new Person(Date.now() + "", 18, new Address("山东", "s"));

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
  @Consume person:Person = new Person("h", 18, new Address("h", "s"));
  build() {
    Column() {
      Text(this.person.name)
        .fontSize(30)
        .onClick(() => {
          this.person.name = "i"
          this.person.age++
        })
      Button("改第一层级-名字").onClick(() => {
        this.person.name = Date.now() + ""
      })
      Text(this.person.address.province).fontSize(30)
      Button("改第二层级-地址").onClick(() => {
        // this.person.address.province = "河北"

        const address = JSON.parse(JSON.stringify(this.person.address)) as Address
        address.province = "河北"
        this.person.address = address
      })
    }
  }
}

export {}