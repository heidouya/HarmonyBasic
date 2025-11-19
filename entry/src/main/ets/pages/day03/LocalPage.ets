interface IPerson {
  name: string,
  age: number
}
@Entry
@ComponentV2
struct LocalPage {
  // @Local表示组件内部的状态，使得自定义组件内部的变量具有观测变化的能力。当装饰简单类型时，能够观测到对变量的赋值；当装饰对象类型时，仅能观测到对对象整体的赋值；当装饰数组类型时，能观测到数组整体以及数组元素项的变化；
  @Local count:number = 1;
  @Local arr:number[] = [1, 2];
  @Local person:IPerson = {
    name: 'hi',
    age: 17
  }
  build() {
    Column() {
      Text(this.count + "")
      Button("增加").onClick(() => {
        this.count++
      })

      Text(this.arr.toString())
      Button("修改数组").onClick((event: ClickEvent) => {
        this.arr.push(3)
      })
      
      Text(JSON.stringify(this.person))
      Button("修改信息").onClick((event: ClickEvent) => {
        this.person.name = "h"
        // this.person = {
        //   name: "h",
        //   age: 18
        // }
      })
    }
  }
}

export {}