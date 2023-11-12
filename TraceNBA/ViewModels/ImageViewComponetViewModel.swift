//
//  ImageViewComponetViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import Foundation
import SwiftUI

final class ImageViewComponetViewModel: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    private let manager: DataServiceProtocol
    
    private let localFileManager = LocalFileManager.instance
    
    init(dataService: DataServiceProtocol) {
        self.manager = dataService
    }
    
    func getTeamImage(id: Int, entity: TypeEntity) async {
        do {
            let uiImage = try await manager.getPhotoEntity(entity: entity, id: id)
            
            await MainActor.run {
                self.image = uiImage
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getHighlightImage(urlString: String) async {
        await MainActor.run {
            self.image = nil
        }
        do {
            let data = try await manager.getImageFromUrl(urlString: urlString)
            
            await MainActor.run {
                self.image = UIImage(data: data)
            }
        } catch {
            debugPrint(error)
        }
    }
}
