import SwiftUI
import SwiftData

struct PhaseZeroView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \TestRecord.createdAt) private var records: [TestRecord]

    private var version: String {
        let info = Bundle.main.infoDictionary
        let short = info?["CFBundleShortVersionString"] as? String ?? "?"
        let build = info?["CFBundleVersion"] as? String ?? "?"
        return "\(short) (\(build))"
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Diagnóstico") {
                    LabeledContent("Versão do app", value: version)
                    LabeledContent("Registros salvos", value: "\(records.count)")
                }
                Section("Registros") {
                    if records.isEmpty {
                        Text("Nenhum registro ainda.").foregroundStyle(.secondary)
                    }
                    ForEach(records) { record in
                        VStack(alignment: .leading) {
                            Text(record.text).font(.headline)
                            Text("gravado na v\(record.appVersion) · \(record.createdAt.formatted())")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                Section {
                    Button("Gravar PERSISTENCIA_OK") {
                        context.insert(TestRecord(text: "PERSISTENCIA_OK", appVersion: version))
                        try? context.save()
                    }
                    Button("Apagar todos os registros", role: .destructive) {
                        for record in records { context.delete(record) }
                        try? context.save()
                    }
                }
            }
            .navigationTitle("Planneria · Fase 0")
        }
    }
}
