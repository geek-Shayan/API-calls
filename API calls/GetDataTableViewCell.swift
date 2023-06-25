//
//  GetDataTableViewCellAF.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 22/5/23.
//

import UIKit

class GetDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var lbl5: UILabel!
    
    @IBOutlet weak var lbl6: UILabel!
    
    @IBOutlet weak var lbl7: UILabel!
    
    @IBOutlet weak var lbl8: UILabel!
    
    @IBOutlet weak var lbl9: UILabel!
    
    
    
    @IBOutlet weak var dataLbl1: UILabel!
    
    @IBOutlet weak var dataLbl2: UILabel!
    
    @IBOutlet weak var dataLbl3: UILabel!
    
    @IBOutlet weak var dataLbl4: UILabel!
    
    @IBOutlet weak var dataLbl5: UILabel!
    
    @IBOutlet weak var dataLbl6: UILabel!
    
    @IBOutlet weak var dataLbl7: UILabel!
    
    @IBOutlet weak var dataLbl8: UILabel!
    
    @IBOutlet weak var dataLbl9: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLbl(label1: String, label2: String, label3: String, label4: String, label5: String, label6: String, label7: String, label8: String, label9: String) {
        lbl1.text = label1
        lbl2.text = label2
        lbl3.text = label3
        lbl4.text = label4
        lbl5.text = label5
        lbl6.text = label6
        lbl7.text = label7
        lbl8.text = label8
        lbl9.text = label9
    }
    
    func setupDataLbl(label1: String, label2: String, label3: String, label4: String, label5: String, label6: String, label7: String, label8: String, label9: String) {
        dataLbl1.text = label1
        dataLbl2.text = label2
        dataLbl3.text = label3
        dataLbl4.text = label4
        dataLbl5.text = label5
        dataLbl6.text = label6
        dataLbl7.text = label7
        dataLbl8.text = label8
        dataLbl9.text = label9
    }

}
