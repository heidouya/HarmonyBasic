// 帧动画文档地址：https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-imageanimator
@Entry
@Component
struct ImageAnimatorPage {
  build() {
    Column() {
      ImageAnimator().images([
        {
          src: $r("app.media.frame0")
        },
        {
          src: $r("app.media.frame1")
        },
        {
          src: $r("app.media.frame2")
        },
        {
          src: $r("app.media.frame3")
        },
        {
          src: $r("app.media.frame4")
        },
        {
          src: $r("app.media.frame5")
        },
        {
          src: $r("app.media.frame6")
        },
        {
          src: $r("app.media.frame7")
        },
        {
          src: $r("app.media.frame8")
        },
        {
          src: $r("app.media.frame9")
        },
        {
          src: $r("app.media.frame10")
        },
        {
          src: $r("app.media.frame11")
        },
        {
          src: $r("app.media.frame12")
        },
      ])
        .width(300)
        .height(300)
        // state 控制播放状态。 AnimationStatus.Running 动画处于播放状态。
        .state(AnimationStatus.Running)
        // iterations 设置播放次数。 设置为-1时表示无限次播放
        .iterations(-1) // 无限运行动画
    }
    .width("100%")
  }
}