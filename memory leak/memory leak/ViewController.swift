//
//  ViewController.swift
//  memory leak
//
//  Created by 張書涵 on 2018/8/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//
import UIKit

// Closure Strong Reference Cycle

class HTMLElement {
    
    let name: String
    let text: String
    
    lazy var asHTML: () -> String = {
        return "<\(self.name)>\(self.text)</\(self.name)>"
    }
    
    //    lazy var asHTML: () -> String = { [weak self] in
    //        guard let this = self else { return "" }
    //        return "<\(this.name)>\(this.text)</\(this.name)>"
    //    }
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("HTMLElement \(name) is being deallocated")
    }
    
}
class ViewConrtoller:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Some sample paragraph body text")
        
        paragraph?.asHTML() //<p>Some sample paragraph body text</p>
        
        paragraph = nil
        
    }
    
}
