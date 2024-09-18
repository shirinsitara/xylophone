import SwiftUI

struct ResultCorrect: View {

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
            //change background colour to white
                .fill(Color.yellow)
                .frame(width: 600, height: 400)
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    .foregroundColor(.indigo)
                    .padding()

                Text("You got it right!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ResultWrong: View {

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
            //change background colour to white
                .fill(Color.yellow)
                .frame(width: 600, height: 400)
            VStack {
                Image(systemName: "exclamationmark.warninglight.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    .foregroundColor(.orange)
                    .padding()

                Text("hmm, nice try but something is off!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ResultWrong()
}
