import 'package:blue_collar_app/utils/responsive.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: FlutterLocationPicker(
            initZoom: 11,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            markerIcon: const Icon(UniconsLine.location_arrow),
            trackMyPosition: true,
            searchBarBackgroundColor: Colors.transparent,
            mapLanguage: 'en',
            //onError: (e) => print(e),
            selectLocationButtonLeadingIcon: null,
            onPicked: (pickedData) {
              //print(pickedData.latLong.latitude);
              //print(pickedData.latLong.longitude);
              //print(pickedData.address);
              //print(pickedData.addressData);
            },
            onChanged: (pickedData) {
              //print(pickedData.latLong.latitude);
              //print(pickedData.latLong.longitude);
              //print(pickedData.address);
              //print(pickedData.addressData);
            },
            showContributorBadgeForOSM: true,
          )),
    );
  }
}
