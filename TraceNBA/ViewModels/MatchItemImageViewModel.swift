//
//  MatchItemImageViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import Foundation
import SwiftUI

final class MatchItemImageViewModel: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    private let manager: DataServiceProtocol
    
    private let localFileManager = LocalFileManager.instance
    
    init(dataService: DataServiceProtocol) {
        self.manager = dataService
    }
    
    func getTeamImage(id: Int) async {
        do {
            let uiImage = try await manager.getPhotoEntity(entity: .team, id: id)
            
            await MainActor.run {
                self.image = uiImage
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
