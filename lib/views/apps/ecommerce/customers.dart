import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webui/controller/apps/ecommerce/customers_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late CustomersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CustomersController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<CustomersController>(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "customers".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ecommerce'.tr()),
                        MyBreadcrumbItem(name: 'customers'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyCard(
                  shadow: MyShadow(
                      elevation: 0.5, position: MyShadowPosition.bottom),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: MyContainer.none(
                      borderRadiusAll: 4,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyButton(
                            onPressed: controller.goToDashboard,
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.monitor,
                                  size: 18,
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                MyText.labelMedium(
                                  'dashboard'.tr(),
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: MyContainer.none(
                              borderRadiusAll: 4,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: DataTable(
                                sortColumnIndex: 1,
                                sortAscending: true,
                                onSelectAll: (_) => {},
                                headingRowColor: MaterialStatePropertyAll(
                                    contentTheme.primary.withAlpha(40)),
                                dataRowMaxHeight: 60,
                                showBottomBorder: false,
                                columns: [
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'id'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'name'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'phone'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'balance'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'orders'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: MyText.labelLarge(
                                      'last_order_at'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                      label: MyText.labelLarge(
                                    'action'.tr(),
                                    color: contentTheme.primary,
                                  ))
                                ],
                                rows: controller.customers
                                    .mapIndexed(
                                      (index, data) => DataRow(
                                        cells: [
                                          DataCell(
                                              MyText.bodyMedium("#${data.id}")),
                                          DataCell(
                                            SizedBox(
                                              width: 300,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  MyContainer.none(
                                                    borderRadiusAll: 20,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: Image.asset(
                                                      Images.avatars[index %
                                                          Images
                                                              .avatars.length],
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  MySpacing.width(15),
                                                  MyText.labelLarge(
                                                    data.firstName.toString(),
                                                  ),
                                                  MySpacing.width(5),
                                                  MyText.labelLarge(
                                                    data.lastName.toString(),
                                                    // muted: true,
                                                    // letterSpacing: 0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataCell(MyText.bodyMedium(
                                              data.phoneNumber)),
                                          DataCell(MyText.bodyMedium(
                                              '\$${data.balance}')),
                                          DataCell(MyText.bodyMedium(
                                              '${data.ordersCount}')),
                                          DataCell(Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              MyText.labelLarge(
                                                  '${Utils.getDateStringFromDateTime(data.lastOrder, showMonthShort: true)}'),
                                              MySpacing.width(4),
                                              MyText.bodySmall(
                                                '${Utils.getTimeStringFromDateTime(data.lastOrder, showSecond: false)}',
                                                muted: true,
                                                fontWeight: 600,
                                              )
                                            ],
                                          )),
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: MyContainer.bordered(
                                                onTap: () => {},
                                                padding: MySpacing.xy(6, 6),
                                                borderColor: contentTheme
                                                    .primary
                                                    .withAlpha(40),
                                                child: Icon(
                                                  LucideIcons.edit2,
                                                  size: 12,
                                                  color: contentTheme.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
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
