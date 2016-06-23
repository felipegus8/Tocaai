//
//  MusicaDao.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import Foundation
import CoreData

class MusicaDao {
    static func insert(musica: Musica) {
        DatabaseManager.sharedInstance.managedObjectContext.insertObject(musica)
        
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa ", error)
        }
    }
    
    // update existing object
    static func update(musica :Musica) {
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa: ", error)
        }
        
    }
    
    // delete object
    static func delete(musica: Musica) {
        DatabaseManager.sharedInstance.managedObjectContext.deleteObject(musica)
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao deletar tarefa: ", error)
        }
        
        
    }
    
    // fetch all existing objects
    static func fetchAllSongs() -> [Musica] {
        let request = NSFetchRequest(entityName: "Musica" )
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        var results = [Musica]()
        
        do{
            results = try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Musica]
        } catch let error as NSError {
            print("Erro ao buscar tarefas", error)
        }
        return results
    }
    
    // fetch all existing objects
    static func fetchById(id: Int32) -> [Musica] {
        let request = NSFetchRequest(entityName: "Musica" )
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        let predicate = NSPredicate(format: "codSet == %d", id)
        request.predicate = predicate
        
        var results = [Musica]()
        
        do{
            results = try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Musica]
        } catch let error as NSError {
            print("Erro ao buscar tarefas", error)
        }
        return results
    }
    
}