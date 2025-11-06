// @ObjectLink装饰器 适用于父子组件间双向同步复杂对象（嵌套对象或数组）。

// 数据模型
// 1. 数据类：用 @Observed 装饰类，标记为可观察对象。
@Observed
class Book {
  title: string;
  pages: number;

  constructor(title: string, pages: number) {
    this.title = title;
    this.pages = pages;
  }
}

// 父组件
// 2. 父组件：使用 @State 管理对象，传递给子组件时直接传递对象属性（非整个对象）。
@Entry
@Component
struct Parent3 {
  @State book: Book = new Book('HarmonyOS', 100);

  build() {
    Column() {
      // 传递对象属性（非整个对象）
      Child3({ childBook: this.book })
      Text(`父组件页数：${this.book.pages}`)
    }
  }
}

// 子组件
// 3. 子组件：用 @ObjectLink 接收对象属性，修改其深层属性可触发UI更新。
@Component
struct Child3 {
  @ObjectLink childBook: Book; // 接收对象属性

  build() {
    Button('子组件修改页数')
      .onClick(() => {
        this.childBook.pages += 10; // 修改深层属性
      })
  }
}
