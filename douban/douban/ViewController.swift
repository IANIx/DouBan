//
//  ViewController.swift
//  douban
//
//  Created by 薛佳妮 on 2018/1/22.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var someStrs = [String]()
        
        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]
        
        for item in someStrs {
            print(item)
        }
       
        print(testfunc(name: "呵呵哒"))
        
        
        let bounds = minMax(array: [1,2,89,-676,6767])
        print("最小值：\(bounds.min) 最大值：\(bounds.max)")
        
        print(pow(firstArg: 5, secondArg: 3))
        pow2(a: 5, b: 3)
        
        vari(members: 4,5,6)
    }

    func testfunc(name:String) ->String {
        return (name)
    }
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }

    func pow(firstArg a: Int, secondArg b: Int) -> Int {
        var res = a
        for _ in 1..<b {
            res = res * a
        }
        print(res)
        return res
    }
    
    @discardableResult //处理返回值的警告
    func pow2(a: Int, b: Int) -> Int {
        var res = a
        for _ in 1..<b {
            res = res * a
        }
        print(res)
        return res
    }
    
    func vari<N>(members:N...) {
        for i in members {
            print(i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

