@Entry
@ComponentV2
struct StateAndLocalPage {
  @Local count:number = 0;
  build() {
    Text(this.count + "")
      .fontSize(50)
      .onClick(() => {
        this.count++
        console.log(this.count + "")
      })
  }
}