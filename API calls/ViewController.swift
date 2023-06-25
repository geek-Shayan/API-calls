//
//  ViewController.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 16/5/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var apiResultAF = [Model]()
    var apiResultUS = [MyResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIHandlerAF.sharedInstance.fetchingAPIData { apiData in

            // MARK: - data assigning
            self.apiResultAF = apiData

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        

        APIHandlerUS.sharedInstance.getData { apiData in

            // MARK: - data assigning
            self.apiResultUS = [apiData]

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController2 = storyBoard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        viewController2.title = "POST"
        self.navigationController?.pushViewController(viewController2, animated: true)

    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return apiResultUS.count
        }
        else {
            return apiResultAF.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GetDataTableViewCell") as! GetDataTableViewCell
//            cell.textLabel?.text = apiResultUS[indexPath.row].sunrise

            
            cell.setupLbl(label1: "sunrise", label2: "sunset", label3: "sunrise", label4: "dayLength", label5: "", label6: "", label7: "", label8: "", label9: "")
            cell.setupDataLbl(label1: apiResultUS[indexPath.row].sunrise, label2: apiResultUS[indexPath.row].sunset, label3: "", label4: apiResultUS[indexPath.row].dayLength, label5: "", label6: "", label7: "", label8: "", label9: "")
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GetDataTableViewCell") as! GetDataTableViewCell
//            cell.textLabel?.text = apiResultAF[indexPath.row].userID
            cell.setupLbl(label1: "title", label2: "body", label3: "userID", label4: "", label5: "", label6: "", label7: "", label8: "", label9: "")
            cell.setupDataLbl(label1: apiResultAF[indexPath.row].title, label2: apiResultAF[indexPath.row].body, label3: String(apiResultAF[indexPath.row].userID), label4: "", label5: "", label6: "", label7: "", label8: "", label9: "")
            return cell
        }
    }
}
