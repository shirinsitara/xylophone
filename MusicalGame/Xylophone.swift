import SwiftUI
import AVFoundation

struct Xylophone : View {

    let soundAPI = SoundAPI()
    private var keys: [NoteKey]
    //var notePressed: (NoteKey) -> Void
    @State var isRecording: Bool = false
    @State var recordedNotes: [Note] = []

    init(keys: [NoteKey]) {
        self.keys = keys
    }

    var body: some View {
        makeXylophone(keys)
            .onAppear {
                configureAudioSession()
            }
    }


    func makeXylophone(_ keys: [NoteKey]) -> some View {

        return HStack(alignment: .center) {
            ForEach(keys) { value in
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(value.color)
                        .frame(width: 140, height: 450-CGFloat((value.position*20)))
                        .onTapGesture {
                            soundAPI.playKey(value.position)
                            print("\(value.note.name) key tapped")
                            recordNote(value.note)
                        }

                    Text(value.note.name)
                        .font(.title)
                        .foregroundStyle(.white)
                }
                Spacer()
                    .frame(width: 40)
            }
        }
    }


    func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error)")
        }
    }

    func recordNote(_ note: Note) {
        if isRecording {
            recordedNotes.append(note)
            print("recorded note: \(note)")
        }
    }
}

//extension Note {
//    var color: Color {
//        switch self {
//        case .C:
//
//        }
////        let colors:[Color] = [.red, .orange, .yellow, .green, .blue,.indigo, .purple]
//    }
//}



