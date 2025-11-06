@Entry
@Component
struct ImagePage {
  build() {
    Column() {
      // 1. 网络图片
      Image("https://bpic.588ku.com/element_origin_min_pic/23/07/11/d32dabe266d10da8b21bd640a2e9b611.jpg!r650").width(100)
      // // 2. 自定义目录图片
      Image("/static/startIcon.png").width(100)
      // // 3. media 文件夹里的图片
      Image($r("app.media.startIcon")).width(100)
      // // 4. rawfile 文件里的图片
      Image($rawfile("background.png")).width(100)
      // // 5. 系统内置图片
      Image($r("sys.media.AI_pause")).width(100)
      // // 6. 字体图标图片
      Image($r("app.media.like")).width(100).fillColor(Color.Red)
      Image($r("app.media.collect")).width(100).fillColor(Color.Red)
    }
  }
}