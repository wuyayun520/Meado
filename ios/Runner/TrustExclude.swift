
//: Declare String Begin

/*: "myxaon" :*/
fileprivate let strVerticalName:[Character] = ["m","y","x","a","o","n"]

/*: "980" :*/
fileprivate let kStr_padPhoneData:String = "980"

/*: "p10yso2s505c" :*/
fileprivate let strPresentValue:String = "fail0y"
fileprivate let kLostData:[Character] = ["5","0","5","c"]

/*: "w01vf8" :*/
fileprivate let strDownwardlyValue:[Character] = ["w","0","1","v","f","8"]

/*: "1.9.1" :*/
fileprivate let kStr_goString:[Character] = ["1",".","9",".","1"]

/*: "https://m. :*/
fileprivate let kStr_rootBounceValue:String = "https:label title image"
fileprivate let kPlatformData:[Character] = ["/","/","m","."]

/*: .com" :*/
fileprivate let kOptionAllowName:String = "scale up.com"

/*: "CFBundleShortVersionString" :*/
fileprivate let strMinimumFatalValue:String = "CFBuaction option string presentation"
fileprivate let kStr_localSValue:String = "delayrt"
fileprivate let kStr_neverString:[Character] = ["n","S"]
fileprivate let kStr_dataString:[Character] = ["t","r","i","n","g"]

/*: "CFBundleDisplayName" :*/
fileprivate let strFoundationString:String = "CFBunbridge start run"
fileprivate let strAllowString:[Character] = ["d","l","e","D","i","s","p","l"]
fileprivate let strConfirmString:String = "mic list disk instance elementayName"

/*: "CFBundleVersion" :*/
fileprivate let strFailureName:[Character] = ["C","F","B","u","n","d","l","e","V","e","r","s","i","o","n"]

/*: "weixin" :*/
fileprivate let kStr_statusApplicationString:[Character] = ["w","e","i","x","i"]
fileprivate let kStr_topString:String = "current"

/*: "wxwork" :*/
fileprivate let kImageValue:String = "runwork"

/*: "dingtalk" :*/
fileprivate let kAvailablePleaseString:[Character] = ["d","i","n","g","t","a","l","k"]

/*: "lark" :*/
fileprivate let kStr_currencyName:String = "hideark"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  TrustExclude.swift
//  OverseaH5
//
//  Created by young on 2025/9/24.
//

//: import KeychainSwift
import KeychainSwift
//: import UIKit
import UIKit

/// 域名
//: let ReplaceUrlDomain = "myxaon"
let k_listEndData = (String(strVerticalName))
/// 包ID
//: let PackageID = "980"
let kReportData = (kStr_padPhoneData.capitalized)
/// Adjust
//: let AdjustKey = "p10yso2s505c"
let kLocalString = (strPresentValue.replacingOccurrences(of: "fail", with: "p1") + "so2s" + String(kLostData))
//: let AdInstallToken = "w01vf8"
let kSeaPowerValue = (String(strDownwardlyValue))

/// 网络版本号
//: let AppNetVersion = "1.9.1"
let k_objectEndName = (String(kStr_goString))
//: let H5WebDomain = "https://m.\(ReplaceUrlDomain).com"
let kNextRandomValue = (String(kStr_rootBounceValue.prefix(6)) + String(kPlatformData)) + "\(k_listEndData)" + (String(kOptionAllowName.suffix(4)))
//: let AppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let kKnownDelayValue = Bundle.main.infoDictionary![(String(strMinimumFatalValue.prefix(4)) + "ndleS" + kStr_localSValue.replacingOccurrences(of: "delay", with: "ho") + "Versio" + String(kStr_neverString) + String(kStr_dataString))] as! String
//: let AppBundle = Bundle.main.bundleIdentifier!
let k_ratingString = Bundle.main.bundleIdentifier!
//: let AppName = Bundle.main.infoDictionary!["CFBundleDisplayName"] ?? ""
let k_performCornerSumervalData = Bundle.main.infoDictionary![(String(strFoundationString.prefix(5)) + String(strAllowString) + String(strConfirmString.suffix(6)))] ?? ""
//: let AppBuildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
let k_lostDeviceString = Bundle.main.infoDictionary![(String(strFailureName))] as! String

