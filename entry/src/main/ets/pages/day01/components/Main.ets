@Component
export default struct Main {
  build() {
    Column(){
      Text("Main")
    }
    .width("100%")
    //layoutWeight 是用于动态分配子元素在父容器主轴方向剩余空间的属性，适用于 Row/Column/Flex 布局容器。
    .layoutWeight(1)
    .backgroundColor(Color.Orange)
  }
}