class BuildRouteWay {
  BuildRouteWay({
    this.routes,
    this.steps,
    this.stepsString,
  });

  final Routes routes;
  final List<Step> steps;
  final String stepsString;

  factory BuildRouteWay.fromJson(Map<String, dynamic> json) => BuildRouteWay(
    routes: json["routes"] == null ? null : Routes.fromJson(json["routes"]),
    steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    stepsString: json["steps_string"] == null ? null : json["steps_string"],
  );

  Map<String, dynamic> toJson() => {
    "routes": routes == null ? null : routes.toJson(),
    "steps": steps == null ? null : List<dynamic>.from(steps.map((x) => x.toJson())),
    "steps_string": stepsString == null ? null : stepsString,
  };
}

class Routes {
  Routes({
    this.geometry,
    this.type,
    this.properties,
  });

  final Geometry geometry;
  final String type;
  final Properties properties;

  factory Routes.fromJson(Map<String, dynamic> json) => Routes(
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    type: json["type"] == null ? null : json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "geometry": geometry == null ? null : geometry.toJson(),
    "type": type == null ? null : type,
    "properties": properties == null ? null : properties.toJson(),
  };
}

class Geometry {
  Geometry({
    this.coordinates,
    this.type,
  });

  final List<List<double>> coordinates;
  final String type;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: json["coordinates"] == null ? null : List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "type": type == null ? null : type,
  };
}

class Properties {
  Properties({
    this.duration,
    this.distance,
  });

  final int duration;
  final double distance;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    duration: json["duration"] == null ? null : json["duration"],
    distance: json["distance"] == null ? null : json["distance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration == null ? null : duration,
    "distance": distance == null ? null : distance,
  };
}

class Step {
  Step({
    this.geometry,
    this.type,
    this.properties,
  });

  final Geometry geometry;
  final String type;
  final Properties properties;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    type: json["type"] == null ? null : json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "geometry": geometry == null ? null : geometry.toJson(),
    "type": type == null ? null : type,
    "properties": properties == null ? null : properties.toJson(),
  };
}
