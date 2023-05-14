import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderController extends ChangeNotifier{

  List<String> _savedItemsNames = [];
  List<String> get savedItemsNames => _savedItemsNames; 
  List<String> _savedItemsImages = [];
  List<String> get savedItemsImages => _savedItemsImages; 
  var counter;
  var budget = '0' ;
  String subCategoryTitle = "";
  String subCategoryId = "";
  String category = "";
  String categoryId = "";
  String itemId = "";
  List items = [];
  List usedItems = [];
  List selectedCategoryBackGroundColor = [];
  List selectedCategoryLableColor = [];

  int flag = 0;

  String itemName = "";
  List itemImages = [];
  String stringItemPrice = "";
  double doubleItemPrice = 0;
  String itemDescription = "";
  int itemQuantity = 0;
  double avgItemRate = 0;
  List itemRates = [];
  int totalReviews = 0;
  int numberOfItemImages = 0;
  int itemDiscount = 0;
  double priceOfDiscount = 0.00;

  int defaultQuantity = 1;
  int numberOfCartItems = 0;
  List cartItems = [];

  late CameraPosition kGooglePlex;
  var lat;
  var long;
  var currentLocation;

  String cardNumber ="";
  String expiryDate ="";
  String cardHolderName ="";
  String cvvCode ="";

  double subtotal = 0;
  bool customAddressFlag = false;
  bool defaultAddressFlag = false;

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
  getCategoryId(String category)async{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("Categories");
  await collectionReference.where("CategoryName" ,isEqualTo: category).get().then((value) {
    value.docs.forEach((element) {
      categoryId = element.id;
    }); 
  },);
}
  getSubCategoryId(String subCategory)async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("ProductsList");
    await collectionReference.where("SubCategory",isEqualTo: subCategory).get().then((value) {
      value.docs.forEach((element) {
          subCategoryId = element.id;
      });
      getItems();
    });
  }
  getItemId(String name)async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("ProductsList").doc(subCategoryId).collection("Items");
    await collectionReference.where("Item Name",isEqualTo: name).get().then((value) {
      value.docs.forEach((element) {
          itemId = element.id;
      });
      getItemDetail();
    });
  }
  getItemDetail()async{
    DocumentReference documentReference = FirebaseFirestore.instance.collection("ProductsList").doc(subCategoryId).collection("Items").doc(itemId);
    await documentReference.get().then((value) {
      itemDescription = value.get("Description").toString();
      stringItemPrice = value.get("Price").toString();
      itemQuantity = value.get("Quantity");
      itemImages = value.get("Item Images");
      numberOfItemImages = itemImages.length;
      itemRates = value.get("Rates");
      totalReviews = (itemRates[0] + itemRates[1] + itemRates[2] + itemRates[3] + itemRates[4]);
      avgItemRate = (itemRates[0]*1 + itemRates[1]*2 + itemRates[2]*3 + itemRates[3]*4 + itemRates[4]*5)/totalReviews;
      itemDiscount = value.get("Discount");
      doubleItemPrice = value.get("Price")+0.00;
      priceOfDiscount = double.parse(( doubleItemPrice - (doubleItemPrice * itemDiscount/100)).toStringAsFixed(2));
    });
  }

  getItems()async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("ProductsList").doc(subCategoryId).collection("Items");
    await collectionReference.get().then((value) {
      value.docs.forEach((element) {
        items.add(element.data());
      });
    });
  }
  /* getLatAndLong()async{
    currentLocation = await Geolocator.getCurrentPosition().then((value) => value,);
      lat = currentLocation.latitude;
      long = currentLocation.longitude;
      kGooglePlex = CameraPosition(
      target: LatLng(30.044420, 31.235712),
      zoom: 8,
    
    );
  } */
   getPosition()async{
    currentLocation = await Geolocator.getCurrentPosition().then((value) => value);
    print(currentLocation.latitude);
    print(currentLocation.longitude);
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