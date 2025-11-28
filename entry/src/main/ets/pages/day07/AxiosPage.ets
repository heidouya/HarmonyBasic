import axios, { AxiosResponse } from '@ohos/axios';
interface IHotRes {
  data: [],
  fixed_top_data: []
}

@Entry
@Component
struct AxiosPage {
  url = "https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00f01Je7B8QAAIDAfJNNDHNJDeiXnwNAAEz1P5mW7rs2CCl33p5-.fiZQksU.HxlZ17PWGaRFMyInwNsLhQPCNJMkMmStCALWF4DbOlELAP0wswiiRJSpiX.Q7AMBHLNSP9dzFg40f"

  async fetchRequest() {
    try {
      const res = await axios.get<IHotRes, AxiosResponse<IHotRes,null>>(this.url);
      console.log(JSON.stringify(res.data));
    } catch (error) {
      console.error(JSON.stringify(error));
    }
  }

  aboutToAppear(): void {
    this.fetchRequest()
  }

  build() {
  }
}