import Bluetooth

class DeletedArchiveMock: DeletedArchiveProtocol {
    var manifest: Manifest { .init([:]) }

    func read(_ id: ArchiveItem.ID) async throws -> ArchiveItem {
        fatalError("not implemented")
    }

    func upsert(_ item: ArchiveItem) async throws {
    }

    func delete(_ id: ArchiveItem.ID) async throws {
    }
}
