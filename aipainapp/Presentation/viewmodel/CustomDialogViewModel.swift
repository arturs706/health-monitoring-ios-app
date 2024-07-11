import Combine

class CustomDialogViewModel: ObservableObject {
    @Published var isDialogVisible: Bool = false
    @Published var dialogTitle: String = ""
    @Published var dialogMessage: String = ""
    @Published var dialogActionTitle: String = ""

    func showDialog(title: String, message: String, actionTitle: String) {
        dialogTitle = title
        dialogMessage = message
        dialogActionTitle = actionTitle
        isDialogVisible = true
    }

    func hideDialog() {
        isDialogVisible = false
    }

    func performDialogAction() {
        hideDialog()
    }
}
