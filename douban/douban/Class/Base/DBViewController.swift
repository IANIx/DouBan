//
//  DBViewController.swift
//  douban
//
//  Created by 薛佳妮 on 2018/1/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit

class DBViewController: UIViewController {
    private(set) var vm : DBBaseViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(viewModel vm : DBBaseViewModel){
        super.init(nibName: nil, bundle: nil)
        self.vm = vm
        
    }
    
    func initView() {
        self.view.backgroundColor = BACK_COLOR
        if self.navigationController != nil && self != self.navigationController?.viewControllers.first {
            resetNavi()
        }
    }
    
    func resetNavi() {
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.setBackgroundImage(UIImage.init(named: "backbutton_icon3"), for: .normal)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        leftBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
    }
    
    @objc func backBtnClick() {
        print("返回按钮点击")
        self.navigationController!.popViewController(animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
