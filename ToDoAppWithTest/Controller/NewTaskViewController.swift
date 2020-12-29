//
//  NewTaskViewController.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 26.12.2020.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()

    var titleTextField: UITextField!
    var locationTextField: UITextField!
    var dateTextField: UITextField!
    var adressTextField: UITextField!
    var descriptionTextField: UITextField!
    var saveButton: UIButton!
    var cancelButton: UIButton!
     
    var dateFormatter: DateFormatter{
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField = UITextField()
        locationTextField = UITextField()
        dateTextField = UITextField()
        adressTextField = UITextField()
        descriptionTextField = UITextField()
        saveButton = UIButton()
        cancelButton = UIButton()
        
        view.addSubview(titleTextField)
        view.addSubview(locationTextField)
        view.addSubview(dateTextField)
        view.addSubview(adressTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }

    @objc func save() {
        guard
        let titleString = titleTextField.text,
        let locationString = locationTextField.text,
        let date = dateFormatter.date(from: dateTextField.text!),
        let descriptionString = descriptionTextField.text,
        let adressString = adressTextField.text
        else {
            return
        }
        geocoder.geocodeAddressString(adressString) {[unowned self] (placemarks, error) in
            guard error == nil else { return }
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString, coordinate: coordinate)
            let task = Task(title: titleString, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
        }
    }
}


