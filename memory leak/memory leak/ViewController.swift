//
//  ViewController.swift
//  memory leak
//
//  Created by 張書涵 on 2018/8/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//
import UIKit

protocol SendDataDelegate: class {
    
}

class SendingVC: UIViewController {
    
    //   weak var delegate: SendDataDelegate? // 不會 memory leak
    var delegate: SendDataDelegate? // 會 memory leak
    
    var receivingVC: ReceivingVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receivingVC = ReceivingVC()
        
        receivingVC = nil
    }
    
}

class ReceivingVC: SendDataDelegate {
    
    lazy var sendingVC = SendingVC()
    
    init() {
        
        sendingVC.delegate = self
        
        print("sendingVC.delegate = self")
    }
    
    deinit {
        print("deinit了喲！")
    }
}
