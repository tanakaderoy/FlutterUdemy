import 'dart:math';

class PersonData{
  String _gender;
  double _height;
  int _weight;
  int _age;


  PersonData();


  @override
  String toString() {
    return 'PersonData{_gender: $_gender, _height: $_height, _weight: $_weight, _age: $_age}';
  }

  PersonData.create(this._gender, this._height, this._weight, this._age);

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  double get height => _height;

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  int get weight => _weight;

  set weight(int value) {
    _weight = value;
  }

  set height(double value) {
    _height = value;
  }

  double calculateBMI(){
    double inches = (height / 2.54);
    double feet = (inches / 12);
    print({'weight':weight,'height':inches.roundToDouble()});
    return ((703 * weight) /( pow(inches.roundToDouble(), 2)));
    //703 x weight (lbs) / [height (in)]2
  }
//  String returnFeetInches() {
//    double inches = (height / 2.54);
//    double feet = (inches / 12);
//    String foot = feet.toInt().toString();
//    String inch =
//    (((10 * feet - 10 * feet.toInt()) / 10) * 100).toStringAsFixed(0);
//    return '$foot\'$inch';
//  }

  String getBMIStatus() {
    double bmi = calculateBMI();
    if (bmi < 18.5) {
      return 'UnderWeight';
    }  if (bmi >= 18.5  && bmi < 25.0) {
      return 'Normal';
    }  if (bmi >= 25.0&& bmi < 30.0) {
      return 'Overweight';
    }  if (bmi >= 30.0 && bmi < 35.0) {
      return 'THICCCC';
    }else{
      return 'TOO DANG THIUGH';
    }
  }

}