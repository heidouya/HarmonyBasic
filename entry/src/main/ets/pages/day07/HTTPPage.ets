import { http } from '@kit.NetworkKit'
// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-http

interface hotItem {
  Title: string
}

@Entry
@Component
struct HTTPPage {
  fetchRequest() {
    // 1. 创建一个HTTP请求
    const httpRequest = http.createHttp();
    // 2. 根据URL地址和相关配置项，发起HTTP网络请求，使用callback方式作为异步方法。
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET。
      // 开发者根据自身业务需要添加header字段。
      header: {
        contentType: "application/json"
      }
    };

    httpRequest.request("https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00f01Je7B8QAAIDAfJNNDHNJDeiXnwNAAEz1P5mW7rs2CCl33p5-.fiZQksU.HxlZ17PWGaRFMyInwNsLhQPCNJMkMmStCALWF4DbOlELAP0wswiiRJSpiX.Q7AMBHLNSP9dzFg40f", options, (err: Error, data: http.HttpResponse) => {
      if (!err) {
        this.hotWords = JSON.parse(data.result.toString()).data
      } else {
        console.error('error:' + JSON.stringify(err));
      }
    });
  }

  aboutToAppear(): void {
    this.fetchRequest()
  }
  @State hotWords:hotItem [] = [];
  build() {
    Column() {
      Text("热点榜").fontSize(25)
      List() {
        ForEach(this.hotWords,(item:hotItem, index:number)=> {
          ListItem() {
            HotItem({item:item, index:index+1+""})
          }
        })
      }
      .width("100%")
      .height("100%")
    }
  }
}

@Component
struct HotItem {
  @Prop item:hotItem;
  @Prop index:string;
  build() {
    Row() {
      Text(this.index).margin(10)
      Text(this.item.Title)
    }
  }
}
