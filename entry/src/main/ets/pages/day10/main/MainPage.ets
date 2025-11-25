import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct MainPage {
  //1. 获取上下文对象(后续直接使用)
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  build() {
    Column() {
      Text("首页")
      Button("跳转聊天").onClick(() => {
        //2. 准备 want类型的对象并设置属性
        let wantInfo: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.harmonybase', // AppScope/app.json5确认
          moduleName: 'entry', // moduleName非必选
          abilityName: 'ChatEntryAbility', //  src/main/module.json5确认
          parameters: {
            // 自定义信息
            info: ''
          },
        }
        //3. 通过上下文对象拉起对应的 Abilit
        // context为调用方UIAbility的UIAbilityContext
        this.context.startAbility(wantInfo).then(() => {
          console.log('startAbility success.');
        }).catch((error: BusinessError) => {
          console.log('startAbility failed.');
        });
      })
    }
  }
}