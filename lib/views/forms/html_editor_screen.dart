import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:webui/controller/forms/html_editor_controller.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class HtmlEditorScreen extends StatefulWidget {
  const HtmlEditorScreen({super.key});

  @override
  State<HtmlEditorScreen> createState() => _HtmlEditorScreenState();
}

class _HtmlEditorScreenState extends State<HtmlEditorScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late EditorController controller;

  @override
  void initState() {
    controller = Get.put(EditorController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "HTML Editor",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Forms"),
                        MyBreadcrumbItem(name: "HTML Editor", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyCard(
                  shadow: MyShadow(elevation: 0.5),
                  child: HtmlEditor(
                    callbacks: controller.getCallbacks(),
                    controller: controller.htmlEditorController,
                    htmlEditorOptions: HtmlEditorOptions(
                      adjustHeightForKeyboard: true,
                      hint: 'Your text here...',
                      shouldEnsureVisible: true,
                      // darkMode: ThemeCustomizer.instance.theme==ThemeMode.dark
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarPosition: ToolbarPosition.aboveEditor,
                      toolbarType: ToolbarType.nativeScrollable,
                      dropdownBackgroundColor: contentTheme.background,
                      dropdownBoxDecoration: BoxDecoration(
                        color: contentTheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
