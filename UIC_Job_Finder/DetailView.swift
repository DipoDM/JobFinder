//
//  DetailView.swift
//  UIC_Job_Finder
//
//  Created by ODM on 10/4/20.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var image: String
    var position: String
    var location: String
    var jobDescription: String
    var jobRespon: String = "Totally proficient in multiple aspects of digital product design"
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .renderingMode(.original)
                    })
                    .padding()
                    .frame(width: 50, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.4)))
                    
                    
                    
                    Spacer()
                }
                .padding(.leading, 30)
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack(spacing: 40){
                        Image(image)
                            .renderingMode(.original)
                            .resizable()
                            .padding(25)
                            .frame(width: 150, height: 150)
                            .background(Color.gray.opacity(0.2)
                                            .cornerRadius(40))
                        
                        Text(position)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Text(location)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    
                    
                    Divider()
                        .padding(30)
                    
                    VStack(alignment: .leading,spacing: 20){
                        HStack{
                            Text("Description")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        
                        Text(jobDescription)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30)
                            .lineSpacing(7.0)
                        
                        HStack{
                            Text("Job Responsibilities")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        
                        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                            HStack(alignment: .firstTextBaseline){
                                Circle()
                                    .frame(width: 10, height: 10)
                                
                                Text(jobRespon)
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                }
                
                Spacer()
            }
            
            VStack{
                Spacer()
                Button(action: {}, label: {
                    Text("Apply")
                        .padding()
                        .frame(width: 350)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(20)
                        .padding(.vertical, 10)
                        
                })
            }
            .edgesIgnoringSafeArea(.bottom)
           
        }
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "apple", position: "iOS Developer", location: "New York", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others.", jobRespon: "Totally proficient in multiple aspects of digital product design")
    }
}
