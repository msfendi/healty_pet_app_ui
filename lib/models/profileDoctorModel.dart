class ProfileDoctorModel {
  final String name;
  final List<String> service;
  final int distance;
  final bool isAvailable;
  final String image;

  ProfileDoctorModel(
      {required this.name,
      required this.service,
      required this.distance,
      required this.isAvailable,
      required this.image});
}
