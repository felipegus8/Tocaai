//
//  ViewController.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CodigoTextFIeld: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated..    
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "vote" {
            let dest = segue.destinationViewController as! TableViewControllerVoto
            let textToInt = Int(self.CodigoTextFIeld.text!)
            
            dest.cod =  NSNumber(integer: textToInt!)
            print("digitei: ", dest.cod)
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

