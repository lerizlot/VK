//
//  ViewController.swift
//  VK
//
//  Created by Lera on 27.04.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        // Получаем текст логина
        let login = emailTextField.text!
        // Получаем текст-пароль
        let password = passwordTextField.text!
        
        // Проверяем, верны ли они
        if login == "" && password == "" {
            print("Authorization successfull")
        } else {
            print("Error")
        }
    }
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBAction func appleSignInButton(_ sender: Any) {
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    // Получаем прокрутку
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу ScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    // Убираем клавиатуру при клике по пустому месту на экране
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // проверяем данные
        let checkResult = checkUserData()
        
        // если данные не верны, покажет ошибку
        if !checkResult {
            showLoginError ()
        }
        // вернем результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = emailTextField.text,
              let password = passwordTextField.text else { return false }
        
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    // показ сообщения о неправильно введенных данных
    func showLoginError() {
        // создаем контроллер
        let alert = UIAlertController(title: "Error", message: "Entered wrong data", preferredStyle: .alert)
        // создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // добавляем кнопку на UIAlertController
        alert.addAction(action)
        // показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    // Метод подписки на сообщения из центра уведомлений, которые рассылает клавиатура
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Второе - когда она пропадет
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // Метод отписки при исчезновении контроллера с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
}

