//
//  TableViewControllerSetlist.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import UIKit
import Foundation

class TableViewControllerSetlist: UITableViewController {
    
    //var k = rand() % 9999
    var k: Int32 = 0
    
    private var setlistList = [Setlist]()
    private var musicaList = [Musica]()
    private var musicasAceitas = [Musica]()
    var musica: Musica?
    var setlist: Setlist?
    var musica2: Musica?
    
    private func fetchMusicas() {
        //self.musicaList = MusicaDao.fetchAllSongs()
        self.musicaList = MusicaDao.fetchById(k)
        self.tableView.reloadData()
    }
    
    private func fetchSetlists() {
        self.setlistList = SetlistDao.fetchAllSetlists()
    }
    @IBAction func DoneButton(sender: AnyObject) {
        let alert = UIAlertController(title: "Codigo", message: "Seu codigo é \(k)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    
    }

    @IBAction func Addbutton(sender: AnyObject) {
    
        let alertController = UIAlertController(title: "Musica", message: "Insira o Nome:", preferredStyle: .Alert)
        
        let confirmAction = UIAlertAction(title: "Confirmar", style: .Default) { (_) in
            if var _ = alertController.textFields![0] as? UITextField {
                let textfield = alertController.textFields![0].text
                
                
                self.musica = Musica()
                self.musica!.nome = textfield
                self.musica!.artista = "Artista"
                self.musica!.codSet = NSNumber(int: self.k)
                self.musica!.voto = 0
                
                MusicaDao.insert(self.musica!)
                self.musicasAceitas.append(self.musica!)
                self.fetchMusicas()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Insira o nome da música"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSetlists()
        
        //self.k = rand() % 9999
        self.k = Int32(arc4random_uniform(9999))
        
        
        for s in setlistList {
            while NSNumber(int: k) == s.codSet {
                //k = rand() % 9999
                k = Int32(arc4random_uniform(9999))
            }
            
            
        }
        self.setlist = Setlist()
        self.setlist!.codSet = NSNumber(int: k)
        SetlistDao.insert(self.setlist!)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicasAceitas.count
    
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Setlist", forIndexPath: indexPath) as! TableViewCellSetlist
        
        let h = musicaList[indexPath.row].codSet
        let cod = Int(h!)
        let novo = Int32(cod)
        
        if novo == k {
            cell.MusicaLabel.text = musicaList[indexPath.row].nome
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
