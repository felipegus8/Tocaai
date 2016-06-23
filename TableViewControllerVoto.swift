//
//  TableViewControllerVoto.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import UIKit

class TableViewControllerVoto: UITableViewController {

    //var cod: String?
    var cod: NSNumber!
    var i = 0
    var votou = false
    
    private var musicaList = [Musica]()
    private var setlistList = [Setlist]()
    private var musicasAceitas = [Musica]()
    var musica: Musica?
    var song: Musica?
    var setlist: Setlist?
    
    
    private func fetchMusicas() {
        self.musicaList = MusicaDao.fetchAllSongs()
        self.tableView.reloadData()
    }
    
    private func fetchSetlists() {
        self.setlistList = SetlistDao.fetchAllSetlists()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMusicas()

        
        for m in musicaList {

            
            if m.codSet == cod {
                musicasAceitas.append(m)
            }
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Voto", forIndexPath: indexPath) as! TableViewCellVoto

        cell.MusicaLabel.text = musicasAceitas[indexPath.row].nome
        cell.VotoLabel.text = String(musicasAceitas[indexPath.row].voto!)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(!votou) {
            var h = 0
            votou = true
        
            self.song = Musica()
        
            self.song = musicasAceitas[indexPath.row]
        
            h = Int(self.song!.voto!)
        
            h++
        
            self.song!.nome = musicasAceitas[indexPath.row].nome
            self.song!.artista = musicasAceitas[indexPath.row].artista
        
            self.song!.voto = NSNumber?(h)
        
            MusicaDao.update(self.song!)
        
            self.tableView.reloadData()
        } else {
            let alert = UIAlertController(title: "Codigo", message: "Você não pode votar mais de uma vez", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
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

    
        

}
