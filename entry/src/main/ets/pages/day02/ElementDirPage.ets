@Entry
@Component
struct ElementDirPage {
  // 应用全局配置
  // AppScope/resources/base/element/string.json
  // AppScope/app.json5
  build() {
    Text($r("app.string.app_name1"))
      .width("100%")
      .height(100)
      .fontSize($r("app.float.page_text_font_size"))
      .backgroundColor($r("app.color.theme_color"))
  }
}