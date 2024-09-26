import 'dart:async';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/tabs/artisan_about_tab.dart';
import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/tabs/artisan_portfolio_tab.dart';
import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/tabs/artisan_review_tab.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class ArtisanPage extends StatefulWidget {
  const ArtisanPage({super.key});

  @override
  State<ArtisanPage> createState() => _ArtisanPageState();
}

class _ArtisanPageState extends State<ArtisanPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: DefaultTabController(
            length: 3,
            child: Column(children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    SafeArea(
                      bottom: false,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: const CircleAvatar(
                                    radius: 20,
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    child: Icon(UniconsLine.arrow_left)),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(UniconsLine.bookmark,
                                  color: Colors.black, size: 20),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(UniconsLine.share_alt,
                                  color: Colors.black, size: 20),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                indicatorWeight: 3,
                indicatorColor: AppColors.primaryColor,
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: "Portfolio"),
                  Tab(
                    text: "Review",
                  )
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ArtisanAboutTab(),
                    ArtisanPortfolioPage(),
                    ArtisanReviewTab(),
                  ],
                ),
              )
            ]),
          )),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: UtilityClass.buttonDecorationFill,
                child: ElevatedButton(
                    onPressed: () {
                      customBottomSheet(context);
                    },
                    child: const Text("Request")),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: UtilityClass.buttonDecorationOnlyOutline,
              child: ElevatedButton(
                  onPressed: () {
                    showScheduleBottomSheet(context);
                  },
                  child: const Text("Schedule",
                      style: TextStyle(color: Colors.black))),
            ),
          ],
        ),
      ),
    );
  }

  void customBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return SizedBox(
            width: size.width,
            height: 350,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Select your location",
                  style: UtilityClass.blackRegular,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: UtilityClass.horizontalPadding,
                  child: const Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showProceedBottomSheet(context);
                  },
                  child: Container(
                    margin: UtilityClass.horizontalPadding,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderGray),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      leading: CircleAvatar(
                        child: Icon(UniconsLine.location_point),
                      ),
                      title: Text("Current Location"),
                      subtitle: Text('Use Current your location'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.push("/home/location-picker");
                  },
                  child: Container(
                    margin: UtilityClass.horizontalPadding,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderGray),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      leading: CircleAvatar(
                        child: Icon(UniconsLine.location_arrow),
                      ),
                      title: Text("Pick Location"),
                      subtitle: Text('Pick service location from map'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

  void showProceedBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: size.width,
              height: 560,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Column(
                      children: [
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                              width: 30, color: AppColors.primaryColor),
                          afterLineStyle: const LineStyle(thickness: 1),
                          isFirst: true,
                          alignment: TimelineAlign.start,
                          endChild: Container(
                            padding: UtilityClass.horizontalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hyefur Jonathan",
                                  style: UtilityClass.blackRegular,
                                ),
                                Text(
                                  "Software Development",
                                  style: UtilityClass.tertiarySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                              width: 30, color: AppColors.tertiaryColor),
                          beforeLineStyle: const LineStyle(thickness: 1),
                          isFirst: false,
                          isLast: true,
                          alignment: TimelineAlign.start,
                          endChild: Container(
                            alignment: Alignment.centerLeft,
                            padding: UtilityClass.horizontalPadding,
                            constraints: const BoxConstraints(
                              minHeight: 100,
                            ),
                            child: Text(
                              "You",
                              style: UtilityClass.blackRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: const Divider(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Text(
                      "ETA: 30 MINS",
                      style: UtilityClass.blackSmaller,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Text(
                      "Distance: 30 km",
                      style: UtilityClass.blackSmaller,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: const Text("Leave a note"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                          hintText: "Drop a note (optional)",
                          hintStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration:
                                UtilityClass.buttonDecorationOnlyOutline,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: UtilityClass.buttonDecorationFill,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context.push("/home/success");
                                },
                                child: const Text("Proceed")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            );
          });
        });
  }

  void showScheduleBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: size.width,
              height: 460,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Select Date",
                        style: UtilityClass.blackSmall,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: GestureDetector(
                        onTap: () {
                          picker.DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5, 10, 0, 0),
                            maxTime: DateTime(2019, 6, 7, 10, 0, 0),
                            onChanged: (date) {
                              //print('change $date');
                            },
                            onConfirm: (date) {
                              //print('confirm $date');
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        child: Container(
                          width: Responsive.getSize(context).width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.borderGray)),
                          child: Text("Choose Date",
                              style: UtilityClass.blackSmall),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Select Time",
                        style: UtilityClass.blackSmall,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: GestureDetector(
                        onTap: () {
                          picker.DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              onChanged: (date) {},
                              onConfirm: (date) {},
                              currentTime: DateTime.now());
                        },
                        child: Container(
                          width: Responsive.getSize(context).width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.borderGray)),
                          child: Text("Choose Time",
                              style: UtilityClass.blackSmall),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Text(
                      "Location",
                      style: UtilityClass.blackSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      customBottomSheet(context);
                    },
                    child: Container(
                      margin: UtilityClass.horizontalPadding,
                      width: Responsive.getSize(context).width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("Select Location",
                          style: UtilityClass.blackSmall),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration:
                                UtilityClass.buttonDecorationOnlyOutline,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: UtilityClass.buttonDecorationFill,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context.push("/home/success");
                                },
                                child: const Text("Proceed")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            );
          });
        });
  }
}
