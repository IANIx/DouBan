//
//  DBTabBarViewController.swift
//  douban
//
//  Created by 薛佳妮 on 2018/1/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit

class DBTabBarViewController: UITabBarController {
    var naviArray : NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        initObj()
        initChildVC()
        // Do any additional setup after loading the view.
    }

    func registNavigationHooks() {
        
    }
    
    func initObj() {
        naviArray = NSMutableArray.init()
    }
    
    //MARK: - 动画
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.beginAnimation()
    }
    
    func beginAnimation() {
        let animation = CATransition.init()
        animation.duration = 0.5
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFromBottom
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        self.view.layer.add(animation, forKey: "switchView")
    }
    
    //MARK: - 初始化子VC
    func initChildVC() {
        
        let path = Bundle.main.path(forResource: "Tabbar", ofType: "plist")!
        let array : NSArray = NSArray.init(contentsOfFile: path as String)!

        for data in array {
            let dic = data as! [String : String]
            let nav = setChildVC(vm: dic["vm"]!, vc: dic["vc"]!, title: dic["title"]!, imageName: dic["normalName"]!, selectedName: dic["selectedName"]!)
            addChildViewController(nav)
            naviArray.add(nav)
            
        }
    }
    
    func setChildVC(vm : String, vc : String, title : String,imageName : String, selectedName : String) ->UINavigationController {
        let vcClass = NSClassFromString("douban.\(vc)") as! DBViewController.Type
        let vmClass = NSClassFromString("douban.\(vm)") as! DBBaseViewModel.Type
        let vm = vmClass.init(title: title)
        let vc = vcClass.init(viewModel : vm)

        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        vc.title = title
        
        let dic = [NSAttributedStringKey.foregroundColor: BLACK_COLOR, NSAttributedStringKey.font: dSystemFont(size: 10)]
        vc.tabBarItem.setTitleTextAttributes(dic, for: UIControlState.normal)
        
        let selectedDic = [NSAttributedStringKey.foregroundColor: MAIN_COLOR, NSAttributedStringKey.font: dSystemFont(size: 10)]
        vc.tabBarItem.setTitleTextAttributes(selectedDic, for: UIControlState.selected)
        
        let nav = UINavigationController.init(rootViewController: vc)
        
        return nav
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
