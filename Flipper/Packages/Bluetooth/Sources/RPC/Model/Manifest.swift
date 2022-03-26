public struct Manifest: Codable {
    var items: [Path: Hash]

    public var paths: Dictionary<Path, Hash>.Keys {
        items.keys
    }

    public init(_ items: [Path: Hash]) {
        self.items = items
    }

    public subscript(_ path: Path) -> Hash? {
        return items[path]
    }
}
