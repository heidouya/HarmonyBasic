import axios, { AxiosResponse } from '@ohos/axios';
interface IHotRes {
  data: [],
  fixed_top_data: []
}

interface hotItem {
  Title: string
}

@Entry
@Component
struct AxiosPage {
  @State hotWords:hotItem [] = [];
  url = "https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00f01Je7B8QAAIDAfJNNDHNJDeiXnwNAAEz1P5mW7rs2CCl33p5-.fiZQksU.HxlZ17PWGaRFMyInwNsLhQPCNJMkMmStCALWF4DbOlELAP0wswiiRJSpiX.Q7AMBHLNSP9dzFg40f"

  async fetchRequest() {
    try {
      const res = await axios.get<IHotRes, AxiosResponse<IHotRes,null>>(this.url);
      console.log(JSON.stringify(res.data));
      this.hotWords = res.data.data;
    } catch (error) {
      console.error(JSON.stringify(error));
    }
  }

  aboutToAppear(): void {
    this.fetchRequest()
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