//
//  LocalFileManager.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import SwiftUI

enum TypeFolder: String {
    case teams
    case players
    case managers
}

class LocalFileManager {
    static let instance = LocalFileManager()
    
    private let folderTeams = "teams"
    private let folderPlayers = "players"
    private let folderManagers = "managers"
    
    func saveImage(image: UIImage, name: String, typeFolder: TypeFolder) {
        createFolderIfNeeded(typeFolder: typeFolder)
        
        guard
            let data = image.pngData(),
            let path = getPathForImage(name: name, typeFolder: typeFolder) else {
            print("Error getting data")
            return
        }
        
        do {
            try data.write(to: path)
            print("Success saving")
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func getImage(name: String, typeFolder: TypeFolder) -> UIImage? {
        
        guard
            let path = getPathForImage(name: name, typeFolder: typeFolder)?.path(),
            FileManager.default.fileExists(atPath: path) else {
            print("error getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    private func createFolderIfNeeded(typeFolder: TypeFolder) {
        
        let folderName = typeFolder.rawValue
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName, conformingTo: .folder)
                .path() else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("success creating folder")
            } catch let error {
                print("error creating folder: \(error)")
            }
        }
    }
    
    private func deleteFolder(typeFolder: TypeFolder) {
        
        let folderName = typeFolder.rawValue
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName, conformingTo: .folder)
                .path() else { return }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder: \(error)")
        }
    }
    
    func deleteImage(name: String, typeFolder: TypeFolder) -> String {
        guard
            let path = getPathForImage(name: name, typeFolder: typeFolder)?.path(),
            FileManager.default.fileExists(atPath: path) else {
            return "error getting path"
        }
         
        do{
            try FileManager.default.removeItem(atPath: path)
            return "successfully deleted"
        } catch let error {
            return "Error deleting images: \(error)"
        }
    }
    
    private func getPathForImage(name: String, typeFolder: TypeFolder) -> URL? {
        
        let folderName = typeFolder.rawValue
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName, conformingTo: .folder)
                .appendingPathComponent("\(name).png", conformingTo: .image) else {
            print("Error getting path")
            return nil
        }
        
        return path
    }
}
