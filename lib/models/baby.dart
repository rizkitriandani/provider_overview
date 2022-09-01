class Babies {
  final int age;
  final bool isEqual;
  Babies({required this.age, this.isEqual=false});

  Future<int> getBabies() async {
    await Future.delayed(Duration(seconds: 3));

    if (age > 1 && age < 5) {
      return 4;
    } else if (age <= 1) {
      return 0;
    } else {
      return 2;
    }
  }

  Future<bool> getEqual(bool eq) async {
    await Future.delayed(Duration(seconds: 3));

    if (eq) {
      return true;
    } else {
      return false;
    }
  }
}
