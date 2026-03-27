import { Binding, MutableBinding, UIUtils } from "@kit.ArkUI";

class Font {
  fontSize: number = 20;
}

@Entry
@Component
struct BuilderPage3 {
  @State fontSize:number = 20
  @State font: Font = {
    fontSize: 20
  };

  @Builder
  changeTextFontSizeBuilder1(fontSize:number) {
    Text("值传递1")
      .fontSize(fontSize)
      .fontWeight(FontWeight.Bold)
  }

  @Builder
  changeTextFontSizeBuilder2(font:Font) {
    Text("引用传递2")
      .fontSize(font.fontSize)
      .fontWeight(FontWeight.Bold)
  }

  @Builder
  changeTextFontSizeBuilder22(font:Font, fontSize:number) {
    Text("引用传递2")
      .fontSize(font.fontSize)
      .fontWeight(FontWeight.Bold)
  }

  // 只读数据流 → 用Binding；单向同步（父→子）；仅需读回调函数；禁止在@Builder内修改值；
  @Builder
  changeTextFontSizeBuilder3(fontSize:Binding<number>) {
    Text("引用传递3")
      .fontSize(fontSize.value)
      .fontWeight(FontWeight.Bold)
  }

  @Builder
  changeTextFontSizeBuilder4(font:Font) {
    Text("引用传递4")
      .fontSize(font.fontSize)
      .fontWeight(FontWeight.Bold)
      // @Builder装饰的函数内部在没有使用MutableBinding时不允许修改参数值，修改不会触发UI刷新。若按引用传递参数且仅传入一个参数时，修改参数内部的属性会抛出运行时错误。
      // .onClick(() => {
      //   font.fontSize++
      // })
  }

  // 双向数据流 → 用MutableBinding；双向同步（父⇄子）；需读回调+写回调函数；允许在@Builder内修改值
  @Builder
  changeTextFontSizeBuilder5(fontSize:MutableBinding<number>) {
    Text("引用传递-数字5")
      .fontSize(fontSize.value)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        fontSize.value++
      })
  }

  build() {
    Column({space: 20}) {
      // 值传递
      this.changeTextFontSizeBuilder1(this.fontSize)

      // 引用传递
      this.changeTextFontSizeBuilder2({fontSize: this.fontSize})

      // 传递两个及以上参数时，所有参数按值传递
      this.changeTextFontSizeBuilder22({fontSize: this.fontSize}, this.fontSize)

      this.changeTextFontSizeBuilder3(
        UIUtils.makeBinding<number>(() => this.fontSize)
      )

      Button("加大字体").onClick(() => {
        this.fontSize++
      })

      Text("-----双向同步----")
        .fontSize(30)
        .padding(20)

      this.changeTextFontSizeBuilder4({fontSize:this.fontSize})

      this.changeTextFontSizeBuilder5(
        UIUtils.makeBinding<number>(
          () => this.fontSize,
          value => this.fontSize = value
        )
      )
    }
    .width("100%")
  }
}

