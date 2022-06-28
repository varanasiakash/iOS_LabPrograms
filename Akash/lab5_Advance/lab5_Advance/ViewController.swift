
import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var cameraButton : UIButton!
    
    var cameraImagePickerController : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func cameraButtonClick()
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            cameraImagePickerController = UIImagePickerController()
            cameraImagePickerController.delegate = self
            cameraImagePickerController.sourceType = .camera
            cameraImagePickerController.cameraDevice = .rear
            
            self.present(cameraImagePickerController,animated: true,completion: nil)
            
            
        }
        else
        {
            print("camera not found in simulator...")
        }
    }


    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\(info)")
        
        let image1 = info[.originalImage]as! UIImage
        imageView.image = image1
        
        self.dismiss(animated: true, completion: nil)
    }
}

