//实现功能： v2状态版本呢管理里父子组件之间传递复杂对象

// 数据模型
// 1. 数据类：用 @ObservedV2 装饰类，标记为可观察对象。
@ObservedV2
class Author {
  @Trace name:string
  constructor(name:string) {
    this.name = name
  }
}

@ObservedV2
class Book {
  @Trace title: string;
  @Trace pages: number;
  @Trace author: Author

  constructor(title: string, pages: number, author: Author) {
    this.title = title;
    this.pages = pages;
    this.author = author
  }
}

// 父组件
// 2. 父组件：使用 @Local 管理对象，传递给子组件时直接传递对象属性（非整个对象）。
@Entry
@ComponentV2
struct Parent3 {
  @Local book: Book = new Book('HarmonyOS', 100, new Author("a"));

  build() {
    Column({space: 20}) {
      // 传递对象属性（非整个对象）
      Child3({ author: this.book.author })
      Text(`父组件作者：${this.book.author.name}`).fontSize(30)
    }
  }
}

// 子组件
// 3. 子组件：用 @Param 接收对象属性，修改其深层属性可触发UI更新。
@ComponentV2
struct Child3 {
  @Require @Param author: Author; // 接收对象属性

  build() {
    Column({space: 20}) {
      Text("子组件：" + this.author.name).fontSize(30)
      Button('子组件修改作者')
        .onClick(() => {
          this.author.name = "b"; // 修改深层属性
        })
    }
  }
}
export {}