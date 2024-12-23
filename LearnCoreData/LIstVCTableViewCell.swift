//
//  LIstVCTableViewCell.swift
//  LearnCoreData
//
//  Created by Abhay Chaurasia on 11/09/24.
//

import UIKit

class LIstVCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    
    @IBOutlet weak var citylbl: UILabel!
    @IBOutlet weak var mobilelbl: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
            super.setSelected(selected, animated: animated)
    }

}
