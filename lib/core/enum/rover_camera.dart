enum RoverCamera {
  FHAZ,
  RHAZ,
  MAST,
  CHEMCAM,
  MAHLI,
  MARDI,
  NAVCAM,
  PANCAM,
  MINITES,
}

extension RoverCameraExtensions on RoverCamera {
  String get camName {
    switch (this) {
      case RoverCamera.FHAZ:
        return "Front Hazard Avoidance Camera";
      case RoverCamera.RHAZ:
        return "Rear Hazard Avoidance Camera";
      case RoverCamera.MAST:
        return "Mast Camera";
      case RoverCamera.CHEMCAM:
        return "Chemistry and Camera Complex";
      case RoverCamera.MAHLI:
        return "Mars Hand Lens Imager";
      case RoverCamera.MARDI:
        return "Mars Descent Imager";
      case RoverCamera.NAVCAM:
        return "Navigation Camera";
      case RoverCamera.PANCAM:
        return "Panoramic Camera";
      case RoverCamera.MINITES:
        return "Miniature Thermal Emission";
      default:
        return "";
    }
  }
}
