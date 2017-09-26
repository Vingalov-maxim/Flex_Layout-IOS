//
//  MethodCell.swift
//  SpeedLayoutExample
//
//  Created by Maxim Vingalov on 26.09.17.
//  Copyright © 2017 Maxim Vingalov. All rights reserved.
//

import UIKit

class MethodCell: UITableViewCell {
    static let reuseIdentifier = "MethodCell"
    fileprivate let padding: CGFloat = 10
    
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero
        
        let iconImageView = UIImageView(image: UIImage(named: "method"))
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        
        // Use contentView as the root flex container
        contentView.flex.padding(8).define { (flex) in
            flex.addItem().direction(.row).define({ (flex) in
                flex.addItem(iconImageView).size(30)
                flex.addItem(nameLabel).marginLeft(padding).grow(1)
            })
            
            flex.addItem(descriptionLabel).marginTop(padding)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(method: Method) {
        // WARNING: After a control size may have been modified after a change, you must call flex.markDirty()
        //          to force flex to relayout the view. This is due to the high level of optimization of FlexLayout.
        nameLabel.text = method.name
        nameLabel.flex.markDirty()
        
        descriptionLabel.text = method.description
        descriptionLabel.flex.markDirty()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    fileprivate func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 1) Set the contentView's width to the specified size parameter
        contentView.pin.width(size.width)
        
        // 2) Layout contentView flex container
        layout()
        
        // Return the flex container new size
        return contentView.frame.size
    }
}

