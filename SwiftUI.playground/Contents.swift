import SwiftUI
import PlaygroundSupport


struct Capsule: ButtonStyle
{

    
    func makeBody(configuration: Self.Configuration) -> some View
    {
        configuration.label
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            .padding(16)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.init(white: 0.30),
                            Color.init(white: 0.05)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(.white)
            .cornerRadius(40)
            .padding(3 + 1.5)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(
                        Color.black,
                        lineWidth: 3
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            )
            .padding(
                .horizontal,
                40 + 3
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}


struct ImportButton: View
{
    
    
    var imageName: String
    var text: String

    
    var body: some View
    {
        Button(
            action:
            {
                print("'\(self.text)' tapped.")
            }
        )
        {
            HStack
            {
                Image(systemName: imageName).font(.title)
                Text(text).font(.title).fontWeight(.bold)
            }
        }
        .buttonStyle(Capsule())
    }
}


struct ContentView: View
{
    
    
    var body: some View
    {
        
        
        VStack(spacing: 20)
        {
            ImportButton(imageName: "doc", text: "create new")
            ImportButton(imageName: "camera", text: "from camera")
            ImportButton(imageName: "photo.on.rectangle", text: "from library")
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
