// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-track
import { deepCopy } from "./utils"

class Pet {
  @Track name:string
  @Track age:number
  constructor(name:string, age:number) {
    this.name = name
    this.age = age
  }
}

// @Track应用于class对象的属性级更新。@Track装饰的属性变化时，只会触发该属性关联的UI更新。
// 如果class类中使用了@Track装饰器，那么该class类中非@Track装饰的属性不能在@Component UI中使用，包括不能绑定在组件上、不能用于初始化子组件，但用于方法、事件等
class Person {
  @Track name:string
  age:number
  @Track pet:Pet
  constructor(name:string, age:number, pet:Pet) {
    this.name = name
    this.age = age
    this.pet = pet
  }
}

function isRender(type:string, fontSize:number) {
  console.log(type + "渲染了")
  return fontSize
}

@Entry
@Component
struct StateObjectPage {
  // 1. 深拷贝
  // 2. @Observed @ObjectLink

  // @Track
  @State person:Person = new Person(Date.now() + "", 17, new Pet(Date.now() + "",1))

  build() {
    Column({space: 10}) {
      Text("人名：" + this.person.name)
        .fontSize(isRender("人名", 20))
      Text("人年龄：" )
        .fontSize(isRender("人年龄", 20))
      Button("改人名").onClick(() => {
        this.person.name = Date.now() + ""
      })
      Button("改人年龄").onClick(() => {
        this.person.age++
        console.log(this.person.age  +"")
      })
      Text("宠物名：" + this.person.pet.name)
        .fontSize(isRender("宠物名", 20))
      Text("宠物年龄：" + this.person.pet.age)
        .fontSize(isRender("宠物年龄", 20))
      Button("改宠物名").onClick(() => {
        // this.person.pet.name = Date.now() + ""
        const pet = deepCopy<Pet>(this.person.pet)
        pet.name = Date.now() + ""
        this.person.pet = pet

        console.log(this.person.pet.name)
      })
      Button("修改整个对象").onClick(() => {
        this.person = new Person(Date.now() + "", 18, new Pet(Date.now() + "",2))
      })
    }
  }
}



export {}