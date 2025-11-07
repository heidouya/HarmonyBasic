// import { PromptAction } from '@kit.ArkUI';
import prompt from '@system.prompt';
@Entry
@Component
struct LayoutPage {
  build() {
    Column() {
      Header()
      Banner()
      ListComp()
      Footer()
    }
  }
}

@Component
struct Header {
  build() {
    Row() {
      Text("header")
    }
    .width("100%")
    .height(50)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Footer {
  build() {
    Row(){
      Text("footer")
    }
    .width("100%")
    .height(50)
    .backgroundColor(Color.Yellow)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Banner {
  // promptAction: PromptAction = this.getUIContext().getPromptAction();
  scroller:Scroller = new Scroller()
  index = 0
  build() {
    RelativeContainer(){
      List({scroller:this.scroller}){
        ForEach([1, 2], (item:number)=>{
          ListItem() {
            ScrollItem({item})
          }
        })
      }
      .width("100%")
      .height("100%")
      .listDirection(Axis.Horizontal)

      Button("<")
        .width(50)
        .alignRules({
          left:{ anchor:"__container__", align:HorizontalAlign.Start},
          center: {anchor: "__container__", align:VerticalAlign.Center}
        })
        .onClick(() => {
          if (this.index < 1) {
            prompt.showToast({
              message: '到头了',
              duration: 1000
            })
            // try {
            //   this.promptAction.showToast({
            //     message: '到头了',
            //     duration: 2000
            //   });
            // } catch (error) {
            //   console.log(error)
            // }
            return
          }
          // 滑动到指定Index，支持设置滑动额外偏移量。
          this.scroller.scrollToIndex(--this.index, true)
        })
      Button(">")
        .width(50)
        .alignRules({
          right:{ anchor:"__container__", align:HorizontalAlign.End},
          center: {anchor: "__container__", align:VerticalAlign.Center}
        })
        .onClick(() => {
          if (this.index > 1) {
            prompt.showToast({
              message: '到头了',
              duration: 1000
            })
            // try{
            //   this.promptAction.showToast({
            //     message: '到头了',
            //     duration: 2000
            //   });
            // } catch (error) {
            //   console.log(error)
            // }
            return
          }
          this.scroller.scrollToIndex(++this.index, true);
        })
    }
    .height(100)
  }
}

@Component
struct ListComp {
  build() {
    //  The 'Scroll' component can have only one child component.
    Scroll() {
      Column({space:10}) {
        ForEach([1, 2, 3, 4, 5, 6, 7], (item:number)=>ScrollItem({item}))
      }
    }
    .margin({top:10})
    .layoutWeight(1)
    .backgroundColor(Color.Orange)
    // // 设置滚动方向。
    .scrollable(ScrollDirection.Vertical)
    // 设置边缘滑动效果。
    .edgeEffect(EdgeEffect.Spring)
  }
}

@Component
struct ScrollItem {
  @Prop item:number;
  build() {
    Row(){
      Text(this.item+"")
    }
    .width("100%")
    .height(100)
    .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.Center)
  }
}