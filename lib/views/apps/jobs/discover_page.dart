import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webui/controller/apps/jobs/job_discover_controller.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_flex.dart';
import 'package:webui/helper/widgets/my_flex_item.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/images.dart';
import 'package:webui/views/layout/layout.dart';

class JobDiscoverPage extends StatefulWidget {
  const JobDiscoverPage({Key? key}) : super(key: key);

  @override
  State<JobDiscoverPage> createState() => _JobDiscoverPageState();
}

class _JobDiscoverPageState extends State<JobDiscoverPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late DiscoverController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
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
                      "Discover",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "UI"),
                        MyBreadcrumbItem(name: "Discover", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFlex(
                      contentPadding: false,
                      children: [
                        MyFlexItem(
                          sizes: "lg-8",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyContainer(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.titleMedium(
                                          "Feature Jobs",
                                          fontWeight: 600,
                                        ),
                                        MyButton.text(
                                          onPressed: () {},
                                          padding: MySpacing.xy(8, 8),
                                          splashColor: contentTheme.secondary
                                              .withOpacity(0.1),
                                          child: MyText.bodySmall(
                                            'See All',
                                            color: contentTheme.secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // MySpacing.height(8),
                                    buildFeatureJobs(),
                                  ],
                                ),
                              ),
                              MySpacing.height(36),
                              MyContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.titleMedium(
                                      "Discovery Jobs",
                                      fontWeight: 600,
                                    ),
                                    MySpacing.height(8),
                                    buildDiscoveryJobs(),
                                  ],
                                ),
                              ),
                              MySpacing.height(36),
                              MyFlex(
                                contentPadding: false,
                                children: [
                                  MyFlexItem(
                                    sizes: "lg-8",
                                    child: MyContainer(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: MyText.titleMedium(
                                                  "Salary Trend",
                                                  fontWeight: 600,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  MyText.bodySmall("Sort by :"),
                                                  MySpacing.width(8),
                                                  PopupMenuButton(
                                                    itemBuilder:
                                                        (BuildContext context) {
                                                      return [
                                                        "Year",
                                                        "Month",
                                                        "Day",
                                                        "Hours"
                                                      ].map((behavior) {
                                                        return PopupMenuItem(
                                                          value: behavior,
                                                          height: 32,
                                                          child:
                                                              MyText.bodySmall(
                                                            behavior.toString(),
                                                            color: theme
                                                                .colorScheme
                                                                .onBackground,
                                                            fontWeight: 600,
                                                          ),
                                                        );
                                                      }).toList();
                                                    },
                                                    onSelected: controller
                                                        .onSelectedTime,
                                                    color:
                                                        theme.cardTheme.color,
                                                    child: Row(
                                                      children: <Widget>[
                                                        MyText.labelMedium(
                                                          controller.selectTime
                                                              .toString(),
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4),
                                                          child: Icon(
                                                            Icons
                                                                .expand_more_outlined,
                                                            size: 22,
                                                            color: theme
                                                                .colorScheme
                                                                .onBackground,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  MySpacing.width(8),
                                                  Center(
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.download_outlined,
                                                        // color:
                                                        //     contentTheme.primary,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SfCartesianChart(
                                            primaryXAxis: CategoryAxis(
                                              majorGridLines:
                                                  MajorGridLines(width: 0),
                                              axisLine: AxisLine(width: 0),
                                            ),
                                            primaryYAxis: CategoryAxis(
                                              majorGridLines:
                                                  MajorGridLines(width: 0),
                                              axisLine: AxisLine(width: 0),
                                            ),
                                            tooltipBehavior:
                                                controller.tooltipBehavior,
                                            series: <ChartSeries>[
                                              SplineSeries<ChartData, String>(
                                                dataSource:
                                                    controller.chartData,
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                        data.y,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MyFlexItem(
                                    sizes: "lg-4",
                                    child: MyContainer(child: buildHotJobs()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        MyFlexItem(
                          sizes: "lg-4",
                          child: buildLeftBarMatchingJob(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildChip(String chipName) {
    return RawChip(
      label: MyText.bodyMedium(
        chipName,
      ),
      backgroundColor: contentTheme.primary.withAlpha(20),
      deleteIcon: Icon(Icons.add),
    );
  }

  Widget buildCardPills(String pillContent) {
    return MyContainer.none(
      borderRadiusAll: 16,
      padding: MySpacing.xy(12, 4),
      color: contentTheme.light.withAlpha(180),
      child: Center(
        child: MyText.titleMedium(
          pillContent,
          fontSize: 14,
          fontWeight: 600,
          color: contentTheme.primary,
        ),
      ),
    );
  }

  Widget buildLeftBarMatchingJob() {
    return MyContainer(
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.titleMedium(
                  "Find Matching Jobs",
                  fontWeight: 600,
                ),
                MySpacing.height(20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: contentTheme.primary.withOpacity(0.08),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: contentTheme.primary,
                    ),
                    isDense: true,
                    hintText: "Search Files",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: MySpacing.horizontal(20),
                  ),
                ),
                MySpacing.height(20),
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    buildChip("Google"),
                    buildChip("Facebook"),
                    buildChip("Apple"),
                    buildChip("Amazon"),
                    buildChip("Twitter"),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: MySpacing.xy(16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.labelLarge(
                  "Salary Range",
                  muted: true,
                ),
                MySpacing.height(8),
                MyText.bodySmall(
                  "The Average listing Salary is \$90,000",
                ),
                MySpacing.height(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.start.toString()}",
                      fontWeight: 600,
                    ),
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.end.toString()}",
                      fontWeight: 600,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 10000,
                  max: 120000,
                  divisions: 10,
                  labels: RangeLabels(
                      controller.rangeSlider.start.floor().toString(),
                      controller.rangeSlider.end.floor().toString()),
                  values: controller.rangeSlider,
                  onChanged: controller.onChangeRangeSlider,
                  activeColor: theme.sliderTheme.activeTrackColor,
                  inactiveColor: theme.sliderTheme.inactiveTrackColor,
                ),
                MySpacing.height(12),
                MyText.labelLarge(
                  "Select Experience",
                  muted: true,
                ),
                MySpacing.height(8),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return ["Beginner", "Intermediate", "Expert"]
                        .map((behavior) {
                      return PopupMenuItem(
                        value: behavior,
                        height: 28,
                        child: MyText.bodySmall(
                          behavior.toString(),
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                      );
                    }).toList();
                  },
                  onSelected: controller.onSelectedExperience,
                  color: theme.cardTheme.color,
                  child: MyContainer.bordered(
                    padding: MySpacing.xy(12, 8),
                    child: Row(
                      children: <Widget>[
                        MyText.labelMedium(
                          controller.selectExperience.toString(),
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                ),
                MySpacing.height(20),
                MyText.labelLarge(
                  "Select Location",
                  muted: true,
                ),
                MySpacing.height(8),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return ["Mumbai", "Tokyo", "San Francisco"].map((behavior) {
                      return PopupMenuItem(
                        value: behavior,
                        height: 28,
                        child: MyText.bodySmall(
                          behavior.toString(),
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                      );
                    }).toList();
                  },
                  onSelected: controller.onSelectedLocation,
                  color: theme.cardTheme.color,
                  child: MyContainer.bordered(
                    padding: MySpacing.xy(12, 8),
                    child: Row(
                      children: <Widget>[
                        MyText.labelMedium(
                          controller.selectLocation.toString(),
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: MySpacing.xy(16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.labelLarge(
                  "Job Types",
                  muted: true,
                ),
                MySpacing.height(8),
                Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  children: [
                    MyContainer.bordered(
                      paddingAll: 8,
                      borderRadiusAll: 24,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onTap: () {
                        controller.select(1);
                      },
                      color: controller.selectJobType == 1
                          ? contentTheme.primary
                          : contentTheme.onPrimary,
                      child: MyText.bodyMedium(
                        'Full-Time',
                        fontWeight: 600,
                        color: controller.selectJobType == 1
                            ? contentTheme.onPrimary
                            : contentTheme.primary,
                      ),
                    ),
                    MyContainer.bordered(
                      onTap: () {
                        controller.select(2);
                      },
                      paddingAll: 8,
                      borderRadiusAll: 24,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: controller.selectJobType == 2
                          ? contentTheme.primary
                          : contentTheme.onPrimary,
                      child: MyText.bodyMedium(
                        'Part-Time',
                        fontWeight: 600,
                        color: controller.selectJobType == 2
                            ? contentTheme.onPrimary
                            : contentTheme.primary,
                      ),
                    ),
                    MyContainer.bordered(
                      onTap: () {
                        controller.select(3);
                      },
                      paddingAll: 8,
                      borderRadiusAll: 24,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: controller.selectJobType == 3
                          ? contentTheme.primary
                          : contentTheme.onPrimary,
                      child: MyText.bodyMedium(
                        'Mobile',
                        fontWeight: 600,
                        color: controller.selectJobType == 3
                            ? contentTheme.onPrimary
                            : contentTheme.primary,
                      ),
                    ),
                    MyContainer.bordered(
                      onTap: () {
                        controller.select(4);
                      },
                      paddingAll: 8,
                      borderRadiusAll: 24,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: controller.selectJobType == 4
                          ? contentTheme.primary
                          : contentTheme.onPrimary,
                      child: MyText.bodyMedium(
                        'Contract',
                        fontWeight: 600,
                        color: controller.selectJobType == 4
                            ? contentTheme.onPrimary
                            : contentTheme.primary,
                      ),
                    ),
                  ],
                ),
                MySpacing.height(20),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.blueGrey,
                        contentTheme.primary,
                        contentTheme.primary.withAlpha(200),
                        Colors.blueGrey
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Padding(
                    padding: MySpacing.all(flexSpacing / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.workspace_premium_outlined,
                          size: 30,
                          color: contentTheme.onPrimary,
                        ),
                        MySpacing.width(12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.titleMedium(
                                "Upgrade To Pro",
                                fontWeight: 600,
                                color: contentTheme.onPrimary,
                              ),
                              MyText.bodyLarge(
                                "For premium Benefits",
                                color: contentTheme.onPrimary,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        MyText.bodyMedium(
                          "Upgrade",
                          color: contentTheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
                MySpacing.height(8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDiscoveryJobs() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        itemCount: controller.discover.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyContainer.bordered(
                height: 170,
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyContainer.none(
                        borderRadiusAll: 26,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          Images.avatars[index % Images.portraitImages.length],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
                    MyText.titleMedium(
                      controller.discover[index].jobTitle,
                      fontWeight: 600,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    MyText.titleMedium(
                      controller.discover[index].appName,
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(4),
                    MyText.bodyMedium("\$${controller.discover[index].price}/y")
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget buildFeatureJobs() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.discover.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.blueGrey,
                      contentTheme.primary,
                      contentTheme.primary.withAlpha(200),
                      Colors.blueGrey
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Padding(
                  padding: MySpacing.xy(flexSpacing / 1.5, flexSpacing / 1.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MyContainer.none(
                            borderRadiusAll: 8,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.avatars[
                                  index % Images.portraitImages.length],
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          MySpacing.width(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  controller.discover[index].jobTitle,
                                  fontWeight: 600,
                                  fontSize: 16,
                                  color: contentTheme.onPrimary,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                MyText.titleMedium(
                                  controller.discover[index].appName,
                                  color: contentTheme.onPrimary,
                                  muted: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCardPills("IT"),
                          buildCardPills("Full-Time"),
                          buildCardPills("Junior"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText.bodyMedium(
                            "\$${controller.discover[index].price}/Year",
                            color: contentTheme.onPrimary,
                          ),
                          MyText.bodyMedium(
                            controller.discover[index].country,
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget buildHotJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.titleMedium(
          "Hot Jobs",
          fontWeight: 600,
        ),
        MySpacing.height(16),
        SizedBox(
          height: 300,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.discover.length,
            itemBuilder: (context, index) {
              return MyContainer.bordered(
                paddingAll: 16,
                child: Row(
                  children: [
                    MyContainer.none(
                      borderRadiusAll: 26,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        Images.avatars[index % Images.portraitImages.length],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyMedium(
                            controller.discover[index].jobTitle,
                            fontWeight: 600,
                          ),
                          MySpacing.height(4),
                          MyText.bodyMedium(
                            controller.discover[index].appName,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText.bodyMedium(
                          "\$${controller.discover[index].price}/y",
                          fontWeight: 600,
                        ),
                        MySpacing.height(4),
                        MyText.bodyMedium(
                          controller.discover[index].country,
                          fontSize: 12,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          ),
        )
      ],
    );
  }
}
