
//: Declare String Begin

/*: "LaunchImage" :*/
fileprivate let kStr_lightSafetyName:String = "safe decision can behindLaunch"
fileprivate let kStr_pleaseString:String = "Imagesound return load"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  ExtraViewController.swift
//  OverseaH5
//
//  Created by DouXiu on 2025/11/27.
//

//: import UIKit
import UIKit

//: class WaitViewController: UIViewController {
class ExtraViewController: UIViewController {
    //: override func viewDidLoad() {
    override func viewDidLoad() {
        //: super.viewDidLoad()
        super.viewDidLoad()
        //: let bgImgV = UIImageView()
        let bgImgV = UIImageView()
        //: bgImgV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        bgImgV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        //: bgImgV.image = UIImage(named: "LaunchImage")
        bgImgV.image = UIImage(named: (String(kStr_lightSafetyName.suffix(6)) + String(kStr_pleaseString.prefix(5))))
        //: view.addSubview(bgImgV)
        view.addSubview(bgImgV)
    }
}
