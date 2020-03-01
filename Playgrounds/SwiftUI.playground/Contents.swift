import SwiftUI
import PlaygroundSupport


struct Capsule: ButtonStyle
{

    
    var name: String
    
        
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
            .padding(3 + 3)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(
                        Color.black,
                        lineWidth: 3
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            )
            .background(
                GeometryReader
                {
                    buttonGeometry -> AnyView in

                    let background = Color.init(.sRGB, white: 0.0, opacity: 0.1)
                    ContentView.buttonFramesForNames[self.name] = buttonGeometry.frame(in: .named("ContentView"))
                    return AnyView(background)
                }
            )
            .padding(
                .horizontal,
                40
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}


struct ImportButton: View
{
    
    
    var name: String
    var imageName: String
    var text: String

    
    var body: some View
    {
        Button(
            action:
            {
                print("'\(self.name)' button tapped.")
            }
        )
        {
            HStack
            {
                Image(systemName: imageName).font(.title)
                Text(text).font(.title).fontWeight(.bold)
            }
        }
        .buttonStyle(Capsule(name: self.name))
    }
}


struct ContentView: View
{
    
    static var viewBounds: CGRect?
    static var buttonFramesForNames: [String:CGRect] = [:]
    
    
    var body: some View
    {
        
        GeometryReader
        {
            geometry -> AnyView in
            
            let stack = VStack(spacing: 60)
            {
                ImportButton(name: "new", imageName: "doc", text: "create new")
                ImportButton(name: "camera", imageName: "camera", text: "from camera")
                ImportButton(name: "library", imageName: "photo.on.rectangle", text: "from library")
            }
            .frame(
                minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: .infinity,
                alignment: .center
            )
            .edgesIgnoringSafeArea(.all)
            .coordinateSpace(name: "ContentView")
            .background(Color.blue)
            
            ContentView.viewBounds = geometry.frame(in: CoordinateSpace.local)
            
            return AnyView(stack)
        }
        .onAppear
        {
            print("ContentView.viewBounds: \(String(describing: ContentView.viewBounds))")
            print("ContentView.buttonFrame[new]: \(String(describing: ContentView.buttonFramesForNames["new"]))")
            print("ContentView.buttonFrame[camera]: \(String(describing: ContentView.buttonFramesForNames["camera"]))")
            print("ContentView.buttonFrame[library]: \(String(describing: ContentView.buttonFramesForNames["library"]))")
        }
        
    }
}


PlaygroundPage.current.setLiveView(ContentView())
