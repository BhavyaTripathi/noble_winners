import 'package:noble_winners/json_data.dart';

class ParseResult{
  Map<String,String> m1 ={};
  Map<String,String> m2 ={};
  Map<String,String> m3 ={};
  Map<String,String> m4 ={};
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
    print(m1);
    print("*********");
    print(m2);
    print("*********");
    print(m3);
    print("*********");
    print(m4);
    print(getCount(m1));
    print(getCount(m2));
    print(getCount(m3));
    print(getCount(m4));

  }
  Map getCount(Map m1){
    Map<String,int> count ={};
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