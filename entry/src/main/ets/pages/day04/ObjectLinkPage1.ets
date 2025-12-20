// 文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-observed-and-objectlink

// @ObjectLink装饰器 适用于父子组件间同步复杂对象（嵌套对象或数组）。

// 数据模型
// 1. 数据类：用 @Observed 装饰类，标记为可观察对象。
@Observed
class Author {
  name:string
  age:number
  constructor(name:string,age:number) {
    this.name = name
    this.age = age
  }
}
@Observed
class Book {
  title: string;
  pages: number;
  author: Author

  constructor(title: string, pages: number, author: Author) {
    this.title = title;
    this.pages = pages;
    this.author = author;
  }
}

// 父组件
// 2. 父组件：使用 @State 管理对象，传递给子组件时直接传递对象属性（非整个对象）。
@Entry
@Component
struct Parent3 {
  @State book: Book = new Book('HarmonyOS', 100, new Author("a", 19));

  build() {
    Column({space: 20}) {
      // 传递对象属性（非整个对象）
      Child({ author: this.book.author })
      Text(`父组件页数：${this.book.pages}`).fontSize(30)
    }
  }
}

// 子组件
// 3. 子组件：用 @ObjectLink 接收对象属性，修改其深层属性可触发UI更新。
@Component
struct Child {
  @ObjectLink author: Author; // 接收对象属性

  build() {
    Column({space: 20}) {
      Text("子组件年龄：" + this.author.age).fontSize(30)
      Button('子组件修改年龄')
        .onClick(() => {
          this.author.age++;
        })
    }
  }
}
export {}