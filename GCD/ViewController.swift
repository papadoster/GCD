//
//  ViewController.swift
//  GCD
//
//  Created by Александр Карпов on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        //MARK: - задержка на 4 сек!
        
//        afterBlock(seconds: 4, queue: .global()) {
//            print("Hello")
//            DispatchQueue.main.async {
//                self.showAlert()
//            }
//            print(Thread.current)
//        }
        
        
    }
    
    
    @IBAction func myButton(_ sender: UIButton) {
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Achtung!", message: "Press the button", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: -  типовая функция задержки
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(), complition: @escaping ()->()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            complition()
        }
    }

}

