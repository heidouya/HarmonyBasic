import { common } from '@kit.AbilityKit';

interface IMockData {
  code: string,
  result: []
}

@Entry
@Component
struct MockPage {
  async loadLocalJson() {
    try {
      const context = getContext(this) as common.UIAbilityContext;
      const rawData = await context.resourceManager.getRawFileContent('api.json');
      const jsonStr = String.fromCharCode(...rawData); // Uint8Array转字符串
      const jsonObj:IMockData = JSON.parse(jsonStr); // 解析为对象
      console.log('JSON数据:', jsonObj);
    } catch (err) {
      console.error('读取失败:', JSON.stringify(err));
    }
  }

  aboutToAppear(): void {
    this.loadLocalJson()
  }

  build() {
  }
}