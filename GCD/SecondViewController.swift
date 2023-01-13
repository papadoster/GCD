//
//  SecondViewController.swift
//  GCD
//
//  Created by Александр Карпов on 13.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhoto()
        
        
        //        let imageURL: URL = URL(string: "https://www.planetware.com/photos-large/A/austria-vienna-hofburg.jpg")!
        //
        //        if let data = try? Data(contentsOf: imageURL) {
        //            self.myImageView.image = UIImage(data: data)
        //        }
        
        //        for i in 0...400000 {
        //            print(i)
        //        }
        
        //        DispatchQueue.concurrentPerform(iterations: 200000) {
        //            print("\($0) times")
        //            print(Thread.current)
        //        }
        
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 200000) {
                print("\($0) times")
                print(Thread.current)
            }
        }
        
        
        
        
    }
    
    
    //MARK: - функция переместить загрузку не в main очередь а в глобал!
    
    func loadPhoto() {
        guard let imageURL: URL = URL(string: "https://www.planetware.com/photos-large/A/austria-vienna-hofburg.jpg") else {return}
        let queue = DispatchQueue.global(qos: .utility) // create queue (not mein)
        queue.async { // запускаем ассинхронно
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async { // работаем с UI только в мейн потоке поэтому переходим туда!
                    self.myImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
}
