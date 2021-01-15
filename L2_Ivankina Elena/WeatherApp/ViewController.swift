//
//  ViewController.swift
//  WeatherApp
//
//  Created by Елена Иванкина on 13.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var loginTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    
    private var keyboardShown = false
    private var loginsAndPasswords: [String: String] = ["admin":"777"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObservers()
        addTapGestureRecognizer()
    }

    private func addKeyboardObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard !keyboardShown else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        scrollView?.contentInset.bottom += keyboardFrame.height
        keyboardShown = true
    }

    @objc private func keyboardWillHide(notification: Notification) {
        guard keyboardShown else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else {
            return
        }
        scrollView?.contentInset.bottom -= keyboardFrame.height
        keyboardShown = false
    }
    
    private func addTapGestureRecognizer() {
      let recognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
      view.addGestureRecognizer(recognizer)
     }
     
     
     @objc private func endEditing() {
      view.endEditing(true)
     }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let login = loginTextField?.text else {return false }
        guard let password = passwordTextField?.text else {return false}
        
        if (loginsAndPasswords[login] == password) {
            return true
        } else {
        let alert = UIAlertController(title: "Увы!", message: "Неправильный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Попробовать еще раз", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
            return false
        }
    }

}

