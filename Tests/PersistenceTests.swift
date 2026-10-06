import XCTest
import SwiftData
@testable import Planneria

@MainActor
final class PersistenceTests: XCTestCase {
    func testInsertAndFetch() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TestRecord.self, configurations: config)
        let context = container.mainContext

        context.insert(TestRecord(text: "PERSISTENCIA_OK", appVersion: "0.0.1 (1)"))
        try context.save()

        let all = try context.fetch(FetchDescriptor<TestRecord>())
        XCTAssertEqual(all.count, 1)
        XCTAssertEqual(all.first?.text, "PERSISTENCIA_OK")
    }
}
