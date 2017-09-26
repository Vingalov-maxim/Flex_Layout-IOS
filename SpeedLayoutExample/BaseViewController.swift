//
//  BaseViewController.swift
//  SpeedLayoutExample
//
//  Created by Maxim Vingalov on 26.09.17.
//  Copyright © 2017 Maxim Vingalov. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let view = view as? BaseView {
            view.setLayoutGuides(top: topLayoutGuide.length, bottom: bottomLayoutGuide.length)
        }
    }

}
