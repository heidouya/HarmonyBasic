import { abilityAccessCtrl, common, Want } from '@kit.AbilityKit'
import { geoLocationManager } from '@kit.LocationKit'
// 模拟器与真机差异，在模拟器上有些服务是不支持的，详见： https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-emulator-specification#section75181355174117
@Entry
@Component
struct PermissionPage {
  @State result: geoLocationManager.Location = {} as geoLocationManager.Location
  context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  build() {
    Column() {
      Button("申请位置权限").onClick(async () => {
        const manager = abilityAccessCtrl.createAtManager() // 创建程序控制管理器
        try {
          await manager.requestPermissionsFromUser(this.context,
            [
              "ohos.permission.APPROXIMATELY_LOCATION"
            ])
        } catch (error) {
          // TODO: Implement error handling.
        }
      })

      Text(`经纬度:${this.result.latitude}, ${this.result.longitude}`)
      Button('获取经纬度').onClick(async () => {
        try {
          this.result = await geoLocationManager.getCurrentLocation()
        } catch (error) {
          // TODO: Implement error handling.
        }
      })

      Button('二次申请权限').onClick(() => {
        const atManager = abilityAccessCtrl.createAtManager()
        atManager.requestPermissionOnSetting(this.context,
          [
            "ohos.permission.APPROXIMATELY_LOCATION"
          ]
        ).catch(() => {
          // TODO: Implement error handling.
        })
      })

      Button('跳转到系统设置页').onClick(() => {

        let want: Want = {
          bundleName: 'com.huawei.hmos.settings',
          abilityName: 'com.huawei.hmos.settings.MainAbility',
          uri: 'systemui_notification_settings',
          parameters: {
            pushParams: {
              bundleName: this.context.abilityInfo.bundleName // 应用包名
            }
          }
        };
        this.context.startAbility(want).catch(() => {
          // TODO: Implement error handling.
        });
      })
    }
  }
}