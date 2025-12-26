
//: Declare String Begin

/*: "getDeviceID" :*/
fileprivate let kIncidentString:[Character] = ["g","e","t","D","e","v","i","c","e","I"]
fileprivate let kStr_modelUsedString:[Character] = ["D"]

/*: "getFirebaseID" :*/
fileprivate let strDecideData:[Character] = ["g","e","t","F","i","r","e","b","a"]
fileprivate let kStr_exceptValue:String = "please forward elseseID"

/*: "getAreaISO" :*/
fileprivate let strActiveValue:[Character] = ["g","e","t","A","r","e","a","I","S"]
fileprivate let kStr_frameData:[Character] = ["O"]

/*: "getProxyStatus" :*/
fileprivate let kStr_makeString:String = "getPrlevel hide"
fileprivate let kStr_pastElementName:String = "tnameus"

/*: "getMicStatus" :*/
fileprivate let strErrorName:[Character] = ["g","e","t","M","i","c","S","t","a","t","u","s"]

/*: "getPhotoStatus" :*/
fileprivate let strMAlbumValue:String = "getPpoor platform"
fileprivate let strProcessName:[Character] = ["S"]
fileprivate let strScheduleData:String = "tatarrow"

/*: "getCameraStatus" :*/
fileprivate let kZoneArrayValue:String = "by progress second revenue bygetC"
fileprivate let kStr_minimumString:String = "Statusscheme guard"

/*: "reportAdjust" :*/
fileprivate let kPresentationName:String = "repado"
fileprivate let kPicOfValue:[Character] = ["t"]

/*: "requestLocalPush" :*/
fileprivate let kStr_pathValue:String = "RE"
fileprivate let strSecondString:String = "quefield"
fileprivate let kStr_scriptName:String = "layer power clearalPush"

/*: "getLangCode" :*/
fileprivate let kLinkData:String = "agente"
fileprivate let kStr_languageName:[Character] = ["t","L","a","n","g","C","o","d","e"]

/*: "getTimeZone" :*/
fileprivate let kStr_serviceValue:String = "background listgetTim"
fileprivate let kNeedName:String = "previous view album styleeZone"

/*: "getInstalledApps" :*/
fileprivate let kStr_showString:[Character] = ["g","e","t","I","n","s","t","a","l","l","e","d","A","p","p","s"]

/*: "getSystemUUID" :*/
fileprivate let kMagnitudeValue:String = "getSysnot failure show"
fileprivate let kStr_nextData:String = "service"

/*: "getCountryCode" :*/
fileprivate let kStr_productString:String = "getCresponse request confirm since break"
fileprivate let kBeginString:[Character] = ["y","C","o","d","e"]

/*: "inAppRating" :*/
fileprivate let strAgainRevenueData:String = "inAppRif behavior add"
fileprivate let kStr_accessStatusData:String = "atiapproval"

/*: "apPay" :*/
fileprivate let kPicString:[Character] = ["a","p","P","a","y"]

/*: "subscribe" :*/
fileprivate let kStr_failureMinimumData:[Character] = ["s","u","b","s","c","r","i","b","e"]

/*: "openSystemBrowser" :*/
fileprivate let strScreenString:String = "opestyle"
fileprivate let kStr_layerActualString:String = "emBrowserend layer data"

/*: "closeWebview" :*/
fileprivate let kStr_rotationalLatencyString:[Character] = ["c","l","o","s","e"]
fileprivate let kStr_positiveFeedbackString:String = "Webviewmodel post var source"

/*: "openNewWebview" :*/
fileprivate let strFlexibleOffName:String = "can server protectionopenNew"
fileprivate let strOriginName:String = "Webviewgo actual pending version stop"

/*: "reloadWebview" :*/
fileprivate let kStr_safetyName:String = "fromlo"
fileprivate let kStr_kindString:String = "bdomainew"

/*: "typeName" :*/
fileprivate let kLaunchValue:[UInt8] = [0x65,0x6d,0x61,0x4e,0x65,0x70,0x79,0x74]

