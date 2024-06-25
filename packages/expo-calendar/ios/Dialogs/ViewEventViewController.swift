import ExpoModulesCore

// only for `openEventInCalendarAsync`
class ViewEventViewController: UINavigationController, UIAdaptivePresentationControllerDelegate {
  
  private let promise: Promise
  private let onDismiss: () -> Void

  init(rootViewController: UIViewController, promise: Promise, onDismiss: @escaping () -> Void) {
    self.promise = promise
    self.onDismiss = onDismiss
    super.init(rootViewController: rootViewController)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presentationController?.delegate = self
  }
  
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    onDismiss()
    promise.resolve(CalendarResponse(action: "canceled"))
  }
}
