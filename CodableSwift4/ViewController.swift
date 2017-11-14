//
//  ViewController.swift
//  CodableSwift4
//
//  Created by kanchanproseth on 11/14/17.
//  Copyright © 2017 kanchanproseth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        encodeDecodeSample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func encodeDecodeSample(){
        let toy1 = Toy(name: "Teddy Bear");
        let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(employee1)
        print(jsonData!)
        
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString!)
        //decode
        let jsonDecoder = JSONDecoder()
        let employee2 = try? jsonDecoder.decode(Employee.self, from: jsonData!)
        
        print(employee2!)
        
        
    }

}

