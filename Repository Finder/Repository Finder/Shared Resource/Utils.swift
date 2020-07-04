//
//  Utils.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static let screenBounds = UIScreen.main.bounds
    class func makeRound(view : UIView , cornerRadius : CGFloat , borderWidth : CGFloat , borderColor : UIColor){
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
    }
    
    class func checkIfTextFieldsAreEmpty(textFields: [UITextField])-> Bool {
        
        if (textFields.filter{$0.text == ""}.count) > 1{
            return false
        }
        return true
        
    }
    
    class func isTextFieldEmpty(textArray : [String])->Bool{
        return (textArray.filter { $0.isEmpty }.count > 0)
    }
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func createAttributedString(fullString: String, fullStringColor: UIColor, subString: String, subStringColor: UIColor) -> NSMutableAttributedString
    {
        let range = (fullString as NSString).range(of: subString)
        let attributedString = NSMutableAttributedString(string:fullString)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: fullStringColor, range: NSRange(location: 0, length: fullString.characters.count))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: subStringColor, range: range)
        return attributedString
    }
    
    class func getSubViewsSize(mainView : UIView)->CGSize{
        var contentRect = CGRect.zero
        
        for view in mainView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        return contentRect.size
    }
    
    public static func openShareWidget (viewController : UIViewController , sender : UIView , textToShare : String){
        
        let objectsToShare = [textToShare , URL(string: "itms-apps://itunes.apple.com/us/app/apple-store/id1352722428?mt=8") ?? ""] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = sender
        viewController.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    class func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appId)") else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
    class func isNil(object : AnyObject?)->Bool{
        return (object == nil)
    }
    
    class func makeViewCircular(view : UIView , borderWidth : CGFloat , borderColor : UIColor){
        
        view.layer.borderWidth = borderWidth
        view.layer.masksToBounds = false
        view.layer.borderColor = borderColor.cgColor
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }
    
    
    
    class func createCardView(view : UIView , backgroundColor : UIColor , borderColor : UIColor , borderWidth : CGFloat , cornerRadius : CGFloat){
        view.backgroundColor = backgroundColor
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = cornerRadius
        
    }

    class func printlocalDbUrl() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("LOCAL DB URL : \(urls[urls.count-1] as URL)")
    }
    
    public class func addShadow(view : UIView , color : CGColor , opacity : Float ){
        
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 5
        
    }
    
    class func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        return imageData!.base64EncodedString()
    }
    
    class func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    class func log(_ message: Any, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        print("[\(file):\(line)] \(function) - \(message)")
    }
    

    
}
