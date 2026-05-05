import { BasicDataSource } from './utils/BasicDataSource';

class InitialDataSource extends BasicDataSource {
  private dataArray: string[] = []
  public totalCount(): number {
    return this.dataArray.length
  }
  public getData(index: number): string {
    return this.dataArray[index]
  }
  pushData(data: string):void {
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
  }
}

@Entry
@Component
struct LazyForEachPage {
  data:InitialDataSource = new InitialDataSource()
  aboutToAppear(): void {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`hello ${i}`)
    }
  }
  build() {
    List({space: 3}) {
      LazyForEach(this.data, (item:string) => {
        ListItem() {
          Row() {
            Text(item).fontSize(100)
              .onAppear(() => {
                console.log(`appear: ${item}`);
              })
          }.margin({ left: 10, right: 10 })
        }
        .onClick(() => {
          // 点击追加子组件
          this.data.pushData(`Hello ${this.data.totalCount()}`);
        })
      }, (item:string) => item)
    }
    // .cachedCount(5)
  }
}