//
//  DetailViewController.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 24.12.2020.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var dateLabel: UILabel!
    var locationLabel: UILabel!
    var mapView: MKMapView!
    var task: Task!
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        dateLabel = UILabel()
        locationLabel = UILabel()
        mapView = MKMapView()
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        view.addSubview(locationLabel)
        view.addSubview(mapView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.description
        self.locationLabel.text = task.location?.name
        self.dateLabel.text = dateFormatter.string(from: task.date)
        
        if let coordinate = task.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: 100,
                                        longitudinalMeters: 100)
            mapView.region = region
        }
    }
}
