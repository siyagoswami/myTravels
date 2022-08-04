//
//  AddDescriptionViewController.swift
//  myTravels
//
//  Created by Siya Goswami on 8/5/22.
//

import UIKit

class AddDescriptionViewController: UITableViewController {

    var descriptions : [DescriptionCD] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
      getDescriptions()
    }
    
    func getDescriptions()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            if let coreDataDescriptions = try? context.fetch(DescriptionCD.fetchRequest()) as? [DescriptionCD]
            {
                descriptions = coreDataDescriptions;
                tableView.reloadData()
            }
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let description = descriptions[indexPath.row]

        if description.descrip != nil
        {
            cell.textLabel?.text = description.descrip;
        }
        
      return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let addVC = segue.destination as? DescriptionViewController
        {
            addVC.previousVC = self
        }
        
    }

}
