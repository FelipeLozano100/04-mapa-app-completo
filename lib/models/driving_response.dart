// To parse this JSON data, do
//
//     final drivingResponse = drivingResponseFromJson(jsonString);

import 'dart:convert';

DrivingResponse drivingResponseFromJson(String str) => DrivingResponse.fromJson(json.decode(str));

String drivingResponseToJson(DrivingResponse data) => json.encode(data.toJson());

class DrivingResponse {
    DrivingResponse({
        this.routes,
        this.waypoints,
        this.code,
        this.uuid,
    });

    List<Route> routes;
    List<Waypoint> waypoints;
    String code;
    String uuid;

    factory DrivingResponse.fromJson(Map<String, dynamic> json) => DrivingResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
    };
}

class Route {
    Route({
        this.weightName,
        this.weight,
        this.duration,
        this.distance,
        this.legs,
        this.geometry,
    });

    String weightName;
    double weight;
    double duration;
    double distance;
    List<Leg> legs;
    String geometry;

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        distance: json["distance"].toDouble(),
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
    );

    Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
    };
}

class Leg {
    Leg({
        this.admins,
        this.weight,
        this.duration,
        this.steps,
        this.distance,
        this.summary,
    });

    List<Admin> admins;
    double weight;
    double duration;
    List<Step> steps;
    double distance;
    String summary;

    factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        distance: json["distance"].toDouble(),
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "distance": distance,
        "summary": summary,
    };
}

class Admin {
    Admin({
        this.iso31661Alpha3,
        this.iso31661,
    });

    String iso31661Alpha3;
    String iso31661;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
    };
}

class Step {
    Step({
        this.intersections,
        this.maneuver,
        this.name,
        this.duration,
        this.distance,
        this.drivingSide,
        this.weight,
        this.mode,
        this.geometry,
    });

    List<Intersection> intersections;
    Maneuver maneuver;
    String name;
    double duration;
    double distance;
    String drivingSide;
    double weight;
    String mode;
    String geometry;

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        intersections: List<Intersection>.from(json["intersections"].map((x) => Intersection.fromJson(x))),
        maneuver: Maneuver.fromJson(json["maneuver"]),
        name: json["name"],
        duration: json["duration"].toDouble(),
        distance: json["distance"].toDouble(),
        drivingSide: json["driving_side"],
        weight: json["weight"].toDouble(),
        mode: json["mode"],
        geometry: json["geometry"],
    );

    Map<String, dynamic> toJson() => {
        "intersections": List<dynamic>.from(intersections.map((x) => x.toJson())),
        "maneuver": maneuver.toJson(),
        "name": name,
        "duration": duration,
        "distance": distance,
        "driving_side": drivingSide,
        "weight": weight,
        "mode": mode,
        "geometry": geometry,
    };
}

class Intersection {
    Intersection({
        this.entry,
        this.bearings,
        this.duration,
        this.mapboxStreetsV8,
        this.isUrban,
        this.adminIndex,
        this.out,
        this.weight,
        this.geometryIndex,
        this.location,
        this.intersectionIn,
        this.turnWeight,
        this.turnDuration,
    });

    List<bool> entry;
    List<int> bearings;
    double duration;
    MapboxStreetsV8 mapboxStreetsV8;
    bool isUrban;
    int adminIndex;
    int out;
    double weight;
    int geometryIndex;
    List<double> location;
    int intersectionIn;
    double turnWeight;
    double turnDuration;

    factory Intersection.fromJson(Map<String, dynamic> json) => Intersection(
        entry: List<bool>.from(json["entry"].map((x) => x)),
        bearings: List<int>.from(json["bearings"].map((x) => x)),
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        mapboxStreetsV8: json["mapbox_streets_v8"] == null ? null : MapboxStreetsV8.fromJson(json["mapbox_streets_v8"]),
        isUrban: json["is_urban"] == null ? null : json["is_urban"],
        adminIndex: json["admin_index"],
        out: json["out"] == null ? null : json["out"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        geometryIndex: json["geometry_index"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        intersectionIn: json["in"] == null ? null : json["in"],
        turnWeight: json["turn_weight"] == null ? null : json["turn_weight"].toDouble(),
        turnDuration: json["turn_duration"] == null ? null : json["turn_duration"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "entry": List<dynamic>.from(entry.map((x) => x)),
        "bearings": List<dynamic>.from(bearings.map((x) => x)),
        "duration": duration == null ? null : duration,
        "mapbox_streets_v8": mapboxStreetsV8 == null ? null : mapboxStreetsV8.toJson(),
        "is_urban": isUrban == null ? null : isUrban,
        "admin_index": adminIndex,
        "out": out == null ? null : out,
        "weight": weight == null ? null : weight,
        "geometry_index": geometryIndex,
        "location": List<dynamic>.from(location.map((x) => x)),
        "in": intersectionIn == null ? null : intersectionIn,
        "turn_weight": turnWeight == null ? null : turnWeight,
        "turn_duration": turnDuration == null ? null : turnDuration,
    };
}

class MapboxStreetsV8 {
    MapboxStreetsV8({
        this.mapboxStreetsV8Class,
    });

    Class mapboxStreetsV8Class;

    factory MapboxStreetsV8.fromJson(Map<String, dynamic> json) => MapboxStreetsV8(
        mapboxStreetsV8Class: classValues.map[json["class"]],
    );

    Map<String, dynamic> toJson() => {
        "class": classValues.reverse[mapboxStreetsV8Class],
    };
}

enum Class { STREET, TERTIARY }

final classValues = EnumValues({
    "street": Class.STREET,
    "tertiary": Class.TERTIARY
});

class Maneuver {
    Maneuver({
        this.type,
        this.instruction,
        this.bearingAfter,
        this.bearingBefore,
        this.location,
        this.modifier,
    });

    String type;
    String instruction;
    int bearingAfter;
    int bearingBefore;
    List<double> location;
    String modifier;

    factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
        type: json["type"],
        instruction: json["instruction"],
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        modifier: json["modifier"] == null ? null : json["modifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "instruction": instruction,
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": List<dynamic>.from(location.map((x) => x)),
        "modifier": modifier == null ? null : modifier,
    };
}

class Waypoint {
    Waypoint({
        this.distance,
        this.name,
        this.location,
    });

    double distance;
    String name;
    List<double> location;

    factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"].toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
