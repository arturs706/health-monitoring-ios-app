import SwiftUI

struct PrimaryScreen: View {
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                TopBarComponent()
                SearchBarComponent()
            }
            HStack {
                Text("Categories")
                   .padding(.leading, 36)
                   .padding(.vertical, 10)
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .font(.system(size: 14))

                Text("See All")
                   .padding(.trailing, 38)
                   .padding(.vertical, 10)
                   .frame(maxWidth: .infinity, alignment: .trailing)
                   .font(.system(size: 14))
            }
               
            HStack(spacing: 16) {
                VStack {
                    Image("Symptom")
                        .resizable()
                        .frame(height: 80)
                        .scaledToFit()
                    
                    Text("Symptom/Mood\nTracking")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .font(.system(size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                .padding(10)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.5))
                
                VStack {
                    Image("Community")
                        .resizable()
                        .frame(height: 80)
                        .scaledToFit()
                    
                    Text("Community Support")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .font(.system(size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                .padding(10)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.5))
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 10)
            
            
            
            
            HStack(spacing: 16) {
                VStack {
                    Image("Meditation")
                        .resizable()
                        .frame(height: 80)
                        .scaledToFit()
                    
                    Text("Guided Meditation")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .font(.system(size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                .padding(10)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.5))
                
                VStack {
                    Image("Stress")
                        .resizable()
                        .frame(height: 80)
                        .scaledToFit()
                    
                    Text("Stress Assessment")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .font(.system(size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                .padding(10)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.5))
            }
            .padding(.horizontal, 32)
            HStack(spacing: 16) {
              Spacer()
              Text("Talk to Alice")
                    .font(.system(size: 14))
              Image("Microphone")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 20, height: 20)
                  .foregroundColor(.white)
          }
          .padding()
          .background(Color.salmon)
          .cornerRadius(8)
          .padding(.horizontal, 32)
          .padding(.top, 10)
            
            Spacer().frame(height: 10)
            HStack(spacing: 10) {
              VStack {
                  Text("My Hourly\nFriends")
                      .font(.system(size: 14))
                      .frame(maxWidth: .infinity, alignment: .leading)
                  VStack(){
                      Image("Chatbot")
                          .resizable()
                          .frame(height: 50)
                          .frame(width: 50)
                      Text("Chat Now")
                          .font(.system(size: 12))
                          .padding(.vertical, 4)
                          .padding(.horizontal, 8)
                          .background(Color.salmon)
                          .cornerRadius(5)
                          
                  }
                  .frame(height: 100)
                  .frame(maxWidth: .infinity)
                  .overlay(RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.black, lineWidth: 0.5))
              }
              
              .frame(maxWidth: .infinity)

              VStack {
                  Text("Live\nSessions")
                      .font(.system(size: 14))
                      .frame(maxWidth: .infinity, alignment: .leading)
                  VStack(){
                      Image("Healthcare")
                          .resizable()
                          .frame(height: 50)
                          .frame(width: 50)
                          
                  }
                  .frame(height: 100)
                  .frame(maxWidth: .infinity)
                  .overlay(RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.black, lineWidth: 0.5))
              }
              .frame(maxWidth: .infinity)

              VStack {
                  Text("Graphs and\nTrends")
                      .font(.system(size: 14))
                      .frame(maxWidth: .infinity, alignment: .leading)
                  VStack(){
                      Image("Assessment")
                          .resizable()
                          .frame(height: 50)
                          .frame(width: 50)
                          
                  }
                  .frame(height: 100)
                  .frame(maxWidth: .infinity)
                  .overlay(RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.black, lineWidth: 0.5))
              }
              .frame(maxWidth: .infinity)

            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 32)

            Spacer()

            NavComponent()
        }
        .background(Color.whiteCustom)
        .navigationBarBackButtonHidden(true)
    }
    
  
}

struct PrimaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryScreen()
    }
}
