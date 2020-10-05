//
//  ContentView.swift
//  UIC_Job_Finder
//
//  Created by ODM on 10/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var job: String = ""
    @State private var section = 0
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "circle.grid.2x2.fill")
                            .renderingMode(.original)
                    })
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.4)))
                    .frame(width: 50, height: 50)
                    
                    
                    Spacer()
                    
                    Image("mercy")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false){
                    HStack{
                        Text("Discover\nThe Perfect Job")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        TextField("Search job or position...", text: $job)
                            .padding()
                        
                        Image(systemName: "magnifyingglass")
                    }
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4)))
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 30) {
                                Button(action: {
                                    section = 0
                                }, label: {
                                    Text("Popular")
                                        .foregroundColor(section == 0 ? .black : .gray)
                                        .font(.headline)
                                        .fontWeight(section == 0 ? .bold : .semibold)
                                })
                                Button(action: {
                                    section = 1
                                }, label: {
                                    Text("Latest")
                                        .foregroundColor(section == 1 ? .black : .gray)
                                        .font(.headline)
                                        .fontWeight(section == 1 ? .bold : .semibold)
                                })
                                Button(action: {
                                    section = 2
                                }, label: {
                                    Text("Categories")
                                        .foregroundColor(section == 2 ? .black : .gray)
                                        .font(.headline)
                                        .fontWeight(section == 2 ? .bold : .semibold)
                                })
                                Button(action: {
                                    section = 3
                                }, label: {
                                    Text("Upcoming")
                                        .foregroundColor(section == 3 ? .black : .gray)
                                        .font(.headline)
                                        .fontWeight(section == 3 ? .bold : .semibold)
                                })
                            }
                        }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< jobData.count) { item in
                                CardView(imageName: jobData[item].companyLogo, workTime: jobData[item].jobStatus , companyName: jobData[item].companyName, jobPosition: jobData[item].position, jobPay: jobData[item].jobPay, jobLocation: jobData[item].location, jobDesc: jobData[item].jobDescription)
                            }
                        }
                        
                    }
                    
                    HStack {
                        Text("Jobs you've Applied")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 20){
                        ForEach(0 ..< jobData.count) { item in
                            AplliedJobsView(image: jobData[item].companyLogo, companyName: jobData[item].companyName, position: jobData[item].position, location: jobData[item].location, jobDesc: jobData[item].jobDescription)
                        }
                    }
                }
      
                Spacer()
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.bottom)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}



struct CardView: View {
   
    var imageName: String
    var workTime: String
    var companyName : String
    var jobPosition : String
    var jobPay: String
    var jobLocation: String
    var jobDesc: String
    
    var body: some View {
        NavigationLink(
            destination: DetailView(image: imageName, position: jobPosition, location: jobLocation, jobDescription: jobDesc),
            label: {
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Image(imageName)
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Spacer()
                        
                        Text(workTime)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.gray
                                            .cornerRadius(20))
                        
                    }
                    
                    Text(companyName)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Text(jobPosition)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    HStack {
                        Text(jobPay)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Spacer()
                        Text(jobLocation)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.4)))
                .frame(width: 270, height: 200)
                .padding()
            }
        )
        
    }
}

struct AplliedJobsView: View {
    var image: String
    var companyName: String
    var position: String
    var location: String
    var jobDesc: String
    //var jobRes: String
    
    var body: some View {
        
        NavigationLink(
            destination: DetailView(image: image, position: position, location: location, jobDescription: jobDesc, jobRespon: "Totally proficient in multiple aspects of digital product design"),
            label: {
                    HStack(alignment: .center, spacing: 50){
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 30, height: 30)

                        VStack(alignment: .leading){
                            Text(companyName)
                                .foregroundColor(.gray)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 13))

                            Text(position)
                                .foregroundColor(.black)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))

                        }
                        
                        Spacer()

                        Image(systemName: "ellipsis")
                            .font(.title)
                            .accentColor(.black)
                    }
                    
                    .padding()
                    //.frame(width: 370)
                    .background(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.4)))
                    .padding(.horizontal)
            })
        
        
        
    }
}


struct Job: Identifiable{
    var id = UUID()
    var companyLogo : String
    var jobStatus: String
    var companyName: String
    var position: String
    var jobPay: String
    var location: String
    var jobDescription: String
}

var jobData = [
    Job(companyLogo: "airbnb", jobStatus: "Full-time", companyName: "Airbnb", position: "Program Manager", jobPay: "$5K/month", location: "California", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "apple", jobStatus: "Full-time", companyName: "Apple", position: "iOS Developer", jobPay: "7K/month", location: "Seattle", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "facebook", jobStatus: "Part-time", companyName: "Facebook", position: "Penetration Tester", jobPay: "$2K/month", location: "Austin", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "microsoft", jobStatus: "Part-time", companyName: "Microsoft", position: "Python Developer", jobPay: "$2K/month", location: "New York", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "search", jobStatus: "Full-time", companyName: "Google", position: "Quality Assurance", jobPay: "$5.5K/month", location: "Miami", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "slack", jobStatus: "Part-time", companyName: "Slack", position: "Android Developer", jobPay: "$1.7K/month", location: "New Jersey", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others."),
    Job(companyLogo: "uber", jobStatus: "Full-time", companyName: "Uber", position: "UI/UX Designer", jobPay: "$5.8K/month", location: "Maryland", jobDescription: "An outstanding executor that consistently deliver more than expected and start actively mentoring others.")
]
