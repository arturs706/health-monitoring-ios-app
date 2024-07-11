import SwiftUI

struct CustomDialogView: View {
    
    @Binding var isActive: Bool
    
    var title: String
    var message: String
    var actionTitle: String
    var onAction: () -> Void
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .padding()
                Text(message)
                    .font(.body)
                    .padding(.bottom, 20)
                Button {
                    onAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.salmon)
                        Text(actionTitle)
                            .font(.body)
                            .padding()
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                        }
                        .tint(.black)
                    }
                    Spacer()
                    
                }
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

struct CustomDialog_Preview: PreviewProvider {
    static var previews: some View {
        CustomDialogView(
            isActive: .constant(true),
            title: "Text Access",
            message: "Message queue",
            actionTitle: "OK",
            onAction: {}
        )
    }
}
