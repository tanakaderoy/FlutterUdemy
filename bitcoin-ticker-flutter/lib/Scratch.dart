

void main(){


  void bottlesOfBeers(int n){
    for(int i = n; i>0; i--){
      print('$i bottles of beer on the wall, $i bottles of beer\n'
          'Take one down and pass it around, ${i-1} bottles of beer on the wall');
    }
  }
  bottlesOfBeers(99);

}