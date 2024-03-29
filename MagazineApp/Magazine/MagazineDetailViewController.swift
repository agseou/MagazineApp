//
//  MagazineDetailViewController.swift
//  MagazineApp
//
//  Created by 은서우 on 2024/01/15.
//

import UIKit
import WebKit

class MagazineDetailViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
        }
       
    }
}

