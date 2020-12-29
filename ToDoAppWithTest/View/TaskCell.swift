//
//  TaskCell.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 18.12.2020.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    var locationLabel : UILabel! = {
        let label = UILabel()
        return label
    }()
    
    var dateLabel : UILabel! = {
        let label = UILabel()
        return label
    }()
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.addSubview(titleLabel)
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
            
        } else {
            titleLabel.text = task.title
            locationLabel.text = task.location?.name
            let dateString = dateFormatter.string(from: task.date)
            dateLabel.text = dateString
        }
    }
}
