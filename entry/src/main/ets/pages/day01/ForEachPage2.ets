@Entry
@Component
struct ForEachPage2 {
  @State list:number[] = [1, 3, 4];
  build() {
    Column() {
      Button("添加元素").onClick(() => {
        this.list.splice(1, 0, 2)
      })
      ForEach(this.list, (item:number)=>TextItem({item}),(item:number)=>item + "")
    }
  }
}

@Component
struct TextItem {
  @Prop item:number;
  aboutToAppear(): void {
    console.log(this.item + "被渲染了")
  }
  build() {
    Text(this.item + "")
      .width("100%")
      .fontSize(30)
      .textAlign(TextAlign.Center)
  }
}