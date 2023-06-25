//
//  PostDataTableViewCell.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 21/5/23.
//

import UIKit

class PostDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trainNameLbl: UILabel!
    
    @IBOutlet weak var trainNumLbl: UILabel!
    
    @IBOutlet weak var trainFromLbl: UILabel!
    
    @IBOutlet weak var trainToLbl: UILabel!
    
    @IBOutlet weak var fromIdLbl: UILabel!
    
    @IBOutlet weak var arriveTimeLbl: UILabel!
    
    @IBOutlet weak var departTimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
