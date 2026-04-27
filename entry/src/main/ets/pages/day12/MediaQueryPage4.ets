import { BreakPointType, BreakpointSystem, BreakpointKey } from "./utils/BreakpointSystem"

@Entry
@Component
struct Demo09_demo {
  arr:number[] = new Array(12).fill(0)
  breakpointSystem: BreakpointSystem = new BreakpointSystem()
  @StorageProp(BreakpointKey)
  currentBreakpoint: string = 'sm'

  aboutToAppear(): void {
    this.breakpointSystem.register()
  }

  aboutToDisappear(): void {
    this.breakpointSystem.unregister()
  }

  build() {
    Grid() {
      ForEach(this.arr, (item: number, index: number) => {
        GridItem() {
          Text(index + "")
            .width("100%")
            .height("100%")
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .width(150)
        .height(150)
        .backgroundColor(Color.Orange)
      })
    }
    .columnsTemplate(new BreakPointType({
      xs: '1fr',
      sm: '1fr 1fr ',
      md: '1fr 1fr 1fr ',
      lg: '1fr 1fr 1fr 1fr '
    }).getValue(this.currentBreakpoint))
    .rowsGap(10)
    .columnsGap(10)
    .padding(10)
  }
}