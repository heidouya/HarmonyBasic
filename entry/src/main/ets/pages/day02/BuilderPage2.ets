import { NewsItem } from './components/NewsItem'

interface INewsItem {
  title:string
  origin:string,
  date:string
}
@Entry
@Component
struct BuilderPage2 {
  list:INewsItem[] = [
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
    {
      title: "鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发鸿蒙开发",
      origin: "新闻联播",
      date: "19:00"
    },
  ];
  build() {
    List() {
      ForEach(this.list,(item:INewsItem) => {
        ListItem() {
          NewsItem(item.title, item.origin, item.date)
        }
      })
    }
    .width("100%")
    .height("100%")
    .padding(10)
  }
}