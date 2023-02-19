//
//  ContentView.swift
//  TurtleFocus
//
//  Created by Chris Turner on 19/02/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
	
	@State var progressValue: Float = 0.28
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
			ZStack {
									Color.yellow
											.opacity(0.1)
											.edgesIgnoringSafeArea(.all)
				VStack {
												ProgressBar(progress: self.$progressValue)
														.frame(width: 150.0, height: 150.0)
														.padding(40.0)
					
							}
				Text(String(format: "%.0f %%", min(self.progressValue, 1.0)*100.0))
						.font(.largeTitle)
						.bold()
									}
         
    }

}

struct ProgressBar: View {
		@Binding var progress: Float
		
		var body: some View {
				ZStack {
						Circle()
								.stroke(lineWidth: 20.0)
								.opacity(0.3)
								.foregroundColor(Color.red)
					
					Circle()
						.trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
									.stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
									.foregroundColor(Color.red)
									.rotationEffect(Angle(degrees: 270.0))
									.animation(.linear)
				}
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
