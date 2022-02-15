//
//  ChatViewController.swift
//  Cathay
//
//  Created by Kong Yau Lee on 13/11/2021.
//

import UIKit
import ApiAI
import AVFoundation


class ChatViewController: UIViewController {
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var chipResponse: UILabel!
        
    let speechSynthesizer = AVSpeechSynthesizer()

    func speechAndText(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.chipResponse.text = text
        }, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let request = ApiAI.shared().textRequest()
        
        if let text = self.messageField.text, text != "" {
            request?.query = text
        } else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                self.speechAndText(text: textResponse)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared().enqueue(request)
        messageField.text = ""
    }
    // disabled dialogFlow function
   /* @IBAction func sendMessage(_ sender: Any) {
        if((messageField.text == "hi")||(messageField.text == "hello"))
        {chipResponse.text = " How can I help you?"
            
        }
        
        else if(messageField.text == "bye")
        {chipResponse.text = "See you"}
        else if(messageField.text!.contains("flight"))
        {chipResponse.text = "What flight information do you need?"}
        else if(messageField.text!.contains("hotel"))
        {chipResponse.text = "What hotel information do you need?"}
                 else {
            chipResponse.text = "Sorry I can't understand"
        }
                 messageField.text = ""
    }*/

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
