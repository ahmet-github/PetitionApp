//
//  ViewController.swift
//  Project7
//
//  Created by Ahmet İyidoğan on 8/5/22.
//

import UIKit

class ViewController: UITableViewController {

    var petitionArray = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"

        }
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(data)
                return
            }
        }
        showError()
    }
    
    func showError(){
        let ac = UIAlertController(title: "There is a problem", message: " Bla bla bla", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
     }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitionArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitionArray[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    func parse(_ jsonData: Data){
        
        let decoder = JSONDecoder()
        
        if let jsonParse = try? decoder.decode(Petitions.self, from: jsonData){
            petitionArray = jsonParse.results
            tableView.reloadData()
        }
        
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitionArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}

