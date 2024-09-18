
import SwiftUI

struct RectangularSliderView: View {
    @State private var sliderValue: CGFloat = 1 // Start at option 1
    let options = ["Option 1", "Option 2"]

    var body: some View {
        VStack {
            // Slider track
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 50) // Rectangular box for the slider track
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Text("Option 1").frame(maxWidth: .infinity)
                            Text("Option 2").frame(maxWidth: .infinity)
                        }
                        .foregroundColor(.white)
                    )

                // Slider handle
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 700, height: 40) // Circular handle
                    .offset(x: sliderOffset())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                handleDrag(value: value)
                            }
                            .onEnded { _ in
                                snapToNearestOption()
                            }
                    )
            }

            // Display selected option
            Text("Selected: \(options[Int(sliderValue - 1)])")
                .font(.headline)
                .padding()
        }
    }

    // Calculate the handle's offset based on sliderValue
    func sliderOffset() -> CGFloat {
        // Assuming 300 is the total width of the slider track minus padding
        let trackWidth: CGFloat = 700
        return (sliderValue - 1.5) * (trackWidth / 2)
    }

    // Handle the drag gesture, updating the sliderValue based on drag position
    func handleDrag(value: DragGesture.Value) {
        // Assuming 300 is the total width of the slider track minus padding
        let trackWidth: CGFloat = 300
        let newSliderValue = value.translation.width / (trackWidth / 2) + sliderValue
        sliderValue = min(max(newSliderValue, 1), 2) // Keep the sliderValue between 1 and 2
    }

    // Snap the slider to the nearest option
    func snapToNearestOption() {
        sliderValue = round(sliderValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RectangularSliderView()
    }
}

