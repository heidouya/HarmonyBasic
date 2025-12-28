// import _ from '@wolfx/lodash';
import { deepCopy } from './utils';

interface IPet {
  name:string
  age:number
}

interface IPerson {
  name:string
  age:number
  pet:IPet
}

@Entry
@Component
struct StateObjectPage {
  @State person:IPerson = {
    name: Date.now() + "",
    age: 17,
    pet: {
      name: Date.now() + "",
      age: 1
    }
  };

  build() {
    Column({space: 10}) {
      Text("人名：" + this.person.name)
        .fontSize(20)
      Text("人年龄：" + this.person.age)
        .fontSize(20)
      Button("改人名").onClick(() => {
        this.person.name = Date.now() + ""
      })
      Button("改人年龄").onClick(() => {
        this.person.age++
      })
      Text("宠物名：" + this.person.pet.name)
        .fontSize(20)
      Text("宠物年龄：" + this.person.pet.age)
        .fontSize(20)
      Button("改宠物名").onClick(() => {
        // this.person.pet.name = Date.now() + ""
        const pet = deepCopy<IPet>(this.person.pet)
        pet.name = Date.now() + ""
        this.person.pet = pet

        console.log(this.person.pet.name)
      })
      Button("修改整个对象").onClick(() => {
        this.person = {
          name: Date.now() + "",
          age: 18,
          pet: {
            name: "b",
            age: 2
          }
        }
      })
    }
  }
}

// const pet = _.cloneDeep(this.person.pet)
// pet.name = Date.now() + ""
// this.person.pet = pet

// const pet = deepCopy<IPet>(this.person.pet)
// pet.name = Date.now() + ""
// this.person.pet = pet
export {}