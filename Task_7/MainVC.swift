//
//  SignInPageVC.swift
//  Task_7
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: PROPERTIES
    var signIn = SignInPageVC()
    var signUp = SignUpPageVC()
   
    //MARK: IB OUTLETS
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var viewForLineUnderButton: UIView!
    @IBOutlet weak var bottomConstraintOfScrollView: NSLayoutConstraint!
    
    //MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //instantiating sign in and sign up pages
        signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInPageVCID") as! SignInPageVC
        signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPageVCID") as! SignUpPageVC
        
        //adding child views
        self.addChildViewController(signIn)
        self.addChildViewController(signUp)
        
        //adding sub views
        self.mainScrollView.addSubview(signIn.view)
        self.mainScrollView.addSubview(signUp.view)
        
        //setting scroolview delegate
        self.mainScrollView.delegate = self
        
        //setting notification center for keyboard
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
                else{ return }
            
            let keyboardHeight = userinfo.cgRectValue.height
            self.bottomConstraintOfScrollView.constant = keyboardHeight-130
        })
        
        //Adding Oveserver To Notification Centre for notifying KeyboardWillHide
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            self.bottomConstraintOfScrollView.constant = 0
            
        })

        signUp.loginButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        signIn.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)

        
    }
    
    override func viewWillLayoutSubviews() {
        
        //scrollview height
        self.mainScrollView.frame.size = CGSize(width: self.view.frame.width, height: 327)
        
        let scrollViewHeight = mainScrollView.frame.height
        let scrollViewWidth = mainScrollView.frame.width
        
        //setting frames for sign in and sign up pages
        signIn.view.frame = CGRect(x: 0, y: 0, width: scrollViewWidth, height: scrollViewHeight)
        signUp.view.frame = CGRect(x: scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollViewHeight)
        
        //increasing the size of scrollview
        self.mainScrollView.contentSize = CGSize(width: scrollViewWidth*2, height: scrollViewHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IB ACTIONS
    @IBAction func signInButtonAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
            
            self.mainScrollView.contentOffset.x = 0
            
        }, completion: nil)

    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
            
            self.mainScrollView.contentOffset.x = self.mainScrollView.frame.width
            
            
        }, completion: nil)
        
    }
}

//MARK: SCROLLVIEW DELEGATE
extension MainVC:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let multiplier = self.mainScrollView.frame.width/self.viewForLineUnderButton.frame.width
        let scrollPositionForX = scrollView.contentOffset.x
        self.viewForLineUnderButton.transform = CGAffineTransform(translationX:scrollPositionForX/multiplier, y: 0)
    }
    
}
