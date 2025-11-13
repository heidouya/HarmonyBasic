@Entry
@Component
struct PropPage2 {
  hotWords = [ "热点1", "热点2", "热点3", "热点4", "热点5" ];
  build() {
    Column() {
      ForEach(this.hotWords,(item:string, index:number)=> {
        HotItem({item:item, index:index+1+""})
      })
    }
  }
}

@Component
struct HotItem {
  @Prop item:string;
  @Prop index:string;
  build() {
    Row() {
      Text(this.index).margin(10)
      Text(this.item)
    }
  }
}

export {}