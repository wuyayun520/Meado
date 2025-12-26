
//: Declare String Begin

/*: "Net Error, Try again later" :*/
fileprivate let strStartValue:String = "Net Eneed net link view"
fileprivate let kStr_kitLevelString:String = ", Try prompt register"
fileprivate let kStr_poorString:[Character] = [" ","l","a","t","e","r"]

/*: "data" :*/
fileprivate let kAgentName:String = "DATA"

/*: ":null" :*/
fileprivate let kStr_secondName:String = ":nullcolor challenge try forward value"

/*: "json error" :*/
fileprivate let kStr_backgroundValue:String = "JSON"

/*: "platform=iphone&version= :*/
fileprivate let kFilterData:[Character] = ["p","l","a","t","f","o","r","m","=","i","p","h","o","n","e","&","v","e","r","s","i"]
fileprivate let strEstablishValue:[Character] = ["o","n","="]

/*: &packageId= :*/
fileprivate let strToolData:String = "&packatake and with"
fileprivate let kStr_totalMakeData:String = "used lab finishgeId="

/*: &bundleId= :*/
fileprivate let strStopValue:[Character] = ["&","b","u","n","d","l","e","I","d","="]

/*: &lang= :*/
fileprivate let strScriptString:String = "model large error server run&lang="

/*: ; build: :*/
fileprivate let strListData:[Character] = [";"," ","b","u","i","l","d",":"]

/*: ; iOS  :*/
fileprivate let strOfValue:String = "; iOS and request resolution rating try"

//: Declare String End

//: import Alamofire
import Alamofire
//: import CoreMedia
import CoreMedia
//: import HandyJSON
import HandyJSON
// __DEBUG__
// __CLOSE_PRINT__
//: import UIKit
import UIKit

//: typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: AppErrorResponse?) -> Void
typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: ClientCarrierSource?) -> Void

//: @objc class AppRequestTool: NSObject {
@objc class EngageModify: NSObject {
    /// 发起Post请求
    /// - Parameters:
    ///   - model: 请求参数
    ///   - completion: 回调
    //: class func startPostRequest(model: AppRequestModel, completion: @escaping FinishBlock) {
    class func thatObject(model: EmptySelectedModel, completion: @escaping FinishBlock) {
        //: let serverUrl = self.buildServerUrl(model: model)
        let serverUrl = self.captureAfter(model: model)
        //: let headers = self.getRequestHeader(model: model)
        let headers = self.fire(model: model)
        //: AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
        AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
            //: switch responseData.result {
            switch responseData.result {
            //: case .success:
            case .success:
                //: func__requestSucess(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)
                pillaged(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)

            //: case .failure:
            case .failure:
                //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "Net Error, Try again later"))
                completion(false, nil, ClientCarrierSource(errorCode: AgainVisible.NetError.rawValue, errorMsg: (String(strStartValue.prefix(5)) + "rror" + String(kStr_kitLevelString.prefix(6)) + "again" + String(kStr_poorString))))
            }
        }
    }

    //: class func func__requestSucess(model: AppRequestModel, response: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
    class func pillaged(model: EmptySelectedModel, response: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
        //: var responseJson = String(data: responseData, encoding: .utf8)
        var responseJson = String(data: responseData, encoding: .utf8)
        //: responseJson = responseJson?.replacingOccurrences(of: "\"data\":null", with: "\"data\":{}")
        responseJson = responseJson?.replacingOccurrences(of: "\"" + (kAgentName.lowercased()) + "\"" + (String(kStr_secondName.prefix(5))), with: "" + "\"" + (kAgentName.lowercased()) + "\"" + ":{}")
        //: if let responseModel = JSONDeserializer<AppBaseResponse>.deserializeFrom(json: responseJson) {
        if let responseModel = JSONDeserializer<KindMissingLabel>.deserializeFrom(json: responseJson) {
            //: if responseModel.errno == RequestResultCode.Normal.rawValue {
            if responseModel.errno == AgainVisible.Normal.rawValue {
                //: completion(true, responseModel.data, nil)
                completion(true, responseModel.data, nil)
                //: } else {
            } else {
                //: completion(false, responseModel.data, AppErrorResponse.init(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                completion(false, responseModel.data, ClientCarrierSource(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                //: switch responseModel.errno {
                switch responseModel.errno {
//                case AgainVisible.NeedReLogin.rawValue:
//                    NotificationCenter.default.post(name: DID_LOGIN_OUT_SUCCESS_NOTIFICATION, object: nil, userInfo: nil)
                //: default:
                default:
                    //: break
                    break
                }
            }
            //: } else {
        } else {
            //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "json error"))
            completion(false, nil, ClientCarrierSource(errorCode: AgainVisible.NetError.rawValue, errorMsg: (kStr_backgroundValue.lowercased() + " error")))
        }
    }

    //: class func buildServerUrl(model: AppRequestModel) -> String {
    class func captureAfter(model: EmptySelectedModel) -> String {
        //: var serverUrl: String = model.requestServer
        var serverUrl: String = model.requestServer
        //: let otherParams = "platform=iphone&version=\(AppNetVersion)&packageId=\(PackageID)&bundleId=\(AppBundle)&lang=\(UIDevice.interfaceLang)"
        let otherParams = (String(kFilterData) + String(strEstablishValue)) + "\(k_objectEndName)" + (String(strToolData.prefix(6)) + String(kStr_totalMakeData.suffix(5))) + "\(kReportData)" + (String(strStopValue)) + "\(k_ratingString)" + (String(strScriptString.suffix(6))) + "\(UIDevice.interfaceLang)"
        //: if !model.requestPath.isEmpty {
        if !model.requestPath.isEmpty {
            //: serverUrl.append("/\(model.requestPath)")
            serverUrl.append("/\(model.requestPath)")
        }
        //: serverUrl.append("?\(otherParams)")
        serverUrl.append("?\(otherParams)")

        //: return serverUrl
        return serverUrl
    }

    /// 获取请求头参数
    /// - Parameter model: 请求模型
    /// - Returns: 请求头参数
    //: class func getRequestHeader(model: AppRequestModel) -> HTTPHeaders {
    class func fire(model: EmptySelectedModel) -> HTTPHeaders {
        //: let userAgent = "\(AppName)/\(AppVersion) (\(AppBundle); build:\(AppBuildNumber); iOS \(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        let userAgent = "\(k_performCornerSumervalData)/\(kKnownDelayValue) (\(k_ratingString)" + (String(strListData)) + "\(k_lostDeviceString)" + (String(strOfValue.prefix(6))) + "\(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        //: let headers = [HTTPHeader.userAgent(userAgent)]
        let headers = [HTTPHeader.userAgent(userAgent)]
        //: return HTTPHeaders(headers)
        return HTTPHeaders(headers)
    }
}
