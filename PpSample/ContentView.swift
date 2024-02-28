//
//import SwiftUI
//import PTPopupWebView
//
//struct PTPopupWebViewRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        let popupWebView = PTPopupWebViewController()
//        // ここでポップアップの設定を行います。例えば:
//        popupWebView.popupView.URL(string: "https://github.com")
//        return popupWebView
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // ビューコントローラーの更新が必要な場合に実装します
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            PTPopupWebViewRepresentable()
//                .frame(width: 300, height: 500, alignment: .center) // 必要に応じてサイズを調整してください
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//import SwiftUI
//import UIKit
//import PTPopupWebView
//
//// PTPopupWebViewを表示するためのUIViewController
//class PTPopupWebViewControllerWrapper: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let popupWebView = PTPopupWebView()
//        popupWebView.frame = self.view.bounds
//        
//        // PTPopupWebViewの設定
//        popupWebView.URL(string: "https://github.com/")
//        
//        // PTPopupWebViewをViewControllerのviewに追加
//        self.view.addSubview(popupWebView)
//    }
//}
//
//// UIViewControllerRepresentableを実装するラッパー
//struct PTPopupWebViewRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        PTPopupWebViewControllerWrapper()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // ビューコントローラーの更新が必要な場合に実装します
//    }
//}
//
//// SwiftUIビューでPTPopupWebViewRepresentableを使用
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            PTPopupWebViewRepresentable()
//                .frame(width: 300, height: 500) // サイズは適宜調整してください
//                .edgesIgnoringSafeArea(.all) // 必要に応じてSafeAreaを無視
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}



import SwiftUI
import UIKit
import PTPopupWebView

// SwiftUIビュー
struct ContentView: View {
    // ポップアップ表示の状態管理
    @State private var showingPopup = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Show Popup") {
                self.showingPopup = true
            }
            .sheet(isPresented: $showingPopup) {
                // ポップアップとして表示するビュー
                PopupWebView()
            }
        }
        .padding()
    }
}

// ポップアップとして表示するWebViewを含むSwiftUIビュー
struct PopupWebView: View {
    var body: some View {
        // UIViewControllerRepresentableを使ってPTPopupWebViewをラップ
        PTPopupWebViewRepresentable()
    }
}

// PTPopupWebViewをSwiftUIで使用するためのラッパー
struct PTPopupWebViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let popupWebView = PTPopupWebViewController()
        popupWebView.popupView.URL(string: "https://google.com")
        return popupWebView
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
