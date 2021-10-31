import UIKit

struct About:Decodable {
    let about: String
    let name1: String
    let name2: String
    let name3: String
    let name4: String
    let name5: String
    let name6: String
}
class aboutViewController: UIViewController {

    @IBOutlet weak var aboutField: UILabel!
    @IBOutlet weak var names: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://mocki.io/v1/38081cbb-87a3-4f4f-9de1-9da05db22972"
        guard let url = URL(string: jsonUrlString)
        else { return }
        URLSession.shared.dataTask(with: url) {
            (data,response,err) in
            guard let pdata = data else
            {
                return
            }
            do {
                let about = try JSONDecoder().decode(About.self, from: pdata)
                self.aboutField.text = about.about
//                print(about.about)
                var asd = about.name1 + "\n" + about.name2 + "\n" + about.name3
                + "\n" + about.name4
                + "\n" + about.name5
                + "\n" + about.name6
                

                self.names.text = asd
                
                
            }
            catch let jsonError {
                print("Error",jsonError)
            }
        }.resume()

        // Do any additional setup after loading the view.
    }
    

    

}

