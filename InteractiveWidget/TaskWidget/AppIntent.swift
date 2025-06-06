//
//  AppIntent.swift
//  TaskWidget
//
//  Created by Adrian Suryo Abiyoga on 20/02/25.
//

import SwiftUI
import AppIntents

struct ToggleStateIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Task State"
    
    /// Parameters
    @Parameter(title: "Task ID")
    var id: String
    
    init() {
        
    }
    
    init(id: String) {
        self.id = id
    }
    
    func perform() async throws -> some IntentResult {
        /// UPDATE YOUR DATABASE HERE
        if let index = TaskDataModel.shared.tasks.firstIndex(where: {
            $0.id == id
        }) {
            TaskDataModel.shared.tasks[index].isCompleted.toggle()
            print("Updated Toggle State")
        }
        return .result()
    }
}
