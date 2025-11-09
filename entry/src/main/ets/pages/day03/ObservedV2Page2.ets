export {}
@ObservedV2
class ShoppingCartItem {
  title:string
  price:number
  @Trace count:number
  constructor(title:string, price:number, count:number) {
    this.title = title
    this.price = price
    this.count = count
  }
}

@Entry
@ComponentV2
struct ObservedV2Page2 {
  @Local newsItem:ShoppingCartItem[] = [
    new ShoppingCartItem("鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发", 100, 1),
    new ShoppingCartItem("鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发", 200, 2),
    new ShoppingCartItem("鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发", 300, 3),
    new ShoppingCartItem("鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发", 400, 4),
  ]
  build() {
    List() {
      ForEach(this.newsItem, (item:ShoppingCartItem) => {
        ListItem() {
          CartItem({item})
        }
      })
    }
  }
}

@ComponentV2
struct CartItem {
  @Require @Param item:ShoppingCartItem;
  build() {
    Row() {
      Image($r("app.media.startIcon")).width(80)
      Column() {
        Text(this.item.title)
        Row() {
          Text(this.item.price + "￥")
          Counter() {
            Text(this.item.count.toString())
          }
          .onInc(() => {
            this.item.count++
          })
          .onDec(() => {
            if (this.item.count > 1) {
              this.item.count--
            }
          })
        }
        .width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .padding(10)
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .padding(10)
    .border({
      width: {bottom: 1},
    })
  }
}