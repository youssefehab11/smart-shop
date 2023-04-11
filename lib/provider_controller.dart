import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderController extends ChangeNotifier{

  List<String> _savedItemsNames = [];
  List<String> get savedItemsNames => _savedItemsNames; 
  List<String> _savedItemsImages = [];
  List<String> get savedItemsImages => _savedItemsImages; 
  var counter;
  var budget = '0' ;

  void makeListItemName(List checked,List subCategory){
    for(int i = 0; i < checked.length; i++ ){
      if(checked[i] == true){
        _savedItemsNames.add(subCategory[i]['Item Name']);
                          
      }
    }
    _savedItemsNames = _savedItemsNames.toSet().toList();
    counter = _savedItemsNames.length;
    notifyListeners();
  }
  void makeListItemImage(List checked,List subCategory){
    for(int i = 0; i < checked.length; i++ ){
      if(checked[i] == true){
        _savedItemsImages.add(subCategory[i]['Image']);
                          
      }
    }
    _savedItemsImages = _savedItemsImages.toSet().toList(); 
    notifyListeners();
  }
  void deleteItem(int index){
    _savedItemsNames.removeAt(index);
    _savedItemsImages.removeAt(index);
    notifyListeners();
  }
  void clearList(){
    _savedItemsNames.clear();
    notifyListeners();
  }
  saveValue(String value){
    if(value == ''){
      budget = '0';
    }
    else{
      budget = value;
    }
    notifyListeners();
  }

  static ProviderController of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<ProviderController>(
      context,
      listen: listen,
    );
  }

  
  }