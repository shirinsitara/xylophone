import AVFoundation
import SwiftUI
import Foundation


enum Song {
    case note(Note)
    case stop
}

class SoundAPI {


    var audioPlayer: AVAudioPlayer?

    let easyMelody: [String: [Song]] = [
        "melody1":[.note(Note.C), .note(.E), .note(.D)]]

    let redRiverValley: [String: [Song]] = [
        "melody1": [.note(Note.C), .note(Note.D), .note(Note.E), .stop, .note(Note.E), .note(Note.E), .note(Note.E), .stop, .note(Note.D), .note(Note.E), .note(Note.D), .note(Note.C)]
    ]

    func playKey(_ index: Int) {
        // func to hear the audio behind each key on the xylophone
        guard let key = Note(rawValue: index) else { return }
        if let soundURL = Bundle.main.url(forResource: key.name, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error catching sound")
            }
        }
    }

    func playSound(_ song: Song) async {
        // function to hear sounds of the notes on every song
        switch song {
        case let .note(value):
            if let soundURL = Bundle.main.url(forResource: value.name, withExtension: "wav") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer?.play()
                } catch {
                    print("Error catching sound")
                }
            }
        case .stop:
            try? await Task.sleep(nanoseconds: 5_000_000)

        }
    }


    func playTune(_ sequence: [Song]) async {
        // function to plat the given melody which is array of notes
        for note in 0..<sequence.count {
            await playSound(sequence[note])
            try? await Task.sleep(nanoseconds: 500_000_000)
        }
    }

    func extractNotes (from melody:[Song])->[Note] {
        return melody.compactMap { song in
            switch song {
            case .note(let note):
                return note
            case .stop:
                return nil
            }
        }
    }
}
