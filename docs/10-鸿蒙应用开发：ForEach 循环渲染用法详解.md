## 一、引言

在鸿蒙应用开发中，我们经常需要渲染列表数据。比如一个热榜页面，上面有很多热点条目。如果手动一个一个去写组件，不仅代码冗余，而且维护困难。这时候，`ForEach` 循环渲染组件就派上用场了。本文将带你快速掌握 `ForEach` 的基本用法和高级技巧。

## 二、基础用法：告别手动重复

假设我们要渲染一个热榜列表，最原始的方式是手动编写每一个 `Text` 组件：

```arkts
Text("热点1")
Text("热点2")
Text("热点3")
// ... 如果有100条，就要写100个
```

这样显然不现实。使用 `ForEach` 可以轻松解决这个问题。

### 2.1 三个参数

`ForEach` 接受三个参数：

|参数|必填|说明|
|:--|:--|:--|
|arr|是|数据源，必须是数组类型|
|itemGenerator|是|组件生成函数，为每个数组元素创建对应的子组件|
|keyGenerator|否|键值生成函数，为每个数组项生成唯一且持久的键值。若未提供 keyGenerator，框架默认使用 index + '__' + JSON.stringify(item)作为键值|

### 2.2 实战代码

首先，创建一个数组作为数据源：

```arkts
@State hotList: string[] = ["热点1", "热点3", "热点4"]
```

然后，在 `build` 方法中使用 `ForEach` 进行循环渲染，完整代码如下：

```arkts
@Entry
@Component
struct Index {
  @State hotList: string[] = ["热点1", "热点3", "热点4"]
  build() {
    Column() {
      ForEach(this.hotList, (item: string) => {
        Text(item)
          .fontSize(30)
          .margin({ top: 10 })
      })
    }
  }
}
```

**代码解释**：
- 第一个参数 `this.hotList` 是数据源。
- 第二个参数是一个箭头函数，`item` 代表数组中的每一项。这里我们为每一项创建一个 `Text` 组件，并显示该项的内容。

运行后，页面就会自动渲染出四个 `Text` 组件，显示对应的热点内容。这样，无论数据源有多少项，代码都只需要写一次，非常方便。

## 三、进阶用法：理解 Key 的重要性

`ForEach` 的第三个参数 `key` 生成函数非常关键，它决定了当数据源变化时，哪些组件需要被重新渲染。

### 3.1 不指定 Key 的问题

看下面这个例子：

```arkts
@Entry
@Component
struct Index {
  @State hotList: string[] = ["热点1", "热点3", "热点4"]
  build() {
    Column() {
      Button("添加元素2")
        .onClick(() => {
          this.hotList.splice(1, 0, "热点2") // 在索引1处插入元素2
        })
      ForEach(this.hotList, (item: string) => {
        MyComponent({ value: item })
      })
    }
  }
}

@Component
struct MyComponent {
  @Prop value:string

  aboutToAppear(): void {
    console.log(`${this.value} 被渲染了`)
  }

  build() {
    Text(item)
          .fontSize(30)
          .margin({ top: 10 })
  }
}
```

`MyComponent` 是一个自定义组件，它在 `aboutToAppear` 生命周期中打印日志，表示自己被渲染了。

当我们点击按钮添加元素 `热点2` 后，数组变为 `["热点1", "热点2", "热点3", "热点4"]`。按道理，只有新添加的 `热点2` 需要渲染，但实际日志可能会显示 `热点3` 和 `热点4` 也被重新渲染了。

**原因**：
1. `ForEach` 在不指定第三个参数时，`ForEach` 渲染出来的组件默认使用 **索引开头的字符串（index + '__' + JSON.stringify(item)）** 作为 `key`。
2. 通过 `index + ‘__’ + JSON.stringify(item)` 可知，在未添加 `热点2` 的时候，`热点3` 对应的 key 为 `"1__热点3"`，`热点4`对应的 key 为 `"2_热点4"`
3. 添加元素 `热点2` 后，数组内的元素索引发生了变化，原来索引为 `1` 的元素 `热点3` 变成了索引 `2`，原来索引为 `2` 的元素 `热点4` 变成了索引 `3`。
4. 由于默认 `key` 与索引息息相关，相关元素的索引发生了变化，它对应的 `key` 也会发生变化。
5. 此时，`热点3` 对应的 key 为 `"2__热点3"`，`热点4`对应的 key 为 `"3_热点4"`
6. `key` 发生变化后，这些 `key` 发生变化的组件就会被重新渲染。

### 3.2 正确指定 Key

为了解决上述问题，我们需要为每一项指定一个**唯一且稳定**的 key，而不是依赖索引。

```arkts
ForEach(this.numbers, (item: number) => {
  MyComponent({ value: item })
}, (item: number) => item.toString()) // 使用元素本身的值作为 key
```

现在，key 分别是 `"热点1"`、`"热点3"`、`"热点4"`。当我们插入元素 `热点2` 时，新元素的 key 是 `"热点2"`，而 `"热点3"` 和 `"热点4"` 的 key 没有变化，因此它们不会被重新渲染，只有新元素 `热点2` 会被渲染。

### 3.3 使用建议

- **优先使用数据中自带的唯一 ID**（如 `item.id`）作为 key。
- **避免使用索引**作为 key，除非你明确知道数据不会发生插入、删除或排序操作。
- 如果发现数据变了但页面没有更新，首先检查 key 是否使用不当。

## 四、总结

`ForEach` 是鸿蒙应用开发中非常实用的循环渲染组件。通过它，我们可以高效地渲染列表数据，告别手动重复编写 UI 代码。同时，正确理解和使用第三个参数 `key`，可以避免不必要的组件重渲染，提升应用性能。

希望本文能帮助你快速上手 `ForEach`，在实际开发中写出更优雅、高效的代码。
