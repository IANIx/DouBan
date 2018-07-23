//
//  HomeViewController.swift
//  douban
//
//  Created by 薛佳妮 on 2018/1/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit
import SnapKit
import ObjectMapper

class HomeViewController: DBViewController,UITableViewDelegate,UITableViewDataSource {
    
    private(set) var tableView : UITableView! = nil
    
    var layouts : NSMutableArray! = NSMutableArray.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subViews()
        self.setupText()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func subViews() {
        self.navigationController?.navigationBar.barTintColor = MAIN_COLOR
//        self.additionalSafeAreaInsets = UIEdgeInsetsMake(-40, 0, 0, 0)
        tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
      
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(self.view)
        }
       
    }
    
    
    func setupText() {
        
        let filePath = Bundle.main.path(forResource: "homeSource", ofType: "geojson")!
        let url = NSURL.fileURL(withPath: filePath)
    
        let data : NSData? = NSData(contentsOf: url)
        let str = String (data: data! as Data, encoding: String.Encoding.utf8)
        
        let status = Mapper<DBHomeStatus>().mapArray(JSONString: str!)
        
        for item : DBHomeStatus! in status! {
            let layout : DBHomeLayout = DBHomeLayout.init(status: item)
            layouts.add(layout)
        }
        
        self.tableView.reloadData()
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return layouts.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let layout = layouts[indexPath.row] as! DBHomeLayout
        return layout.height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell";
        var cell : HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HomeTableViewCell
        
        if (cell.isEqual(nil)) {
            cell = HomeTableViewCell.init(style: .default, reuseIdentifier: cellID)
        }
        
        let layout = layouts[indexPath.row] as! DBHomeLayout
        cell.setLayout(layout: layout)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001;
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
