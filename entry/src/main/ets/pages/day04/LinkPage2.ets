class Author {
  name:string
  age:number
  constructor(name:string, age:number) {
    this.name = name
    this.age = age;
  }
}

class Book {
  title: string;
  pages: number;
  author: Author

  constructor(title: string, pages: number, author: Author) {
    this.title = title;
    this.pages = pages;
    this.author = author
  }
}

@Entry
@Component
struct Parent {
  @State book: Book = new Book('HarmonyOS', 100, new Author("a", 10));

  build() {
    Column({space: 20}) {
      Child({ childBook: $book })
      Text(`父组件页数：${this.book.pages}`)
      Text(`父组件年龄：${this.book.author.age}`)
    }
  }
}

@Component
struct Child {
  @Link childBook: Book;

  build() {
    Column({space: 20}) {
      Text("子组件页数：" + this.childBook.pages)
      Text("子组件年龄：" + this.childBook.author.age)
      Button('子组件修改页数')
        .onClick(() => {
          this.childBook.pages += 10;
        })
      Button('子组件修改年龄')
        .onClick(() => {
          this.childBook.author.age += 10;
        })
    }
  }
}

export {}
