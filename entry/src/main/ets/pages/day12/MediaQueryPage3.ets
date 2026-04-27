import { BreakpointKey, BreakpointSystem, BreakPointType } from './utils/BreakpointSystem';

@Entry
@Component
struct MediaQueryPage3 {
  private breakPointSym = new BreakpointSystem()
  @StorageProp(BreakpointKey) curBP:string = "sm"

  aboutToAppear(): void {
    this.breakPointSym.register()
  }

  aboutToDisappear(): void {
    this.breakPointSym.unregister()
  }

  build() {
    Text(this.curBP)
      .width("100%")
      .height("100%")
      .fontSize(100)
      .textAlign(TextAlign.Center)
      .backgroundColor(
        new BreakPointType({
          xs: Color.Red,
          sm: Color.Orange,
          md: Color.Yellow,
          lg: Color.Green
        }).getValue(this.curBP)
      )
  }
}