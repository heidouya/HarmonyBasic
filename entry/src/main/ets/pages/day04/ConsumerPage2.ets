import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Parent {
  @Provider() sayHi: (msg: string) => void = (msg: string) => {
    promptAction.showDialog({
      message: msg
    })
  }
  build() {
    Column() {
      Child()
    }
  }
}

@Component
struct Child {
  build() {
    Grandson()
  }
}

@ComponentV2
struct Grandson {
  @Consumer() sayHi: (msg: string) => void = () => {};
  build() {
    Column() {
      Button("hi").onClick(() => {
        this.sayHi("hi")
      })
    }
  }
}

export {}