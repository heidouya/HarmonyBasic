@Component
struct ShoppingCarPage {
  build() {
    NavDestination() {
      Column() {
        Text("购物车").fontSize(30)
      }.padding({top: 50})
    }
    .hideTitleBar(true)
  }
}

@Builder
export function ShoppingCarBuilder() {
  ShoppingCarPage()
}