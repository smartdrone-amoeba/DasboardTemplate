import 'package:webui/controller/my_controller.dart';

import '../../helper/widgets/my_text_utils.dart';

class DialogsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
}
