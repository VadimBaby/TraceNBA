//
//  MatchItemViewComponentViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import Foundation
import SwiftUI

class MatchItemViewComponentViewModel: ObservableObject {
    @Published public var image: Image? = nil
    
    private let manager: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    init(dataService: DataServiceProtocol) {
        self.manager = dataService
    }
    
    func getTeamImage(id: Int) {
        let task1 = Task {
            do {
                let dataImage = try await manager.getPhotoEntity(entity: .team, id: id)
                
                guard let uiImage: UIImage = UIImage(data: dataImage) else { throw Errors.badImage }
                
                let image: Image = Image(uiImage: uiImage)
                
                await MainActor.run {
                    self.image = image
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        tasks.append(task1)
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        tasks = []
    }
}
