//
//  TableViewExampleView.swift
//  SpeedLayoutExample
//
//  Created by Maxim Vingalov on 26.09.17.
//  Copyright © 2017 Maxim Vingalov. All rights reserved.
//

import UIKit

class TableViewExampleView: BaseView {
    
    fileprivate let tableView = UITableView()
    fileprivate let methodCellTemplate = MethodCell()
    
    fileprivate var methods: [Method] = []
    
    override init() {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 10
        tableView.register(MethodCell.self, forCellReuseIdentifier: MethodCell.reuseIdentifier)
        tableView.register(MethodGroupHeader.self, forHeaderFooterViewReuseIdentifier: MethodGroupHeader.reuseIdentifier)
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(methods: [Method]) {
        self.methods = methods
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.pin.topLeft().bottomRight()
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension TableViewExampleView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return MethodGroupHeader.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MethodGroupHeader.reuseIdentifier) as! MethodGroupHeader
        header.configure(title: "Flex container methods")
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodCell.reuseIdentifier, for: indexPath) as! MethodCell
        cell.configure(method: methods[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // The UITableView will call the cell's sizeThatFit() method to compute the height.
        // WANRING: You must also set the UITableView.estimatedRowHeight for this to work.
        return UITableViewAutomaticDimension
    }
}

