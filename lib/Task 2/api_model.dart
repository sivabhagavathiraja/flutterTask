class LatLng {
  double? lat;
  double? lng;

  LatLng({this.lat, this.lng});

  LatLng.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Legs {
  Distance? distance;
  Distance? duration;
  String? endAddress;
  LatLng? endLocation;
  String? startAddress;
  LatLng? startLocation;
  List<Steps>? steps;
  List<dynamic>? trafficSpeedEntry;
  List<dynamic>? viaWaypoint;

  Legs(
      {this.distance,
      this.duration,
      this.endAddress,
      this.endLocation,
      this.startAddress,
      this.startLocation,
      this.steps,
      this.trafficSpeedEntry,
      this.viaWaypoint});

  Legs.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration = json['duration'] != null ? Distance.fromJson(json['duration']) : null;
    endAddress = json['end_address'];
    endLocation = json['end_location'] != null ? LatLng.fromJson(json['end_location']) : null;
    startAddress = json['start_address'];
    startLocation = json['start_location'] != null ? LatLng.fromJson(json['start_location']) : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    if (json['traffic_speed_entry'] != null) {
      trafficSpeedEntry = <Null>[];
      json['traffic_speed_entry'].forEach((v) {
        trafficSpeedEntry!.add(v);
      });
    }
    if (json['via_waypoint'] != null) {
      viaWaypoint = <Null>[];
      json['via_waypoint'].forEach((v) {
        viaWaypoint!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (distance != null) {
      data['distance'] = distance!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    data['end_address'] = endAddress;
    if (endLocation != null) {
      data['end_location'] = endLocation!.toJson();
    }
    data['start_address'] = startAddress;
    if (startLocation != null) {
      data['start_location'] = startLocation!.toJson();
    }
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    if (trafficSpeedEntry != null) {
      data['traffic_speed_entry'] = trafficSpeedEntry!.map((v) => v.toJson()).toList();
    }
    if (viaWaypoint != null) {
      data['via_waypoint'] = viaWaypoint!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Distance {
  String? text;
  int? value;

  Distance({this.text, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}

class Steps {
  Distance? distance;
  Distance? duration;
  LatLng? endLocation;
  String? htmlInstructions;
  String? polyline;
  LatLng? startLocation;
  String? travelMode;
  String? maneuver;

  Steps(
      {this.distance,
      this.duration,
      this.endLocation,
      this.htmlInstructions,
      this.polyline,
      this.startLocation,
      this.travelMode,
      this.maneuver});

  Steps.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration = json['duration'] != null ? Distance.fromJson(json['duration']) : null;
    endLocation = json['end_location'] != null ? LatLng.fromJson(json['end_location']) : null;
    htmlInstructions = json['html_instructions'];
    polyline = json['polyline']["Points"];
    startLocation = json['start_location'] != null ? LatLng.fromJson(json['start_location']) : null;
    travelMode = json['travel_mode'];
    maneuver = json['maneuver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (distance != null) {
      data['distance'] = distance!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    if (endLocation != null) {
      data['end_location'] = endLocation!.toJson();
    }
    data['html_instructions'] = htmlInstructions;
    data['polyline'] = polyline;
    if (startLocation != null) {
      data['start_location'] = startLocation!.toJson();
    }
    data['travel_mode'] = travelMode;
    data['maneuver'] = maneuver;
    return data;
  }
}
