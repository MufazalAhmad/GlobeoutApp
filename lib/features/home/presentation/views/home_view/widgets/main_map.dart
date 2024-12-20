import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/home/presentation/providers/events_view_type_provider.dart';
import 'package:globout/features/home/presentation/providers/location_provider.dart';
import 'package:globout/features/home/presentation/providers/markers_provider.dart';
import 'package:globout/features/home/presentation/providers/selected_cluster_provider.dart';
import 'package:globout/features/home/presentation/views/home_view/pop_ups/send_message_popup.dart';
import 'package:globout/features/location/domain/models/custom_marker_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../util/resource/r.dart';
import 'custom_map_marker_cluster_widget.dart';
import 'list_view_for_cluster_send_message_cards.dart';

class MainMapWidget extends ConsumerStatefulWidget {
  const MainMapWidget({super.key});

  @override
  ConsumerState<MainMapWidget> createState() => _MainMapWidgetState();

  static const _style = [
    {
      "featureType": "all",
      "elementType": "labels.text.fill",
      "stylers": [
        {"saturation": 36},
        {"color": "#000000"},
        {"lightness": 40}
      ]
    },
    {
      "featureType": "all",
      "elementType": "labels.text.stroke",
      "stylers": [
        {"visibility": "on"},
        {"color": "#000000"},
        {"lightness": 16}
      ]
    },
    {
      "featureType": "all",
      "elementType": "labels.icon",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.fill",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 20}
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.stroke",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 17},
        {"weight": 1.2}
      ]
    },
    {
      "featureType": "landscape",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 20}
      ]
    },
    {
      "featureType": "landscape.man_made",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "landscape.natural.landcover",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "landscape.natural.terrain",
      "elementType": "geometry.fill",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 21}
      ]
    },
    {
      "featureType": "poi.attraction",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "poi.business",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "poi.government",
      "elementType": "all",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "poi.sports_complex",
      "elementType": "all",
      "stylers": [
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.fill",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 17}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 29},
        {"weight": 0.2}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 18}
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 16}
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 19}
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "all",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {"color": "#000000"},
        {"lightness": 17}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
        {"visibility": "on"},
        {"color": "#3f3f3f"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.stroke",
      "stylers": [
        {"color": "#ff0000"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.icon",
      "stylers": [
        {"saturation": "0"},
        {"lightness": "1"}
      ]
    }
  ];
}

class _MainMapWidgetState extends ConsumerState<MainMapWidget> {
  GoogleMapController? _googleMapController;

  @override
  void initState() {
    super.initState();
  }

  void onTapMarker(CustomMarkerModel customMarkerModel) {
    if (customMarkerModel.event.length > 1) {
      ref
          .read(selectedClusterProvider.notifier)
          .setCluster(customMarkerModel.event);
      return;
    }

    showDialog(
      context: context,
      builder: (context) =>
          SendMessagePopup(event: customMarkerModel.event.first),
    );
  }

  void onTapCurrentLocation(LatLng latLng) {
    _googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(locationProvider);
    final markers = ref.watch(markersProvider);
    final eventTypeView = ref.watch(eventsViewTypeProvider);

    if (!locationAsync.hasValue) {
      return Center(
        child: CircularProgressIndicator(
          color: R.colors.white_FFFFFFFF,
        ),
      );
    }

    final location = locationAsync.value;

    return Stack(
      children: [
        const CustomMapMarkerClusterWidget(),
        GoogleMap(
          onMapCreated: (controller) {
            _googleMapController = controller;
            controller.setMapStyle(jsonEncode(MainMapWidget._style));
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          minMaxZoomPreference: const MinMaxZoomPreference(0, 11),
          initialCameraPosition: CameraPosition(
            target: LatLng(location!.lat, location.lng),
            zoom: 12,
          ),
          markers: eventTypeView.isMap
              ? Set.from(
                  markers.map((e) {
                    return e.marker.copyWith(
                      onTapParam: () => onTapMarker(e),
                    );
                  }).toList(),
                )
              : {},
        ),
        Positioned(
          right: 15.w,
          bottom: 110.h,
          child: GestureDetector(
            onTap: () =>
                onTapCurrentLocation(LatLng(location.lat, location.lng)),
            child: Card(
              elevation: 8,
              color: R.colors.charcoal_FF1A1A1A,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Container(
                height: 60.r,
                width: 60.r,
                decoration: BoxDecoration(
                    color: R.colors.jetBlack_FF2E2E2E, shape: BoxShape.circle),
                child: ClipOval(
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Image.asset(
                      R.pngs.LOCATION_NAV_IMAGE,
                      color: R.colors.white_FFF5F5F5,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const ListViewForClusterSendMessageCards(),
      ],
    );
  }
}
