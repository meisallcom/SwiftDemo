//
//  customCell1.swift
//  06 storyboard 故事板中的表格视图
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 hnqingyun. All rights reserved.
//

import UIKit

class customCell1: UITableViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(strInfo:String){
        
    }

}
