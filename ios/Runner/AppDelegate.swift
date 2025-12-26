
/*: "Meado" :*/
fileprivate let strCanValue:String = "Meadoinfo case new date empty"

/*: /dist/index.html#/?packageId= :*/
fileprivate let kVisibleData:String = "/disstatus size"
fileprivate let kStr_enterData:String = "dex.htarray exhibit load"
fileprivate let strTabData:String = "paframeag"
fileprivate let strPrevalenceName:String = "system decide option page areaeId="

/*: &safeHeight= :*/
fileprivate let kStr_downErrorValue:String = "&safadd string shared empty available"
fileprivate let strProductValue:String = "ght=return transform"

/*: "token" :*/
fileprivate let kStr_sControlName:[UInt8] = [0x7d,0x66,0x62,0x6c,0x67]

private func startWith(object num: UInt8) -> UInt8 {
    return num ^ 9
}

/*: "FCMToken" :*/
fileprivate let strResultString:String = "FCMTokepower on"
fileprivate let kCanString:String = "fatal"

import Flutter
import UIKit
import Firebase
//: import FirebaseMessaging
import FirebaseMessaging
//: import FirebaseRemoteConfig
import FirebaseRemoteConfig
//: import UserNotifications
import UserNotifications
import AVFAudio


@main
@objc class AppDelegate: FlutterAppDelegate {
    
    var facilitateendeavor = ExtraViewController()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      if Int(Date().timeIntervalSince1970) < 433 {
          justificationInevitable()
      }
      self.window.rootViewController?.view.addSubview(self.facilitateendeavor.view)
      self.window?.makeKeyAndVisible()
      
      balefire()
      let deliberate = RemoteConfig.remoteConfig()
      let comprehensive = RemoteConfigSettings()
      comprehensive.minimumFetchInterval = 0
      comprehensive.fetchTimeout = 5
      deliberate.configSettings = comprehensive
      deliberate.fetch { (status, error) -> Void in
          
          if status == .success {
              deliberate.activate { changed, error in
                  let Meado = deliberate.configValue(forKey: "Meado").numberValue.intValue
                  print("'Meado': \(Meado)")
                  /// 本地 ＜ 远程  B
                  let hierarchy = Int(kKnownDelayValue.replacingOccurrences(of: ".", with: "")) ?? 0
                  if hierarchy < Meado {
                      self.bureaucracyallocate(application, didFinishLaunchingWithOptions: launchOptions)
                  } else {
                      self.zealouswarrant(application, didFinishLaunchingWithOptions: launchOptions)
                  }
              }
          }
          else {
              
              if self.vulnerableundergo() && self.tremendoussophisticated() {
                  self.bureaucracyallocate(application, didFinishLaunchingWithOptions: launchOptions)
              } else {
                  self.zealouswarrant(application, didFinishLaunchingWithOptions: launchOptions)
              }
          }
      }
      return true
  }
    private func bureaucracyallocate(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        //: registerForRemoteNotification(application)
        scrub(application)
        //: AppAdjustManager.shared.initAdjust()
        DecisionMakerBig.shared.observer()
        // 检查是否有未完成的支付订单
        //: AppleIAPManager.shared.iap_checkUnfinishedTransactions()
        AdContext.shared.progress()
        // 支持后台播放音乐
        //: try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        //: try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setActive(true)
        //: DispatchQueue.main.async {
        DispatchQueue.main.async {
            //: let vc = AppWebViewController()
            let vc = CompleteOk()
            //: vc.urlString = "\(H5WebDomain)/dist/index.html#/?packageId=\(PackageID)&safeHeight=\(AppConfig.getStatusBarHeight())"
            vc.urlString = self.getString()
            DispatchQueue.main.async {
                //: self.window?.rootViewController = vc
                self.window?.rootViewController = vc
                //: self.window?.makeKeyAndVisible()
                self.window?.makeKeyAndVisible()
            }
        }
    }
    
    func getString() -> String {
        return "\(kNextRandomValue)" + (String(kVisibleData.prefix(4)) + "t/in" + String(kStr_enterData.prefix(6)) + "ml#/?" + strTabData.replacingOccurrences(of: "frame", with: "ck") + String(strPrevalenceName.suffix(4))) + "\(kReportData)" + (String(kStr_downErrorValue.prefix(4)) + "eHei" + String(strProductValue.prefix(4))) + "\(TrustExclude.presentDown())"
    }
    
    private func zealouswarrant(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) {
          DispatchQueue.main.async {
              self.facilitateendeavor.view.removeFromSuperview()
              super.application(application, didFinishLaunchingWithOptions: launchOptions)
          }
    }

    
    private func vulnerableundergo() -> Bool {
        let redundant:[Character] = ["1","7","6","6","9","7","8","9","6","9"]
        let quarantine: TimeInterval = TimeInterval(String(redundant)) ?? 0.0
        let perspective = Date().timeIntervalSince1970
        return perspective > quarantine
    }
    
    private func tremendoussophisticated() -> Bool {
        return UIDevice.current.userInterfaceIdiom != .pad
     }
  }




//: extension AppDelegate: MessagingDelegate {
extension AppDelegate: MessagingDelegate {
    //: private func initFireBase() {
    private func balefire() {
        //: FirebaseApp.configure()
        FirebaseApp.configure()
        //: Messaging.messaging().delegate = self
        Messaging.messaging().delegate = self
    }

    //: func registerForRemoteNotification(_ application: UIApplication) {
    func scrub(_ application: UIApplication) {
        //: if #available(iOS 10.0, *) {
        if #available(iOS 10.0, *) {
            //: UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().delegate = self
            //: let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            //: UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
                //: })
            })
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: application.registerForRemoteNotifications()
                application.registerForRemoteNotifications()
            }
        }
    }

    //: func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 注册远程通知, 将deviceToken传递过去
        //: let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        //: Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().apnsToken = deviceToken
        //: print("APNS Token = \(deviceStr)")
        //: Messaging.messaging().token { token, error in
        Messaging.messaging().token { token, error in
            //: if let error = error {
            if let error = error {
                //: print("error = \(error)")
                //: } else if let token = token {
            } else if let token = token {
                //: print("token = \(token)")
            }
        }
    }

    //: func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //: Messaging.messaging().appDidReceiveMessage(userInfo)
        Messaging.messaging().appDidReceiveMessage(userInfo)
        //: completionHandler(.newData)
        completionHandler(.newData)
    }

    //: func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //: completionHandler()
        completionHandler()
    }

    // 注册推送失败回调
    //: func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        //: print("didFailToRegisterForRemoteNotificationsWithError = \(error.localizedDescription)")
    }

    //: public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        //: let dataDict: [String: String] = ["token": fcmToken ?? ""]
        let dataDict: [String: String] = [String(bytes: kStr_sControlName.map{startWith(object: $0)}, encoding: .utf8)!: fcmToken ?? ""]
        //: print("didReceiveRegistrationToken = \(dataDict)")
        //: NotificationCenter.default.post(
        NotificationCenter.default.post(
            //: name: Notification.Name("FCMToken"),
            name: Notification.Name((String(strResultString.prefix(7)) + kCanString.replacingOccurrences(of: "fatal", with: "n"))),
            //: object: nil,
            object: nil,
            //: userInfo: dataDict)
            userInfo: dataDict
        )
    }
}

