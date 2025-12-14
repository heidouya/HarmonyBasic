@Component
struct ShoppingCarPage {
  build() {
    NavDestination() {
      Text("购物车").fontSize(30)
    }
  }
}

@Builder
export function ShoppingCarBuilder() {
  ShoppingCarPage()
}