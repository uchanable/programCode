//
//  ViewController.swift
//  QRCodeTuto_Swift
//
//  Created by 임유찬 on 2022/11/08.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webViewInit()
        
    }
    
    func webViewInit(){
        WKWebsiteDataStore.default().removeData(ofTypes:
        [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache],
        modifiedSince: Date(timeIntervalSince1970: 0)) {
        }
        
        webView.allowsBackForwardNavigationGestures = true
        if let url = URL(string: "https://www.apple.com"){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }


}


