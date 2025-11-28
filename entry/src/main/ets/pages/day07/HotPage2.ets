import { http } from '@kit.NetworkKit'

interface hotResponse {
  data: [],
  fixed_top_data: []
}

interface hotItem {
  Title: string
}

@Entry
@Component
struct HotPage2 {
  hotUrl = "https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00f01Je7B8QAAIDAfJNNDHNJDeiXnwNAAEz1P5mW7rs2CCl33p5-.fiZQksU.HxlZ17PWGaRFMyInwNsLhQPCNJMkMmStCALWF4DbOlELAP0wswiiRJSpiX.Q7AMBHLNSP9dzFg40f"
  @State hotWords:hotItem [] = [];

  async getHot() {
    const req = http.createHttp()
    try {
      const res = await req.request(this.hotUrl)
      const hotRes = JSON.parse(res.result.toString()) as hotResponse
      this.hotWords = hotRes.data
    } catch (error) {
      console.log(error)
    }
  }

  aboutToAppear(): void {
    this.getHot()
  }

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

export {}