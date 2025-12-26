// 监听前后变化的值
// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-new-monitor
@Entry
@ComponentV2
struct MonitorPage3 {
  @Local count: number = 0;
  @Local name:string = 'h';

  @Monitor('count', 'name')
  onCountChange(monitor:IMonitor): void {
    // 获取变化前的值
    const beforeCount = monitor.value("count")?.before + ""
    // 获取变化后的值
    // const  nowCount = monitor.value("count")?.now + ""
    //
    // const beforeName = monitor.value("name")?.before + ""
    // const nowName = monitor.value("name")?.now + ""
    //
    // console.log("count：" + beforeCount, nowCount);
    // console.log("name：" + beforeName, nowName);

    // 通过遍历获取所有被当前回调函数监听的状态变量变化前和变化后的值
    monitor.dirty.forEach(key => {
      const before = monitor.value(key)?.before + ""
      const now = monitor.value(key)?.now + ""
      console.log(key + "：" + before, now);
    })
  }

  build() {
    Column(){
      Text(`name: ${this.name} -- count: ${this.count}`).fontSize(30)
      Button("change")
        .onClick(() => {
          this.count++;
          this.name += this.count;
        })
    }
  }
}