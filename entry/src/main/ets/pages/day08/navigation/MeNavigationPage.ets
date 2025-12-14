@Builder
export function MePageBuilder() {
  MeNavigationPage()
}

@Component
struct MeNavigationPage {
  build() {
    NavDestination() {
      Column() {
        Text() {
          Span("个人中心")
        }.fontSize(30)
      }
    }
  }
}

export {}