// 尾随闭包初始化组件：在自定义组件中，使用@BuilderParam装饰的属性可通过尾随闭包进行初始化。初始化时，组件后需紧跟一个大括号“{}”形成尾随闭包场景。
// 1. 此场景下自定义组件内仅有一个使用@BuilderParam装饰的属性。
// 2. 此场景下自定义组件不支持通用属性。
@Builder
function fixedTag() {
  Image($r("app.media.like"))
    .width(20)
    .fillColor(Color.Red)
}

@Entry
@Component
struct BuilderParamPage4 {
  title = "鸿蒙开发鸿蒙开发";
  index = "1"

  build() {
    Column() {
      HotItem({
        title: this.title,
        index: this.index
      }){
        // Image($r("app.media.like"))
        //   .width(20)
        //   .fillColor(Color.Red)
        fixedTag()
      }
    }
  }
}

@Component
struct HotItem {
  @Prop title:string = ""
  @Prop index:string = ""

  @Builder closerBuilder(index:string) {
    Text(index).fontSize(30)
  }
  @BuilderParam closer: (index:string) => void = this.closerBuilder

  build() {
    Row({space: 10}) {
      this.closer(this.index)
      Text(this.title).fontSize(30)
    }
    .width("100%")
  }
}

export {}