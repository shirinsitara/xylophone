import Foundation
import SwiftUI

enum Note: Int, Identifiable {
    case C, D, E, F, G, A, B

    var name: String {
        switch self {
        case .C: return "C"
        case .D: return "D"
        case .E: return "E"
        case .F: return "F"
        case .G: return "G"
        case .A: return "A"
        case .B: return "B"
        }
    }

    var id: String { name }
}

struct NoteKey: Identifiable, Equatable {
    var id: String { "\(note.name)-\(position)" }
    let note: Note
    let position: Int
    let color: Color
}
