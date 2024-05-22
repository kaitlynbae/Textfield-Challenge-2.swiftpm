import SwiftUI

struct ContentView: View {
    
    @State var mvpText:String = ""
    
    @State var number1 = 0
    @State var number2 = 0
    
    @State var billAmount:Double? = nil
    
    @State var email = ""
    @State var password = ""
    @State var field1Text = ""
    @State var field2Text = ""
    @State var field1Complain = false
    @State var field2Complain = false
    
    var body: some View {
        VStack {
            Group {
                Divider()
                Text("TextField Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            VStack {
                Text("MVP")
                Divider()
                
                //MARK: MVP
                TextField("Enter Your Name", text: $mvpText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                
                
                
                
                //TODO: MVP, uncomment the line below
                Text(mvpText == "" ? " " : "Hello \(mvpText)")
                
                Divider()
            }
            
            VStack {
                Text("Stretch #1")
                Divider()
                
                //MARK: Stretch #1
                HStack{
                    let _: NumberFormatter = {
                        let formatter = NumberFormatter ()
                        formatter.numberStyle = .decimal
                        return formatter
                        
                    }()
                    TextField("Enter Number 1", value: $number1, format:.number)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Number 2", value: $number2, format:.number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                    
                    //TODO: Stretch #1, uncomment the line below
                                    Text("\(number1) + \(number2) = \(number1 + number2)")
                    
                    Divider()
                }
                
                
                VStack {
                    Text("Stretch #2")
                    Divider()
                    
                    //MARK: Stretch #2
                    TextField("Enter Bill Amount", value: $billAmount, format:.currency(code: "$"))
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 50, alignment: .center)
                    
                    
                    
                    
                    //TODO: Stretch #2, uncomment the line below
                                    Text("Your bill is $\(billAmount ?? 0, specifier: "%.2f")")
                    
                    Divider()
                }
                
                VStack {
                    Text("Stretch #3")
                    Divider()
                    
                    //MARK: Stretch #3
                    TextField("Enter Your Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Enter Your Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    
                    
                    
                    
                    
                    //TODO: Stretch #3, uncomment the lines below
                                      Button {
                                          EmailHelper.shared.sendEmail(subject: "Congratulations!", body: "You completed Stretch #3 on the textfields Challenge. On behalf of MobileMakersEDU, we would like to congratulate you on your great work. Keep it up", to: email, password: password)
                                      } label: {
                                          Text("Send Email")
                                              .frame(maxWidth: .infinity, maxHeight: 50)
                                              .background(.blue)
                                              .foregroundColor(.white)
                                              .font(.largeTitle)
                                              .clipShape(Capsule())
                                      }
                    
                    
                    Divider()
                }
                
                VStack {
                    Text("Stretch #4")
                    Divider()
                    
                    //MARK: Stretch #4
                    TextField("Field 1", text: $field1Text)
                        .frame(height:50)
                        .background(.white)
                        .clipShape((RoundedRectangle(cornerRadius:10, style:.continuous)), style: FillStyle())
                        .onTapGesture {
                            field1Complain = true
                        }
                        .alert(isPresented: $field1Complain) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("Pick Text Field 2 Instead"),
                                dismissButton: .default(Text("Ok"))
                            )
                        }
                                            
                    
                    TextField("Field 2", text:$field2Text)
                        .textFieldStyle(.roundedBorder)
                        .frame(height:50)
                        .background(.white)
                        .clipShape((RoundedRectangle(cornerRadius:10, style:.continuous)), style: FillStyle())
                        .onTapGesture {
                            field2Complain = true
                        }
                        .alert(isPresented: $field2Complain) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("Pick Text Field 1 Instead"),
                                dismissButton: .default(Text("Ok"))
                            )
                        }
                    
             
                
                   
                    
                }
                
                Group {
                    Spacer()
                    Image("mmeLogo")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                }
                
                
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .padding(.all)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        }
    }
}
