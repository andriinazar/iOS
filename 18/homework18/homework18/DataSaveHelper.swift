//
//  DataSaveHelper.swift
//  homework18
//
//  Created by Andrii Nazar on 12/1/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation
import UIKit

class DataSaveHelper {
    static let contactsFolderName = "Contacts"
    static let fileManager = FileManager.default
    
    private static func checkExistFolder(url: URL) {
        if !fileManager.fileExists(atPath: url.path) {
            do {
                try fileManager.createDirectory(atPath: url.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public static func createUserRecord(userInfo: UserInfo) {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            checkExistFolder(url: folderURL)
            let uuid = UUID().uuidString
            let plistPath = "/" + uuid + ".plist"
            let path = folderURL.appendingPathComponent(plistPath)
            if(!fileManager.fileExists(atPath: path.absoluteString)) {
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    let data = try encoder.encode(userInfo)
                    try data.write(to: path)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    public static func updateUserRecord(userInfo: UserInfo, fileName: String) {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            checkExistFolder(url: folderURL)
            let path = folderURL.appendingPathComponent(fileName)
            let strPath = path.absoluteString
            if fileManager.fileExists(atPath: strPath) {
                
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    let data = try encoder.encode(userInfo)
                    try data.write(to: path)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    public static func getUserRecord (recortPath: String) -> UserInfo? {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            if !fileManager.fileExists(atPath: folderURL.path) {
                return nil
            }
            let path = folderURL.appendingPathComponent(recortPath)
            if let data = try? Data(contentsOf: path) {
                var usetInfo: UserInfo?
                let decoder = PropertyListDecoder()
                usetInfo = try? decoder.decode(UserInfo.self, from: data)
                return usetInfo
            } else {
                return nil
            }
        }
        return nil
    }
    
    public static func removeUserRecord (recordPath: String) {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            if fileManager.fileExists(atPath: folderURL.path) {
                let path = folderURL.appendingPathComponent(recordPath)
                if fileManager.fileExists(atPath: path.absoluteString) {
                    try? fileManager.removeItem(atPath: path.absoluteString)
                }
            }
        }
    }
    
    public static func getAllFiles() -> [String]? {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            if fileManager.fileExists(atPath: folderURL.path) {
                let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: folderURL.path)!
                var files: [String] = []
                while let element = enumerator.nextObject() as? String, element.hasSuffix(".plist") {
                    files.append(element)
                }
                return files
            }
            return nil
        }
        return nil
    }
    
    public static func saveImage(image: UIImage) -> String? {
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentDirectory.appendingPathComponent(contactsFolderName)
            checkExistFolder(url: folderURL)
            if fileManager.fileExists(atPath: folderURL.path) {
                let fileName = UUID().uuidString + "jpg"
                let fileURL = URL(fileURLWithPath:folderURL.path).appendingPathComponent(fileName)
                let data = image.jpegData(compressionQuality: 1.0)
                do {
                    try data?.write(to: fileURL, options: .atomic)
                    return fileName
                } catch {
                    print("error:", error)
                }
            }
        }
        return nil
    }
}
