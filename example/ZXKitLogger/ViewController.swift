//
//  ViewController.swift
//  ZXKitLogger
//
//  Created by Damon on 2019/6/24.
//  Copyright © 2019 Damon. All rights reserved.
//

import UIKit
import ZXKitCore

class ViewController: UIViewController {

    lazy var clickButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 130, width: 120, height: 100)
        button.setTitle("添加日志", for: UIControl.State.normal)
        return button
    }()
    
    lazy var deleteButton: UIButton = {
           let button = UIButton(type: UIButton.ButtonType.custom)
           button.backgroundColor = UIColor.red
           button.frame = CGRect(x: 150, y: UIScreen.main.bounds.size.height - 130, width: 150, height: 100)
           button.setTitle("删除本地日志文件", for: UIControl.State.normal)
           return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.clickButton)
        self.view.addSubview(self.deleteButton)
        self.clickButton.addTarget(self, action: #selector(onClickButton), for: UIControl.Event.touchUpInside)
        self.deleteButton.addTarget(self, action: #selector(onClickdeleteButton), for: UIControl.Event.touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //配置ZXKitLogger
        ZXKitLogger.show()
        //输出加密内容
        ZXKitLogger.privacyLogPassword = "12345678901234561234567890123456" //设置加密内容密码
    }

    @objc func onClickButton() {
//        ZXKit.show()
        printInfo("点击了按钮111")
        printError("错误出现")
        printInfo("调试数据文件地址", ZXKitLogger.getDBFolder().path)
        for _ in 0..<100 {
            printLog("测试输出，不会写入悬浮窗")
            printLog("测试输出，不会写入悬浮窗","222222","3333333")
            //普通输出
            printInfo("点击了按钮111")
            printInfo("输出多个",22)
            //输出警告内容
            printWarn("警告提示")
            //输出错误内容
            printError("错误出现")

            printPrivacy("这个是加密数据的测试数据222")
            //输出字典
            let dicObj = ["hhhhhhh":"撒旦法是打发斯蒂芬是打发斯蒂芬","77777":"数据库的复健科花见花开会尽快圣诞节开发和金黄色的费四大皆空回复就开始和豆腐是砍价的回复斯柯达金凤凰"]
            printInfo(dicObj)
            //输出数组
            let arrayObj = ["1111111","22222222","sdjkhfsjkdfjkhsdhjfk","3333sjdhgfhjg"]
            printInfo(arrayObj)
        }
    }
    
    @objc func onClickdeleteButton() {
        ZXKitLogger.deleteLogFile()
    }
}

