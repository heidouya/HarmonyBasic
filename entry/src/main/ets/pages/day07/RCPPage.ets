// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp
import { rcp } from '@kit.RemoteCommunicationKit';

class RequestRCPInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    const promise = next.handle(context);
    return promise;
  }
}

class ResponseRCPInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    const promise = next.handle(context);
    return promise;
  }
}

@Entry
@Component
struct RCPPage {
  async fetchRequest() {
    const sessionConfig: rcp.SessionConfiguration = {
      // 指定与会话关联的HTTP请求的配置。
      requestConfiguration: {
        // 配置与HTTP请求期间的数据传输相关的各个方面
        transfer: {
          // 指定HTTP客户端是否应自动遵循重定向。
          autoRedirect: true,
          timeout: {
            connectMs: 5000,
            transferMs: 10000
          }
        },
      },
      // 设置会话中URL的基地址
      baseAddress: "https://www.toutiao.com",
      // 为Session发出的HTTP请求定义headers
      headers: {
        "Authorization": "Bearer YOUR_ACCESS_TOKEN",
        "Content-Type": "application/json"
      },
      // 请求/响应拦截器。
      interceptors: [new RequestRCPInterceptor(), new ResponseRCPInterceptor()]
    };
    const instance = rcp.createSession(sessionConfig)

    const res = await instance.get('https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00f01Je7B8QAAIDAfJNNDHNJDeiXnwNAAEz1P5mW7rs2CCl33p5-.fiZQksU.HxlZ17PWGaRFMyInwNsLhQPCNJMkMmStCALWF4DbOlELAP0wswiiRJSpiX.Q7AMBHLNSP9dzFg40f')

    console.info(`Response: ${res}`);
  }
  aboutToAppear(): void {
    this.fetchRequest()
  }
  build() {
  }
}