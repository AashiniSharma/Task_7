//
//  SignInPageVC.swift
//  Task_7
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class SignInPageVC: UIViewController {
    
    //MARK:VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IB ACTIONS
    @IBAction func signUp(_ sender: UIButton) {
        
        guard let scrollView = sender.getScrollView else { return}
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            scrollView.contentOffset.x = scrollView.frame.width}, completion: nil)
    }

    
}
