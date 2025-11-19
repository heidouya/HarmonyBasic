// 监听前后变化的值
@Entry
@ComponentV2
struct MonitorPage3 {
  @Local count: number = 0;
  @Local name:string = 'h';

  @Monitor('count', 'name')
  onCountChange(monitor:IMonitor): void {
    // const before = monitor.value("count")?.before + ""
    // const  now = monitor.value("count")?.now + ""
    // console.log("count：" + before, now);

    monitor.dirty.forEach(key => {
      const before = monitor.value(key)?.before + ""
      const now = monitor.value(key)?.now + ""
      console.log(key + "：" + before, now);
    })
  }

  build() {
    Column(){
      Text(`name: ${this.name} -- count: ${this.count}`)
      Button("add count")
        .onClick(() => {
          this.count++;
          this.name += + this.count;
        })
    }
  }
}