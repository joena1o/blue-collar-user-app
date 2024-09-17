import 'dart:async';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/widgets/live_track_card.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unicons/unicons.dart';

class LiveTracking extends StatefulWidget {
  const LiveTracking({super.key});

  @override
  State<LiveTracking> createState() => _LiveTrackingState();
}

class _LiveTrackingState extends State<LiveTracking> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    const Positioned(
                      top: 0,
                      child: LabelAppBar(
                        title: "",
                        border: false,
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: expanded,
                child: SizedBox(
                  width: Responsive.getSize(context).width,
                  child: const LiveTrackCard(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 1))),
                padding: const EdgeInsets.only(
                    top: 15, left: 30, right: 30, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(UniconsLine.calling,
                              color: AppColors.primaryColor),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Call",
                            style: TextStyle(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            UniconsLine.chat,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            UniconsLine.cancel,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          !expanded
                              ? Icon(
                                  UniconsLine.expand_alt,
                                  color: AppColors.primaryColor,
                                )
                              : Icon(
                                  UniconsLine.angle_down,
                                  color: AppColors.primaryColor,
                                ),
                          const SizedBox(
                            height: 5,
                          ),
                          !expanded
                              ? Text(
                                  "Expand",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : Text(
                                  "Close",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
