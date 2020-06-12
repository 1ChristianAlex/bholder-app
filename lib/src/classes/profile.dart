class Profile {
  Profile(String name, String birthday, String thumb, String description,
      String cpf, List<dynamic> skills) {
    this.name = name;
    this.birthday = birthday;
    this.thumb = thumb;
    this.description = description;
    this.cpf = cpf;
    this.skills = skills;
  }

  String name;
  String birthday;
  String thumb;
  String description;
  String cpf;
  List<dynamic> skills;
}
