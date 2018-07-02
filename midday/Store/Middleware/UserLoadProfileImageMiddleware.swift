import Foundation
import ReSwift
import UIKit

let userLoadProfileImageMiddleware: Middleware<StateType> = { dispatch, getState in
    return { next in
        return { action in
            
            if var action = action as? SetUserAuthDetailsAction {
//                let url = URL(string: action.photoUrl.absoluteString)
                let url = URL(string: "https://www.codeproject.com/KB/GDI-plus/ImageProcessing2/img.jpg")
                if let data = try? Data(contentsOf: url!)
                {
                    let image: UIImage = UIImage(data: data)!
                    dispatch(SetUserProfileImageAction(photoImage: image))
                }
            }
            
            return next(action)
        }
    }
}
