import Foundation

fileprivate func asyncTaskVoid(background: @escaping () -> Void, update: @escaping (_: Void) -> Void){
    DispatchQueue.global().async{
        background()
        DispatchQueue.main.async{
            update()
        }
    }
}

fileprivate func asyncTask<T>(background: @escaping () -> T, update: @escaping (_: T) -> Void){
    DispatchQueue.global().async{
        let result:T = background()
        DispatchQueue.main.async{
            update(result)
        }
    }
}

infix operator ->-

func ->- <T> (background: @escaping () -> T, update: @escaping (_: T) -> Void){
    asyncTask(background: background, update: update)
}

