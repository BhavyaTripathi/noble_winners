import 'package:noble_winners/json_data.dart';

class ParseResult{
  Map<String,dynamic> m1 ={};
  Map<String,dynamic> m2 ={};
  Map<String,dynamic> m3 ={};
  Map<String,dynamic> m4 ={};
  void getData(){
    DataWinners().awards.forEach((element) {
      if(element['category']=='Physics'){
        if(element['year']==2018){
          m1.putIfAbsent(element['name'], () => element['research']);
        }
      }
       if(element['category']=='Chemistry'){
        if(element['year']==2018){
          m2.putIfAbsent(element['name'], () => element['research']);
        }
      }
       if(element['category']=='Physics'){
        if(element['year']==2019){
          m3.putIfAbsent(element['name'], () => element['research']);
        }
      }
       if(element['category']=='Chemistry'){
        if(element['year']==2019){
          m4.putIfAbsent(element['name'], () => element['research']);
        }
      }
    });
    // print(m1);
    // print("*********");
    // print(m2);
    // print("*********");
    // print(m3);
    // print("*********");
    // print(m4);
    // print(getCount(m1));
    // print(getCount(m2));
    // print(getCount(m3));
    // print(getCount(m4));

    getRes(m1, getShare(getCount(m1)));
    getRes(m2, getShare(getCount(m2)));
    getRes(m3, getShare(getCount(m3)));
    getRes(m4, getShare(getCount(m4)));

  }
  getRes(Map<String,dynamic> m1, Map<String,double> c1){
    m1.forEach((key, value) {
      if(c1.containsKey(value)){
        m1.update(key, (value1) => c1[value]);
      }
    });
    print(m1);
  }
  getShare(Map<String,double> c1){
    int l =c1.length;
    double eachContri = 1/l;
    c1.forEach((key, value) {
      c1.update(key, (value) => eachContri/value);
    });
    return c1;
  }
  Map<String, double> getCount(Map m1){
    Map<String,double> count ={};
    m1.forEach((key, value) {
      if(!count.containsKey(value)){
        count.putIfAbsent(value, () => 1);
      }
      else{
        count.update(value, (value1) => value1+1);
      }
    });
    return count;
  }


}
void main(){
  ParseResult().getData();
}