//
//  AddToList.swift
//  Mealon
//
//  Created by Scholar on 8/2/22.
//

import UIKit

class AddToList: UIViewController {
var previousVC = MealsTableViewController()
    
    @IBOutlet weak var mealName: UITextField!
    
    @IBOutlet weak var ingNeeded: UITextField!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var breakfastSwitch: UISwitch!
    
    @IBOutlet weak var lunchSwitch: UISwitch!
    
    @IBOutlet weak var dinnerSwitch: UISwitch!
    
//    breakfast == breakfastSwitch
//    lunch == lunchSwitch
//    dinner == dinnerSwitch 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToList(_ sender: Any) {
        let meal = Meal()
        if let mealName = mealName.text {
            meal.name = mealName
            meal.ingredients = ingNeeded.text!
            meal.breakfast = breakfastSwitch.isOn
            meal.lunch = lunchSwitch.isOn
            meal.dinner = dinnerSwitch.isOn
            meal.date = datePicker.date
        }
        previousVC.meals.append(meal)
        previousVC.tableView.reloadData()
        print(previousVC.meals)
        print(previousVC.meals[0].name)
//        performSegue(withIdentifier: "goBackToList", sender: meal)
//        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)

    }
    //comment 
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let mealListVC = segue.destination as? MealsTableViewController {
            if let meal = sender as? Meal {
                mealListVC.meals.append(meal)
                previousVC.tableView.reloadData()
            }
          }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
