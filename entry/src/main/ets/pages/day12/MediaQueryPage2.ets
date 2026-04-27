import { mediaquery } from '@kit.ArkUI';

@Entry
@Component
struct MediaQueryPage2 {
  @State text: string = "深色模式"

  private listener:mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync("(dark-mode: true)")

  onPortrait(mediaQueryResult:mediaquery.MediaQueryResult) {
    this.text = mediaQueryResult.matches ? "深色模式" : "浅色模式"
  }

  aboutToAppear() {
    this.listener.on("change", (mediaQueryResult: mediaquery.MediaQueryResult) => {
      this.onPortrait(mediaQueryResult)
    })
  }

  aboutToDisappear() {
    this.listener.off("change")
  }

  build() {
    Text(this.text).fontSize(50)
      .width("100%")
      .height("100%")
      .textAlign(TextAlign.Center)
  }
}