class HealthTestModel {
  String id;
  String hospitalId;
  String name;
  String description;
  String imageUrl;
  HealthTestModel(String id, String hospitalId, String name, String description,
      String imageUrl) {
    this.id = id;
    this.hospitalId = hospitalId;
    this.name = name;
    this.description = description;
    this.imageUrl = imageUrl;
  }
}
