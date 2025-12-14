interface IParams {
  name:string
  age:number
}

@Builder
export function MeParamsBuilder() {
  MeParamsPage()
}

@Component
struct MeParamsPage {
  pageStack = new NavPathStack()
  pageParam: IParams = {} as IParams;

  build() {
    NavDestination() {
      Column() {
        Text() {
          Span("个人中心-带参数")
          Span(JSON.stringify(this.pageParam))
        }.fontSize(30)

        Button("返回").onClick(() => {
          // this.pageStack.pop()
          this.pageStack.pop("我是返回时给的参数")
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageStack = context.pathStack
      this.pageParam = context.pathInfo.param as IParams
    })
  }
}

export {}