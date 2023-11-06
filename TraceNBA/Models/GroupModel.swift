//
//  GroupModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

struct GroupModel: Codable {
    let groupName: GroupNameType
    let statisticsItems: [StatisticsItemModel]
    
    init(groupName: String, statisticsItems: [StatisticsItemModel]) {
        self.statisticsItems = statisticsItems
        
        let groupNameOptional = GroupNameType(rawValue: groupName)
        self.groupName = groupNameOptional ?? .unknown
    }
}
