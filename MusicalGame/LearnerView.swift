import SwiftUI

enum Options: String, Identifiable, CaseIterable {
    case one = "Easy"
    case five = "Mid"
    case seven = "Hard"

    var id: String { rawValue }
}

extension Options {
    var notes: [NoteKey] {
        switch self {
        case .one: return [NoteKey(note: .C, position: 0, color: .red),
                           NoteKey(note: .D, position: 1, color: .orange),
                           NoteKey(note: .E, position: 2, color: .yellow)]
        case .five: return [NoteKey(note: .C, position: 0, color: .red),
                           NoteKey(note: .D, position: 1, color: .orange),
                           NoteKey(note: .E, position: 2, color: .yellow),
                           NoteKey(note: .F, position: 3, color: .green),
                           NoteKey(note: .G, position: 4, color: .blue)]
        case .seven: return [
            NoteKey(note: .C, position: 0, color: .red),
            NoteKey(note: .D, position: 1, color: .orange),
            NoteKey(note: .E, position: 2, color: .yellow),
            NoteKey(note: .F, position: 3, color: .green),
            NoteKey(note: .G, position: 4, color: .blue),
            NoteKey(note: .A, position: 5, color: .indigo),
            NoteKey(note: .B, position: 6, color: .purple)
        ]
        }
    }
}

struct LearnerView : View {

    @ObservedObject var viewModel = ViewModel()

    let soundAPI = SoundAPI()
    @State private var selectedKeys: Options = .five
    @State var isRecording: Bool = false
//    @State var RecordedNotes: [Note] = []

    var body: some View {
        VStack {
            HStack {
                keySelection
                    .padding()
                Spacer()
            }
            HStack (alignment: .center) {
                Spacer()
                    .frame(width: 550)
                playButton
                Spacer()
                    .frame(width: 400)
                gameOptions
            }
            Spacer()
            Xylophone(keys: selectedKeys.notes)
                .padding()
        }
    }

    var keySelection: some View {
        HStack {
            Picker("Number of Keys", selection: $selectedKeys) {
                ForEach(Options.allCases) { key in
                    Text("\(key.rawValue) Keys").tag(key)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)

        }
    }

    var gameOptions: some View {
        VStack {
            Button(action: {
                isRecording.toggle()
//                if isRecording {
//                    print("Recording started...")
//                    //RecordedNotes.append(<#T##newElement: Note##Note#>)
//                    print("Recorded Notes: \(RecordedNotes)")
//                } else {
//                    // Stop recording
//                    print("Recording stopped!")
//                    print("Recorded Notes: \(RecordedNotes)")
//                }
            }) {
                Image(systemName: !isRecording ? "record.circle" : "stop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .foregroundColor(.red)
                    .padding()
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding()
            Button(action: {

            }) {
                Image(systemName: "checkmark.gobackward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .foregroundColor(.red)
                    .padding()
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }

    var playButton: some View {
        Button(action: {
            Task{
                // changes about what is played has to be made
                print("Image button tapped!")
                //await soundAPI.playTune(soundAPI.redRiverValley["melody1"]!)
                await soundAPI.playTune(soundAPI.easyMelody["melody1"]!)
            }
        }) {
            Image(systemName: "play.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(30)
                .padding(.leading)
                .background(Color.red)
                .clipShape(Circle())
                .foregroundColor(.white)
        }
    }

//    func recordNote(_ note: NoteKey) {
//        if isRecording {
//            RecordedNotes.append(note.note)
//            print("recorded note: \(note)")
//        }
//    }
}


//#Preview {
//    LearnerView()
//}