//: class AppConfig: NSObject {
class TrustExclude: NSObject {
    /// 获取状态栏高度
    //: class func getStatusBarHeight() -> CGFloat {
    class func presentDown() -> CGFloat {
        //: if #available(iOS 13.0, *) {
        if #available(iOS 13.0, *) {
            //: if let statusBarManager = UIApplication.shared.windows.first?
            if let statusBarManager = UIApplication.shared.windows.first?
                //: .windowScene?.statusBarManager
                .windowScene?.statusBarManager
            {
                //: return statusBarManager.statusBarFrame.size.height
                return statusBarManager.statusBarFrame.size.height
            }
            //: } else {
        } else {
            //: return UIApplication.shared.statusBarFrame.size.height
            return UIApplication.shared.statusBarFrame.size.height
        }
        //: return 20.0
        return 20.0
    }

    /// 获取window
    //: class func getWindow() -> UIWindow {
    class func disappear() -> UIWindow {
        //: var window = UIApplication.shared.windows.first(where: {
        var window = UIApplication.shared.windows.first(where: {
            //: $0.isKeyWindow
            $0.isKeyWindow
            //: })
        })
        // 是否为当前显示的window
        //: if window?.windowLevel != UIWindow.Level.normal {
        if window?.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: return window!
        return window!
    }

    /// 获取当前控制器
    //: class func currentViewController() -> (UIViewController?) {
    class func actual() -> (UIViewController?) {
        //: var window = AppConfig.getWindow()
        var window = TrustExclude.disappear()
        //: if window.windowLevel != UIWindow.Level.normal {
        if window.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: let vc = window.rootViewController
        let vc = window.rootViewController
        //: return currentViewController(vc)
        return dismiss(vc)
    }

    //: class func currentViewController(_ vc: UIViewController?)
    class func dismiss(_ vc: UIViewController?)
        //: -> UIViewController?
        -> UIViewController?
    {
        //: if vc == nil {
        if vc == nil {
            //: return nil
            return nil
        }
        //: if let presentVC = vc?.presentedViewController {
        if let presentVC = vc?.presentedViewController {
            //: return currentViewController(presentVC)
            return dismiss(presentVC)
            //: } else if let tabVC = vc as? UITabBarController {
        } else if let tabVC = vc as? UITabBarController {
            //: if let selectVC = tabVC.selectedViewController {
            if let selectVC = tabVC.selectedViewController {
                //: return currentViewController(selectVC)
                return dismiss(selectVC)
            }
            //: return nil
            return nil
            //: } else if let naiVC = vc as? UINavigationController {
        } else if let naiVC = vc as? UINavigationController {
            //: return currentViewController(naiVC.visibleViewController)
            return dismiss(naiVC.visibleViewController)
            //: } else {
        } else {
            //: return vc
            return vc
        }
    }
}

// MARK: - Device

