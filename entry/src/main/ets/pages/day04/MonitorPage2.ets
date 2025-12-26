// 监听多个变量
@Entry
@ComponentV2
struct MonitorPage2 {
  @Local count: number = 0;
  @Local name:string = 'h';

  @Monitor('count', 'name')
  onCountChange(): void {
    console.log("name changed to "+this.name);
    console.log("count changed to "+this.count);
  }

  build() {
    Column(){
      Text(`name: ${this.name} -- count: ${this.count}`)
      Button("add count")
        .onClick(() => {
          this.count++;
        })
      Button("change name").onClick((event: ClickEvent) => {
        this.name = Date.now() + "";
      })
    }
  }
}