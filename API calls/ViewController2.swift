//
//  ViewController2.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 18/5/23.
//

import UIKit

class ViewController2: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var apiResponseData = [ModelPostResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBAction func seachButtonPressed(_ sender: UIButton) {
        
        apiResponseData = []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
//        tableView.reloadData()
        
        let parameterData = ModelPost(search: textField.text ?? "")
        
        //method calling
        
        APIHandlerAF.sharedInstance.sendingPostRequest(parameters: parameterData) { apiData in
            self.apiResponseData = apiData
            print(self.apiResponseData)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}



extension ViewController2: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResponseData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostDataTableViewCell") as! PostDataTableViewCell
        cell.trainNameLbl.text = apiResponseData[indexPath.row].name
        cell.trainNumLbl.text = String(apiResponseData[indexPath.row].trainNum) 
        cell.trainFromLbl.text = apiResponseData[indexPath.row].trainFrom
        cell.trainToLbl.text = apiResponseData[indexPath.row].trainTo
        cell.fromIdLbl.text = apiResponseData[indexPath.row].data.fromID
        cell.arriveTimeLbl.text = apiResponseData[indexPath.row].data.arriveTime
        cell.departTimeLbl.text = apiResponseData[indexPath.row].data.departTime
        return cell
    }
}
