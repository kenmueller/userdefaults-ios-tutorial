import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var slider: UISlider!
	
	// Initialize UserDefaults
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Check if the sliderPosition is stored in UserDefaults
		if defaults.object(forKey: "sliderPosition") != nil {
			
			/*
			 * There are a number of methods you can get data from UserDefaults
			 * defaults.data(forKey: <#String#>) gives you Data? that can then be transformed into a UIImage,
			 * defaults.bool(forKey: <#String#>) gives you a Bool, and if you try to access a value that doesn't exist, it defaults to false
			 * Unless you want the default to be false, check for it's existence in UserDefaults by checking that defaults.object(forKey: <#String#>) != nil
			 * There are a lot more functions like defaults.bool(_:) for different types of data
			 * You can also use defaults.object(_:) to get data:
			 * let myBool = defaults.object(forKey: "myBool") as? Bool ?? false
			 */
			
			// Get the sliderPosition from UserDefaults
			let sliderPosition = defaults.float(forKey: "sliderPosition")
			// Set the slider position to sliderPosition
			slider.setValue(sliderPosition, animated: true)
		}
	}
	
	// When the user moves the slider
	@IBAction func sliderChanged() {
		// Store the current slider value in UserDefaults
		defaults.set(slider.value, forKey: "sliderPosition")
		/*
		 * You can store anything in UserDefaults using defaults.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
		 * You can set a value as nil, but that won't delete the key / value pair
		 * To delete a value, see below
		 */
	}
	
	// When the user clicks the "Delete" button
	@IBAction func delete() {
		// Delete key / value pair from UserDefaults
		defaults.removeObject(forKey: "sliderPosition")
		// This removes the sliderPosition from UserDefaults
		
		// Reset slider position
		slider.setValue(0.5, animated: true)
	}
}
