//
//  DescriptionViewController.swift
//  myTravels
//
//  Created by Siya Goswami on 8/4/22.
//

import UIKit

class DescriptionViewController: UIViewController
{
    var previousVC = AddDescriptionViewController();
    
    @IBOutlet weak var titleDescription: UITextField!
    
    @IBOutlet weak var nameDescription: UITextField!
    
    @IBOutlet weak var descDescription: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addStory(_ sender: Any)
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {

          // we are creating a new ToDoCD object here, naming it toDo
          let description = DescriptionCD(entity: DescriptionCD.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
            
            if let descText = descDescription.text
            {
                description.descrip = descText;
            }
            

            try? context.save()

            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    @IBAction func addTimeCapsule(_ sender: Any)
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {

          // we are creating a new ToDoCD object here, naming it toDo
          let description = DescriptionCD(entity: DescriptionCD.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
            
            if let descText = descDescription.text
            {
                description.descrip = descText;
            }
            

            try? context.save()

            navigationController?.popViewController(animated: true)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

