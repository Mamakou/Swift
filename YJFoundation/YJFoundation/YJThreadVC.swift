//
//  YJThreadVC.swift
//  YJFoundation
//
//  Created by yangjun on 16/1/30.
//  Copyright © 2016年 阳君. All rights reserved.
//

import UIKit

class YJThreadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 方式一
        let thread = NSThread(target: self, selector: #selector(YJThreadVC.send(_:)), object: "阳君")
        print("线程开销：\(thread.stackSize)bytes")
        thread.start() // 执行
        
        // 方式二
        NSThread.detachNewThreadSelector(#selector(YJThreadVC.send(_:)), toTarget: self, withObject: "937447974")
        
        // 方式三
        // 参考协议NSObjectProtocol
        self.performSelector(#selector(YJThreadVC.send(_:)), withObject: "直接发送")
    }
    
    func send(str: String) {
        print("是否主线程：\(NSThread.isMainThread()),接受数据：\(str)")
    }

}
