import Foundation
import SwiftData

/// Modelo descartável da Fase 0, usado só para provar a persistência entre updates via SideStore.
@Model
final class TestRecord {
    var id: UUID
    var text: String
    var createdAt: Date
    var appVersion: String

    init(text: String, appVersion: String) {
        self.id = UUID()
        self.text = text
        self.createdAt = .now
        self.appVersion = appVersion
    }
}
