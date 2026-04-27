import { mediaquery } from '@kit.ArkUI'

/**
 * 定义断点配置接口
 * @property name 断点名称（如xs/sm/md等）
 * @property size 断点对应的最小宽度（单位vp）
 * @property mediaQueryListener 媒体查询监听器对象
 */
interface Breakpoint {
  name: string
  size: number
  mediaQueryListener?: mediaquery.MediaQueryListener
}

/**
 * AppStorage中存储当前断点的键名
 */
export const BreakpointKey: string = 'currentBreakpoint'

/**
 * 响应式断点系统核心类
 * 功能：监听屏幕尺寸变化，自动更新当前断点状态
 */
export class BreakpointSystem {
  // 当前激活的断点标识（默认中等尺寸'md'）
  private currentBreakpoint: string = 'md'

  // 预定义的断点配置数组
  private breakpoints: Breakpoint[] = [
    { name: 'xs', size: 0 },    // 超小屏幕（<320vp）
    { name: 'sm', size: 320 },  // 小屏幕（320-600vp）
    { name: 'md', size: 600 },  // 中等屏幕（600-840vp）
    { name: 'lg', size: 840 }   // 大屏幕（>=840vp）
  ]

  /**
   * 注册断点监听器
   * 为每个断点创建媒体查询条件并绑定变化事件
   */
  public register() {
    this.breakpoints.forEach((breakpoint: Breakpoint, index) => {
      let condition: string

      // 生成媒体查询条件：
      // 最后一个断点使用 >= 条件，其他断点使用区间条件
      if (index === this.breakpoints.length - 1) {
        // 大屏幕条件：宽度 >= 840vp
        condition = '(' + breakpoint.size + 'vp<=width)'
      } else {
        // 区间条件示例：320vp<=width<600vp
        condition = '(' + breakpoint.size + 'vp<=width<' +
                   this.breakpoints[index + 1].size + 'vp)'
      }

      console.log('[Breakpoint] 注册媒体查询: ' + condition)

      // 创建媒体查询监听器
      breakpoint.mediaQueryListener = mediaquery.matchMediaSync(condition)

      // 监听屏幕变化事件
      breakpoint.mediaQueryListener.on('change', (mediaQueryResult) => {
        // 当匹配当前断点条件时更新状态
        if (mediaQueryResult.matches) {
          this.updateCurrentBreakpoint(breakpoint.name)
        }
      })
    })
  }

  /**
   * 注销所有断点监听器
   * 通常在页面销毁时调用，避免内存泄漏
   */
  public unregister() {
    this.breakpoints.forEach((breakpoint: Breakpoint) => {
      if (breakpoint.mediaQueryListener) {
        // 移除事件监听
        breakpoint.mediaQueryListener.off('change')
      }
    })
  }

  /**
   * 更新当前断点状态
   * @param breakpoint 新断点名称
   */
  private updateCurrentBreakpoint(breakpoint: string) {
    // 仅在实际变化时更新
    if (this.currentBreakpoint !== breakpoint) {
      this.currentBreakpoint = breakpoint

      // 将新断点存入AppStorage全局状态管理
      AppStorage.set<string>(BreakpointKey, this.currentBreakpoint)

      console.log('[Breakpoint] 当前断点更新: ' + this.currentBreakpoint)
    }
  }
}

/**
 * 响应式值配置接口（泛型）
 * 允许为不同断点配置不同的值类型
 */
declare interface BreakPointTypeOption<T> {
  xs?: T   // 超小屏幕对应值
  sm?: T   // 小屏幕对应值
  md?: T   // 中等屏幕对应值
  lg?: T   // 大屏幕对应值
  xl?: T   // 超大屏幕对应值
  xxl?: T  // 特超大屏幕对应值
}

/**
 * 响应式值容器类（泛型）
 * 功能：根据当前断点返回匹配的配置值
 */
export class BreakPointType<T> {
  // 存储不同断点对应的值配置
  options: BreakPointTypeOption<T>

  constructor(option: BreakPointTypeOption<T>) {
    this.options = option
  }

  /**
   * 获取当前断点对应的值
   * @param currentBreakPoint 当前断点标识
   * @returns 匹配的配置值，未定义时返回undefined
   */
  getValue(currentBreakPoint: string) {
    // 根据断点标识返回对应配置值
    if (currentBreakPoint === 'xs') {
      return this.options.xs
    } else if (currentBreakPoint === 'sm') {
      return this.options.sm
    } else if (currentBreakPoint === 'md') {
      return this.options.md
    } else if (currentBreakPoint === 'lg') {
      return this.options.lg
    } else if (currentBreakPoint === 'xl') {
      return this.options.xl
    } else if (currentBreakPoint === 'xxl') {
      return this.options.xxl
    } else {
      return undefined
    }
  }
}