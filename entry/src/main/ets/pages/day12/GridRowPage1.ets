// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/responsive-layout-V5#%E6%A0%85%E6%A0%BC%E5%B8%83%E5%B1%80

// GridRow 栅格容器组件
// GridCol 栅格子组件

@Entry
@Component
struct GridRowPage1 {
  @State currentBp: string = 'unknown'
  private arr: number[] = new Array(12).fill(0)

  build() {
    Column() {
      Text(this.currentBp).fontSize(100)
      GridRow({
        // 设置布局列数
        // columns: 5,
        columns: {
          xs: 2,
          sm: 4,
          md: 6,
          lg: 8
        },
        // 栅格布局间距
        gutter: { x: 5, y: 10 },
        // 设置断点值的断点数列以及基于应用窗口或容器尺寸的相应参照
        breakpoints: {
          // 设置断点位置的单调递增数组
          value: ['400vp', '600vp', '800vp'],
          // 断点切换参照物 以窗口为参照
          reference: BreakpointsReference.WindowSize
        },
        // 栅格布局排列方向
        direction: GridRowDirection.Row
      }) {
        ForEach(this.arr, (item:number, index:number) => {
          GridCol({
            // 栅格子组件占用栅格容器组件的列数
            // span: {
            //   xs: 2, sm: 2, md: 2, lg: 2
            // },
            span: 2,
            // 栅格子组件相对于原本位置偏移的列数
            offset: 0,
            // 元素的序号，根据栅格子组件的序号，从小到大对栅格子组件做排序
            order: index + Math.random()*10
          }) {
            Text(index + "").width('100%').height(100).fontSize(30).textAlign(TextAlign.Center).backgroundColor(Color.Gray)
          }
        })
      }
      .width('100%')
      .height('100%')
      // 断点发生变化时触发回调
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }
  }
}