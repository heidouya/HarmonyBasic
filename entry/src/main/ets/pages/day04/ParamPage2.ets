@ObservedV2
class Pet {
  @Trace name:string
  age:number
  constructor(name:string, age:number) {
    this.name = name
    this.age = age
  }
}

@ObservedV2
class Person {
  @Trace name:string
  age:number
  pet:Pet
  constructor(name:string, age:number, pet:Pet) {
    this.name = name
    this.age = age
    this.pet = pet
  }
}

function isRender(type:string) {
  console.log(type + "被渲染了");
  return 20
}

@Entry
@ComponentV2
struct LocalObjectPage2 {
  @Local person:Person = new Person(Date.now() + "", 17, new Pet(Date.now() + "",1))

  build() {
    Column({space: 10}) {
      Text("人名：" + this.person.name)
        .fontSize(isRender("人名"))
      Text("人年龄：" + this.person.age)
        .fontSize(isRender("人年龄"))
      Button("改人名").onClick(() => {
        this.person.name = Date.now() + ""
      })
      Button("改人年龄").onClick(() => {
        this.person.age++
        console.log(this.person.age + "")
      })
      Text("父组件宠物名：" + this.person.pet.name)
        .fontSize(20)

      PetComp({pet: this.person.pet})

      Button("修改整个对象").onClick(() => {
        this.person = new Person(Date.now() + "", 18, new Pet(Date.now() + "",2))
      })
    }
  }
}

// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-param
@ComponentV2
struct PetComp {
  @Require @Param pet:Pet
  build() {
    Column({space: 10}) {
      Text("子组件宠物名：" + this.pet.name)
        .fontSize(20)
      Text("宠物年龄：" + this.pet.age)
        .fontSize(20)
      Button("改宠物名").onClick(() => {
        this.pet.name = Date.now() + ""
      })
    }
  }
}

export {}