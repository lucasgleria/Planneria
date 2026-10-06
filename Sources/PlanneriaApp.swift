import SwiftUI
import SwiftData

@main
struct PlanneriaApp: App {
    var body: some Scene {
        WindowGroup {
            PhaseZeroView()
        }
        .modelContainer(for: TestRecord.self)
    }
}