/*: "deviceID" :*/
fileprivate let kStr_lapseValue:[UInt8] = [0x7d,0x7e,0x8f,0x82,0x7c,0x7e,0x62,0x5d]

fileprivate func actualData(activity num: UInt8) -> UInt8 {
    let value = Int(num) - 25
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "fireBaseID" :*/
fileprivate let kStr_presentDayString:[UInt8] = [0x44,0x49,0x65,0x73,0x61,0x42,0x65,0x72,0x69,0x66]

/*: "areaISO" :*/
fileprivate let kProgressValue:[UInt8] = [0xc6,0xd5,0xc2,0xc6,0xee,0xf4,0xe8]

/*: "isProxy" :*/
fileprivate let kLevelStyleData:[UInt8] = [0x48,0x52,0x2f,0x51,0x4e,0x57,0x58]

fileprivate func magnitudePoint(dismiss num: UInt8) -> UInt8 {
    let value = Int(num) - 223
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "langCode" :*/
fileprivate let strPathData:[UInt8] = [0x65,0x64,0x6f,0x43,0x67,0x6e,0x61,0x6c]

/*: "timeZone" :*/
fileprivate let kStr_bounceValue:[UInt8] = [0x9a,0x87,0x83,0x8b,0xb4,0x81,0x80,0x8b]

private func imageAppTransform(pending num: UInt8) -> UInt8 {
    return num ^ 238
}

/*: "installedApps" :*/
fileprivate let kDeviceName:[UInt8] = [0xad,0xb2,0xb7,0xb8,0xa5,0xb0,0xb0,0xa9,0xa8,0x85,0xb4,0xb4,0xb7]

fileprivate func cornerTrack(active num: UInt8) -> UInt8 {
    let value = Int(num) - 68
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "systemUUID" :*/
fileprivate let kStr_micString:[UInt8] = [0xfa,0x0,0xfa,0xfb,0xec,0xf4,0xdc,0xdc,0xd0,0xcb]

fileprivate func sinceMGrant(fatal num: UInt8) -> UInt8 {
    let value = Int(num) + 121
    if value > 255 {
        return UInt8(value - 256)
    } else {
        return UInt8(value)
    }
}

/*: "countryCode" :*/
fileprivate let strCurrencyValue:[UInt8] = [0xcc,0xc0,0xda,0xc1,0xdb,0xdd,0xd6,0xec,0xc0,0xcb,0xca]

private func buildCurrent(fatal num: UInt8) -> UInt8 {
    return num ^ 175
}

/*: "status" :*/
fileprivate let strDelayObserverData:[UInt8] = [0xde,0xd9,0xcc,0xd9,0xd8,0xde]

private func sumContact(temp num: UInt8) -> UInt8 {
    return num ^ 173
}

/*: "isAuth" :*/
fileprivate let kFrameString:[UInt8] = [0x68,0x74,0x75,0x41,0x73,0x69]

/*: "isFirst" :*/
fileprivate let kUserString:[UInt8] = [0xe,0x14,0x21,0xe,0x15,0x14,0x13]

private func albumSource(option num: UInt8) -> UInt8 {
    return num ^ 103
}

/*: __LocalPush" :*/
fileprivate let kClickStyleString:String = "value raw__Local"
fileprivate let strSinceNextData:[Character] = ["P","u","s","h"]

/*: "identifier" :*/
fileprivate let kStr_eErValue:[UInt8] = [0xf6,0xf1,0xf2,0xfb,0x1,0xf6,0xf3,0xf6,0xf2,0xff]

fileprivate func tunShared(handle num: UInt8) -> UInt8 {
    let value = Int(num) - 141
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "HTTPProxy" :*/
fileprivate let kVersionName:String = "Hfailurefailure"
fileprivate let strScreenName:[Character] = ["P","P","r","o","x","y"]

/*: "HTTPSProxy" :*/
fileprivate let kWindowName:String = "https"

/*: "SOCKSProxy" :*/
fileprivate let kStr_maxResolutionData:[Character] = ["S","O","C","K","S","P","r","o"]
fileprivate let strMakeValue:String = "country"

/*: "__SCOPED__" :*/
fileprivate let strTunData:[Character] = ["_","_","S","C"]
fileprivate let kStr_sharedName:String = "false create session ifOPED__"

/*: "tap" :*/
fileprivate let strCanScriptString:String = "tafrom"

/*: "tun" :*/
fileprivate let kLayerString:String = "TUN"

/*: "ipsec" :*/
fileprivate let kPointString:String = "ipsepic"

/*: "ppp" :*/
fileprivate let kStr_waiterValue:String = "statestatestate"

/*: "Retry After or Go to " :*/
fileprivate let kManiocData:String = "capture sound date micRetry"
fileprivate let kScaleString:String = "later package laterr or G"
fileprivate let kSNeverName:String = "o to float level else bridge screen"

/*: "Feedback" :*/
fileprivate let strElectDelayString:String = "Feedbaat later zone current full"
fileprivate let strRelapsingName:String = "select"

/*: " to contact us" :*/
fileprivate let kTotalDoingTrueDiskName:[Character] = [" ","t","o"," ","c","o","n","t","a","c","t"," ","u","s"]

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  AppWebViewHandleEvent.swift
//  OverseaH5
//
//  Created by young on 2025/9/23.
//

//: import CoreTelephony
import CoreTelephony
//: import FirebaseMessaging
import FirebaseMessaging
//: import HandyJSON
import HandyJSON
//: import StoreKit
import StoreKit
//: import UIKit
import UIKit

/// H5事件
//: private let getDeviceID     = "getDeviceID"        // 获取设备号
private let k_cameraData = (String(kIncidentString) + String(kStr_modelUsedString)) // 获取设备号
//: private let getFirebaseID   = "getFirebaseID"      // 获取FireBaseToken
private let kFieldString = (String(strDecideData) + String(kStr_exceptValue.suffix(4))) // 获取FireBaseToken
//: private let getAreaISO      = "getAreaISO"         // 获取 SIM/运营商 地区ISO
private let kActivityName = (String(strActiveValue) + String(kStr_frameData)) // 获取 SIM/运营商 地区ISO
//: private let getProxyStatus  = "getProxyStatus"     // 获取是否使用了代理
private let kObjectTargetTransportData = (String(kStr_makeString.prefix(5)) + "oxyS" + kStr_pastElementName.replacingOccurrences(of: "name", with: "at")) // 获取是否使用了代理
//: private let getMicStatus    = "getMicStatus"       // 获取麦克风权限
private let kMicNetName = (String(strErrorName)) // 获取麦克风权限
//: private let getPhotoStatus  = "getPhotoStatus"     // 获取相册权限
private let k_domainString = (String(strMAlbumValue.prefix(4)) + "hoto" + String(strProcessName) + strScheduleData.replacingOccurrences(of: "arrow", with: "us")) // 获取相册权限
//: private let getCameraStatus = "getCameraStatus"    // 获取相机权限
private let kEffectualName = (String(kZoneArrayValue.suffix(4)) + "amera" + String(kStr_minimumString.prefix(6))) // 获取相机权限
//: private let reportAdjust    = "reportAdjust"       // 上报Adjust
private let kObjectName = (kPresentationName.replacingOccurrences(of: "pad", with: "p") + "rtAdjus" + String(kPicOfValue)) // 上报Adjust
//: private let requestLocalPush = "requestLocalPush"  // APP在后台收到音视频通话推送
private let kRatingData = (kStr_pathValue.lowercased() + strSecondString.replacingOccurrences(of: "field", with: "s") + "tLoc" + String(kStr_scriptName.suffix(6))) // APP在后台收到音视频通话推送
//: private let getLangCode      = "getLangCode"        // 获取系统语言
private let k_captureData = (kLinkData.replacingOccurrences(of: "agent", with: "g") + String(kStr_languageName)) // 获取系统语言
//: private let getTimeZone      = "getTimeZone"        // 获取当前系统时区
private let kEndFieldValue = (String(kStr_serviceValue.suffix(6)) + String(kNeedName.suffix(5))) // 获取当前系统时区
//: private let getInstalledApps = "getInstalledApps"   // 获取已安装应用列表
private let k_methodOfChoiceString = (String(kStr_showString)) // 获取已安装应用列表
//: private let getSystemUUID    = "getSystemUUID"      // 获取系统UUID
private let k_systemTransformString = (String(kMagnitudeValue.prefix(6)) + "temUUI" + kStr_nextData.replacingOccurrences(of: "service", with: "D")) // 获取系统UUID
//: private let getCountryCode   = "getCountryCode"     // 获取当前系统地区
private let kResolutionString = (String(kStr_productString.prefix(4)) + "ountr" + String(kBeginString)) // 获取当前系统地区
//: private let inAppRating      = "inAppRating"        // 应用内评分
private let kStatusWarnString = (String(strAgainRevenueData.prefix(6)) + kStr_accessStatusData.replacingOccurrences(of: "approval", with: "ng")) // 应用内评分
//: private let apPay            = "apPay"              // 苹果支付
private let k_immoderationString = (String(kPicString)) // 苹果支付
//: private let subscribe        = "subscribe"          // 苹果支付-订阅
private let kReflectorData = (String(kStr_failureMinimumData)) // 苹果支付-订阅
//: private let openSystemBrowser = "openSystemBrowser" // 调用系统浏览器打开url
private let k_buildSafetyData = (strScreenString.replacingOccurrences(of: "style", with: "n") + "Syst" + String(kStr_layerActualString.prefix(9))) // 调用系统浏览器打开url
//: private let closeWebview     = "closeWebview"       // 关闭当前webview
private let kSuspensionName = (String(kStr_rotationalLatencyString) + String(kStr_positiveFeedbackString.prefix(7))) // 关闭当前webview
//: private let openNewWebview   = "openNewWebview"     // 使用新webview打开url
private let kMaxValue = (String(strFlexibleOffName.suffix(7)) + String(strOriginName.prefix(7))) // 使用新webview打开url
//: private let reloadWebview    = "reloadWebview"      // 重载webView
private let k_numberData = (kStr_safetyName.replacingOccurrences(of: "from", with: "re") + "adWe" + kStr_kindString.replacingOccurrences(of: "domain", with: "vi")) // 重载webView

//: struct JSMessageModel: HandyJSON {
struct ChangeShapeTask: HandyJSON {
    //: var typeName = ""
    var typeName = ""
    //: var token: String?
    var token: String?
    //: var totalCount: Double?
    var totalCount: Double?

    //: var showText: String?
    var showText: String?
    //: var data: UserInfoModel?
    var data: DisabledReject?
    // 内购/订阅 H5参数
    //: var goodsId: String?
    var goodsId: String? // 商品Id
    //: var source: Int?
    var source: Int? // 充值来源
    //: var type: Int?
    var type: Int? // 订阅入口；1：首页banner，2：全屏充值页，3：半屏充值页，4：领取金币弹窗
    //: var url: String?
    var url: String? // url
    //: var fullscreen: Int?
    var fullscreen: Int? // fullscreen：0:页面从状态栏以下渲染 1:全屏
    //: var transparency: Int?
    var transparency: Int? // transparency：0-webview白色背景 1-webview透明背景
}

//: struct UserInfoModel: HandyJSON {
struct DisabledReject: HandyJSON {
    //: var headPic: String?
    var headPic: String? // 头像
    //: var nickname: String?
    var nickname: String? // 昵称
    //: var uid: String?
    var uid: String? // 用户Id
}

//: extension AppWebViewController {
extension CompleteOk {
    //: func handleH5Message(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
    func mandrakeTransaction(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
        //: if let model = JSMessageModel.deserialize(from: schemeDic) {
        if let model = ChangeShapeTask.deserialize(from: schemeDic) {
            //: switch model.typeName {
            switch model.typeName {
            //: case getDeviceID:
            case k_cameraData:
                //: let adidStr = AppAdjustManager.getAdjustAdid()
                let adidStr = DecisionMakerBig.brain()
                //: callBack(["typeName": model.typeName, "deviceID": adidStr])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kStr_lapseValue.map{actualData(activity: $0)}, encoding: .utf8)!: adidStr])

            //: case getFirebaseID:
            case kFieldString:
                //: AppWebViewController.getFireBaseToken { str in
                CompleteOk.product { str in
                    //: callBack(["typeName": model.typeName, "fireBaseID": str])
                    callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kStr_presentDayString.reversed(), encoding: .utf8)!: str])
                }

            //: case getAreaISO:
            case kActivityName:
                //: let arr = AppWebViewController.getCountryISOCode()
                let arr = CompleteOk.componentDown()
                //: callBack(["typeName": model.typeName, "areaISO": arr.joined(separator: ",")])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kProgressValue.map{$0^167}, encoding: .utf8)!: arr.joined(separator: ",")])

            //: case getProxyStatus:
            case kObjectTargetTransportData:
                //: let status = AppWebViewController.getUsedProxyStatus()
                let status = CompleteOk.head()
                //: callBack(["typeName": model.typeName, "isProxy": status])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kLevelStyleData.map{magnitudePoint(dismiss: $0)}, encoding: .utf8)!: status])

            //: case getLangCode:
            case k_captureData:
                //: let langCode = UIDevice.langCode
                let langCode = UIDevice.langCode
                //: callBack(["typeName": model.typeName, "langCode": langCode])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: strPathData.reversed(), encoding: .utf8)!: langCode])

            //: case getTimeZone:
            case kEndFieldValue:
                //: let timeZone = UIDevice.timeZone
                let timeZone = UIDevice.timeZone
                //: callBack(["typeName": model.typeName, "timeZone": timeZone])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kStr_bounceValue.map{imageAppTransform(pending: $0)}, encoding: .utf8)!: timeZone])

            //: case getInstalledApps:
            case k_methodOfChoiceString:
                //: let apps = UIDevice.getInstalledApps
                let apps = UIDevice.getInstalledApps
                //: callBack(["typeName": model.typeName, "installedApps": apps])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kDeviceName.map{cornerTrack(active: $0)}, encoding: .utf8)!: apps])

            //: case getSystemUUID:
            case k_systemTransformString:
                //: let uuid = UIDevice.systemUUID
                let uuid = UIDevice.systemUUID
                //: callBack(["typeName": model.typeName, "systemUUID": uuid])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kStr_micString.map{sinceMGrant(fatal: $0)}, encoding: .utf8)!: uuid])

            //: case getCountryCode:
            case kResolutionString:
                //: let countryCode = UIDevice.countryCode
                let countryCode = UIDevice.countryCode
                //: callBack(["typeName": model.typeName, "countryCode": countryCode])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: strCurrencyValue.map{buildCurrent(fatal: $0)}, encoding: .utf8)!: countryCode])

            //: case inAppRating:
            case kStatusWarnString:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: AppWebViewController.requestInAppRating()
                CompleteOk.confirmFrame()

            //: case apPay:
            case k_immoderationString:
                //: if let goodsId = model.goodsId, let source = model.source {
                if let goodsId = model.goodsId, let source = model.source {
                    //: self.applePay(productId: goodsId, source: source, payType: .Pay) { success in
                    self.upToDateValue(productId: goodsId, source: source, payType: .Pay) { success in
                        //: callBack(["typeName": model.typeName, "status": success])
                        callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: strDelayObserverData.map{sumContact(temp: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case subscribe:
            case kReflectorData:
                //: if let goodsId = model.goodsId {
                if let goodsId = model.goodsId {
                    //: self.applePay(productId: goodsId, payType: .Subscribe) { success in
                    self.upToDateValue(productId: goodsId, payType: .Subscribe) { success in
                        //: callBack(["typeName": model.typeName, "status": success])
                        callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: strDelayObserverData.map{sumContact(temp: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case openSystemBrowser:
            case k_buildSafetyData:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: if let urlStr = model.url, let openURL = URL(string: urlStr) {
                if let urlStr = model.url, let openURL = URL(string: urlStr) {
                    //: UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                    UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                }

            //: case closeWebview:
            case kSuspensionName:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: self.closeWeb()
                self.schemeTake()

            //: case openNewWebview:
            case kMaxValue:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: if let urlStr = model.url,
                if let urlStr = model.url,
                   //: let transparency = model.transparency,
                   let transparency = model.transparency,
                   //: let fullscreen = model.fullscreen {
                   let fullscreen = model.fullscreen
                {
                    //: AppWebViewController.openNewWebView(urlStr, transparency, fullscreen)
                    CompleteOk.necrologyLocal(urlStr, transparency, fullscreen)
                }

            //: case reloadWebview:
            case k_numberData:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: self.reloadWebView()
                self.currency()

            //: case getMicStatus:
            case kMicNetName:
                //: AppPermissionTool.shared.requestMicPermission { auth, isFirst in
                HandicappedBackground.shared.approval { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kFrameString.reversed(), encoding: .utf8)!: auth, String(bytes: kUserString.map{albumSource(option: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case getPhotoStatus:
            case k_domainString:
                //: AppPermissionTool.shared.requestPhotoPermission { auth, isFirst in
                HandicappedBackground.shared.establish { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kFrameString.reversed(), encoding: .utf8)!: auth, String(bytes: kUserString.map{albumSource(option: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case getCameraStatus:
            case kEffectualName:
                //: AppPermissionTool.shared.requestCameraPermission { auth, isFirst in
                HandicappedBackground.shared.color { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName, String(bytes: kFrameString.reversed(), encoding: .utf8)!: auth, String(bytes: kUserString.map{albumSource(option: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case reportAdjust:
            case kObjectName:
                //: if let token = model.token {
                if let token = model.token {
                    //: if let count = model.totalCount {
                    if let count = model.totalCount {
                        //: AppAdjustManager.addPurchasedEvent(token: token, count: count)
                        DecisionMakerBig.present(token: token, count: count)
                        //: } else {
                    } else {
                        //: AppAdjustManager.addEvent(token: token)
                        DecisionMakerBig.agendaItem(token: token)
                    }
                }
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])

            //: case requestLocalPush:
            case kRatingData:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: kLaunchValue.reversed(), encoding: .utf8)!: model.typeName])
                //: AppWebViewController.pushLocalNotification(model)
                CompleteOk.visible(model)

            //: default: break
            default: break
            }
        }
    }
}

// MARK: - Event

//: extension AppWebViewController {
extension CompleteOk {
    /// 打开新的webview
    /// - Parameters:
    ///   - urlStr: web地址
    ///   - transparency: 0：白色背景 1：透明背景
    ///   - fullscreen: 0:页面从状态栏以下渲染  1：全屏
    //: class func openNewWebView(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
    class func necrologyLocal(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
        //: let vc = AppWebViewController()
        let vc = CompleteOk()
        //: vc.urlString = urlStr
        vc.urlString = urlStr
        //: vc.clearBgColor = (transparency == 1)
        vc.clearBgColor = (transparency == 1)
        //: vc.fullscreen = (fullscreen == 1)
        vc.fullscreen = (fullscreen == 1)
        //: vc.modalPresentationStyle = .fullScreen
        vc.modalPresentationStyle = .fullScreen
        //: AppConfig.currentViewController()?.present(vc, animated: true)
        TrustExclude.actual()?.present(vc, animated: true)
    }

    /// 本地推送
    //: class func pushLocalNotification(_ model: JSMessageModel) {
    class func visible(_ model: ChangeShapeTask) {
        //: guard UIApplication.shared.applicationState != .active else { return }
        guard UIApplication.shared.applicationState != .active else { return }
        //: UNUserNotificationCenter.current().getNotificationSettings { setting in
        UNUserNotificationCenter.current().getNotificationSettings { setting in
            //: switch setting.authorizationStatus {
            switch setting.authorizationStatus {
            //: case .notDetermined, .denied, .ephemeral:
            case .notDetermined, .denied, .ephemeral:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: print()
                print()

            //: case .provisional, .authorized:
            case .provisional, .authorized:
                //: if let dataModel = model.data {
                if let dataModel = model.data {
                    //: let content = UNMutableNotificationContent()
                    let content = UNMutableNotificationContent()
                    //: content.title = dataModel.nickname ?? ""
                    content.title = dataModel.nickname ?? ""
                    //: content.body = model.showText ?? ""
                    content.body = model.showText ?? ""
                    //: let identifier = dataModel.uid ?? "\(AppName)__LocalPush"
                    let identifier = dataModel.uid ?? "\(k_performCornerSumervalData)" + (String(kClickStyleString.suffix(7)) + String(strSinceNextData))
                    //: content.userInfo = ["identifier": identifier]
                    content.userInfo = [String(bytes: kStr_eErValue.map{tunShared(handle: $0)}, encoding: .utf8)!: identifier]
                    //: content.sound = UNNotificationSound.default
                    content.sound = UNNotificationSound.default

                    //: let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    //: let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    //: let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    //: UNUserNotificationCenter.current().add(request) { _ in
                    UNUserNotificationCenter.current().add(request) { _ in
                    }
                }

            //: @unknown default:
            @unknown default:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: break
                break
            }
        }
    }

    /// 获取firebase token
    //: class func getFireBaseToken(tokenBlock: @escaping (_ str: String) -> Void) {
    class func product(tokenBlock: @escaping (_ str: String) -> Void) {
        //: Messaging.messaging().token { token, _ in
        Messaging.messaging().token { token, _ in
            //: if let token = token {
            if let token = token {
                //: tokenBlock(token)
                tokenBlock(token)
                //: } else {
            } else {
                //: tokenBlock("")
                tokenBlock("")
            }
        }
    }

    /// 获取ISO国家代码
    //: class func getCountryISOCode() -> [String] {
    class func componentDown() -> [String] {
        //: var tempArr: [String] = []
        var tempArr: [String] = []
        //: let info = CTTelephonyNetworkInfo()
        let info = CTTelephonyNetworkInfo()
        //: if let carrierDic = info.serviceSubscriberCellularProviders {
        if let carrierDic = info.serviceSubscriberCellularProviders {
            //: if !carrierDic.isEmpty {
            if !carrierDic.isEmpty {
                //: for carrier in carrierDic.values {
                for carrier in carrierDic.values {
                    //: if let iso = carrier.isoCountryCode, !iso.isEmpty {
                    if let iso = carrier.isoCountryCode, !iso.isEmpty {
                        //: tempArr.append(iso)
                        tempArr.append(iso)
                    }
                }
            }
        }
        //: return tempArr
        return tempArr
    }

    /// 获取用户代理状态
    //: class func getUsedProxyStatus() -> Bool {
    class func head() -> Bool {
        //: if AppWebViewController.isUsedProxy() || AppWebViewController.isUsedVPN() {
        if CompleteOk.camera() || CompleteOk.activeIn() {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 判断用户设备是否开启代理
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedProxy() -> Bool {
    class func camera() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }

        //: if let httpProxy = dict["HTTPProxy"] as? String, !httpProxy.isEmpty { return true }
        if let httpProxy = dict[(kVersionName.replacingOccurrences(of: "failure", with: "T") + String(strScreenName))] as? String, !httpProxy.isEmpty { return true }
        //: if let httpsProxy = dict["HTTPSProxy"] as? String, !httpsProxy.isEmpty { return true }
        if let httpsProxy = dict[(kWindowName.uppercased() + "Proxy")] as? String, !httpsProxy.isEmpty { return true }
        //: if let socksProxy = dict["SOCKSProxy"] as? String, !socksProxy.isEmpty { return true }
        if let socksProxy = dict[(String(kStr_maxResolutionData) + strMakeValue.replacingOccurrences(of: "country", with: "xy"))] as? String, !socksProxy.isEmpty { return true }

        //: return false
        return false
    }

    /// 判断用户设备是否开启代理VPN
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedVPN() -> Bool {
    class func activeIn() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }
        //: guard let scopedDic = dict["__SCOPED__"] as? [String: Any] else { return false }
        guard let scopedDic = dict[(String(strTunData) + String(kStr_sharedName.suffix(6)))] as? [String: Any] else { return false }
        //: for keyStr in scopedDic.keys {
        for keyStr in scopedDic.keys {
            //: if keyStr.contains("tap") || keyStr.contains("tun") || keyStr.contains("ipsec") || keyStr.contains("ppp"){
            if keyStr.contains((strCanScriptString.replacingOccurrences(of: "from", with: "p"))) || keyStr.contains((kLayerString.lowercased())) || keyStr.contains((kPointString.replacingOccurrences(of: "pic", with: "c"))) || keyStr.contains((kStr_waiterValue.replacingOccurrences(of: "state", with: "p"))) {
                //: return true
                return true
            }
        }
        //: return false
        return false
    }

    /// 请求应用内评分 - iOS 13+ 优化版本
    //: class func requestInAppRating() {
    class func confirmFrame() {
        //: if #available(iOS 14.0, *) {
        if #available(iOS 14.0, *) {
            // iOS 14+ 使用新的 WindowScene API（推荐）
            //: if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                //: SKStoreReviewController.requestReview(in: windowScene)
                SKStoreReviewController.requestReview(in: windowScene)
            }
            //: } else {
        } else {
            // iOS 13.x 使用传统 API
            //: SKStoreReviewController.requestReview()
            SKStoreReviewController.requestReview()
        }
    }

    // MARK: - Event

    /// 苹果支付/订阅
    /// - Parameters:
    ///   - productId: productId: 商品Id
    ///   - source: 充值来源
    //: func applePay(productId: String, source: Int = -1, payType: ApplePayType, completion: ((Bool) -> Void)? = nil) {
    func upToDateValue(productId: String, source: Int = -1, payType: SceneEmpty, completion: ((Bool) -> Void)? = nil) {
        //: ProgressHUD.show()
        BackOldView.pointInTime()
        //: var index = 0
        var index = 0
        //: if source != -1 {
        if source != -1 {
            //: index = source
            index = source
        }
        //: AppleIAPManager.shared.iap_startPurchase(productId: productId, payType: payType, source: index) { status, _, _ in
        AdContext.shared.exceptFire(productId: productId, payType: payType, source: index) { status, _, _ in
            //: ProgressHUD.dismiss()
            BackOldView.atLoad()
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: var isSuccess = false
                var isSuccess = false
                //: switch status {
                switch status {
                //: case .verityFail:
                case .verityFail:
                    //: ProgressHUD.toast( "Retry After or Go to \"Feedback\" to contact us")
                    self.BackOldViewShow()
                //: case .veritySucceed, .renewSucceed:
                case .veritySucceed, .renewSucceed:
                    //: isSuccess = true
                    isSuccess = true
                    //: self.third_jsEvent_refreshCoin()
                    self.usedIn()

                //: default:
                default:
                    //: print(" apple支付充值失败：\(status.rawValue)")
                    //: break
                    break
                }
                //: completion?(isSuccess)
                completion?(isSuccess)
            }
        }
    }
    
    func BackOldViewShow() {
        BackOldView.firstOf((String(kManiocData.suffix(5)) + " Afte" + String(kScaleString.suffix(6)) + String(kSNeverName.prefix(5))) + "\"" + (String(strElectDelayString.prefix(6)) + strRelapsingName.replacingOccurrences(of: "select", with: "ck")) + "\"" + (String(kTotalDoingTrueDiskName)))
    }
}