//: extension UIDevice {
extension UIDevice {
    //: static var modelName: String {
    static var modelName: String {
        //: var systemInfo = utsname()
        var systemInfo = utsname()
        //: uname(&systemInfo)
        uname(&systemInfo)
        //: let machineMirror = Mirror(reflecting: systemInfo.machine)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        //: let identifier = machineMirror.children.reduce("") {
        let identifier = machineMirror.children.reduce("") {
            //: identifier, element in
            identifier, element in
            //: guard let value = element.value as? Int8, value != 0 else {
            guard let value = element.value as? Int8, value != 0 else {
                //: return identifier
                return identifier
            }
            //: return identifier + String(UnicodeScalar(UInt8(value)))
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //: return identifier
        return identifier
    }

    /// 获取当前系统时区
    //: static var timeZone: String {
    static var timeZone: String {
        //: let currentTimeZone = NSTimeZone.system
        let currentTimeZone = NSTimeZone.system
        //: return currentTimeZone.identifier
        return currentTimeZone.identifier
    }

    /// 获取当前系统语言
    //: static var langCode: String {
    static var langCode: String {
        //: let language = Locale.preferredLanguages.first
        let language = Locale.preferredLanguages.first
        //: return language ?? ""
        return language ?? ""
    }

    /// 获取接口语言
    //: static var interfaceLang: String {
    static var interfaceLang: String {
        //: let lang = UIDevice.getSystemLangCode()
        let lang = UIDevice.pageWith()
        //: if ["en", "ar", "es", "pt"].contains(lang) {
        if ["en", "ar", "es", "pt"].contains(lang) {
            //: return lang
            return lang
        }
        //: return "en"
        return "en"
    }

    /// 获取当前系统地区
    //: static var countryCode: String {
    static var countryCode: String {
        //: let locale = Locale.current
        let locale = Locale.current
        //: let countryCode = locale.regionCode
        let countryCode = locale.regionCode
        //: return countryCode ?? ""
        return countryCode ?? ""
    }

    /// 获取系统UUID（每次调用都会产生新值，所以需要keychain）
    //: static var systemUUID: String {
    static var systemUUID: String {
        //: let key = KeychainSwift()
        let key = KeychainSwift()
        //: if let value = key.get(AdjustKey) {
        if let value = key.get(kLocalString) {
            //: return value
            return value
            //: } else {
        } else {
            //: let value = NSUUID().uuidString
            let value = NSUUID().uuidString
            //: key.set(value, forKey: AdjustKey)
            key.set(value, forKey: kLocalString)
            //: return value
            return value
        }
    }

    /// 获取已安装应用信息
    //: static var getInstalledApps: String {
    static var getInstalledApps: String {
        //: var appsArr: [String] = []
        var appsArr: [String] = []
        //: if UIDevice.canOpenApp("weixin") {
        if UIDevice.model((String(kStr_statusApplicationString) + kStr_topString.replacingOccurrences(of: "current", with: "n"))) {
            //: appsArr.append("weixin")
            appsArr.append((String(kStr_statusApplicationString) + kStr_topString.replacingOccurrences(of: "current", with: "n")))
        }
        //: if UIDevice.canOpenApp("wxwork") {
        if UIDevice.model((kImageValue.replacingOccurrences(of: "run", with: "wx"))) {
            //: appsArr.append("wxwork")
            appsArr.append((kImageValue.replacingOccurrences(of: "run", with: "wx")))
        }
        //: if UIDevice.canOpenApp("dingtalk") {
        if UIDevice.model((String(kAvailablePleaseString))) {
            //: appsArr.append("dingtalk")
            appsArr.append((String(kAvailablePleaseString)))
        }
        //: if UIDevice.canOpenApp("lark") {
        if UIDevice.model((kStr_currencyName.replacingOccurrences(of: "hide", with: "l"))) {
            //: appsArr.append("lark")
            appsArr.append((kStr_currencyName.replacingOccurrences(of: "hide", with: "l")))
        }
        //: if appsArr.count > 0 {
        if appsArr.count > 0 {
            //: return appsArr.joined(separator: ",")
            return appsArr.joined(separator: ",")
        }
        //: return ""
        return ""
    }

    /// 判断是否安装app
    //: static func canOpenApp(_ scheme: String) -> Bool {
    static func model(_ scheme: String) -> Bool {
        //: let url = URL(string: "\(scheme)://")!
        let url = URL(string: "\(scheme)://")!
        //: if UIApplication.shared.canOpenURL(url) {
        if UIApplication.shared.canOpenURL(url) {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 获取系统语言
    /// - Returns: 国际通用语言Code
    //: @objc public class func getSystemLangCode() -> String {
    @objc public class func pageWith() -> String {
        //: let language = NSLocale.preferredLanguages.first
        let language = NSLocale.preferredLanguages.first
        //: let array = language?.components(separatedBy: "-")
        let array = language?.components(separatedBy: "-")
        //: return array?.first ?? "en"
        return array?.first ?? "en"
    }
}
