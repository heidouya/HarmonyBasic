// 监听深层嵌套

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

@Entry
@Component
struct Parent {
  @State book: Book = new Book('HarmonyOS', 100, new Author("a", 19));

  build() {
    Column() {
      Child({ author: this.book.author })
      // Child2({ book: this.book })
      Text(`父组件年龄：${this.book.author.age}`)

    }
  }
}

@Component
struct Child {
  @ObjectLink author: Author;

  build() {
    Column() {
      Text("子组件年龄：" + this.author.age)
      Button('子组件修改年龄')
        .onClick(() => {
          this.author.age++;
        })
    }
  }
}

// @Component
// struct Child2 {
//   @ObjectLink book: Book; // 接收整个Book对象
//
//   build() {
//     Column() {
//       Text("子组件年龄：" + this.book.author.age)
//       Button('修改年龄')
//         .onClick(() => {
//           // this.book.author.age++ // 触发双向更新
//           this.book.author = new Author(this.book.author.name, this.book.author.age + 1)
//         })
//     }
//   }
// }

export {}