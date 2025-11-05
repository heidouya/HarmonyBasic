@Entry
@Component
struct ForEachPage {
  hotWords = [ "热点1", "热点2", "热点3", "热点4", "热点5" ];
  build() {
    Column() {
      ForEach(this.hotWords, (item:string)=>{
        Text(item)
      })
    }
  }
}





















// struct ForEachPage {
//   hotWords = [ "热点1", "热点2", "热点3", "热点4", "热点5" ];
//
//   build() {
//     Column() {
//       ForEach(this.hotWords,(item:string)=> {
//         Text(item)
//       })
//     }
//   }
// }