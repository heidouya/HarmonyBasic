import { MutableBinding, UIUtils } from "@kit.ArkUI";

class Font {
  fontSize: number = 20;
}

@Entry
@Component
struct BuilderPage3 {
  @State fontSize:number = 20
  @State font: Font = {
    fontSize: this.fontSize
  };
  @Builder
  changeTextFontSizeBuilder1(fontSize:number) {
    Text("值传递")
      .fontSize(fontSize)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        fontSize++
      })
  }
  @Builder
  changeTextFontSizeBuilder2(font:Font) {
    Text("引用传递2")
      .fontSize(font.fontSize)
      .fontWeight(FontWeight.Bold)
    // @Builder装饰的函数内部在没有使用MutableBinding时不允许修改参数值，修改不会触发UI刷新。若按引用传递参数且仅传入一个参数时，修改参数内部的属性会抛出运行时错误。
      .onClick(() => {
        font.fontSize++
      })
  }

  @Builder
  changeTextFontSizeBuilder3(fontSize:MutableBinding<number>) {
    Text("引用传递-数字3")
      .fontSize(fontSize.value)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        fontSize.value++
      })
  }

  @Builder
  changeTextFontSizeBuilder4(font:MutableBinding<Font>) {
    Text("引用传递-对象4")
      .fontSize(font.value.fontSize)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        font.value.fontSize++
      })
  }

  build() {
    Column() {
      // 值传递
      this.changeTextFontSizeBuilder1(this.fontSize)

      // 引用传递
      this.changeTextFontSizeBuilder2({fontSize:this.fontSize})

      Button("加大字体").onClick(() => {
        this.fontSize++
      })

      this.changeTextFontSizeBuilder3(
        UIUtils.makeBinding<number>(
          () => this.fontSize,
          value => {
            this.fontSize = value; // 必须要传SetterCallback，否则触发时会造成运行时错误
          }
        )
      )

      this.changeTextFontSizeBuilder4(
        UIUtils.makeBinding<Font>(
          () => this.font,
          value => {
            this.font = value; // 必须要传SetterCallback，否则触发时会造成运行时错误
          }
        )
      )
    }
    .width("100%")
  }
}