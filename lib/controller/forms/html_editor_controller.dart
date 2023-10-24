import 'package:html_editor_enhanced/html_editor.dart';
import 'package:webui/controller/my_controller.dart';

class EditorController extends MyController {
  HtmlEditorController htmlEditorController = HtmlEditorController();

  Callbacks getCallbacks() {
    return Callbacks(
      onFocus: () {
        htmlEditorController.setFocus();
      },
      onInit: () {
        htmlEditorController.setFullScreen();
      },
    );
  }
}
