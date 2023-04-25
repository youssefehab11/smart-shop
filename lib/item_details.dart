
import 'package:flutter/material.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class itemDetails extends StatefulWidget{
  @override
  State<itemDetails> createState() => itemDetailsState();
}

class itemDetailsState extends State<itemDetails> {
  int selectedQuantity = 1;
  bool liked = false;
  var similarItemsLiked = [];
  int selectedPage = 0;

  /* Widget imageView(int pageNumber){
    
  } */

  Widget yellowStar(){
    return const Padding(
      padding: EdgeInsets.only(left: 5,bottom: 5),
      child: Icon(Icons.star_rounded,size: 30,color: Colors.amber,),
    ); 
  }
  Widget greyStar(){
    return const Padding(
      padding: EdgeInsets.only(left: 5,bottom: 5),
      child: Icon(Icons.star_rounded,size: 30,color: Colors.grey,),
    ); 
  }
  Widget setRate(){
    final provider = ProviderController.of(context);
    if(provider.totalReviews == 0){
      return Row(children: [
        greyStar(),greyStar(),greyStar(),greyStar(),greyStar()
      ],);
    }
    else if(provider.avgItemRate > 0 && provider.avgItemRate <= 1){
      return Row(children: [
        yellowStar(),greyStar(),greyStar(),greyStar(),greyStar()
      ],);
    }
    else if(provider.avgItemRate > 1 && provider.avgItemRate <= 2){
      return Row(children: [
        yellowStar(),yellowStar(),greyStar(),greyStar(),greyStar()
      ],);
    }
    else if(provider.avgItemRate > 2 && provider.avgItemRate <= 3){
      return Row(children: [
        yellowStar(),yellowStar(),yellowStar(),greyStar(),greyStar()
      ],);
    }
    else if(provider.avgItemRate > 3 && provider.avgItemRate <= 4){
      return Row(children: [
        yellowStar(),yellowStar(),yellowStar(),yellowStar(),greyStar()
      ],);
    }
    else{
      return Row(children: [
        yellowStar(),yellowStar(),yellowStar(),yellowStar(),yellowStar()
      ],);
    }
  }

  Widget checkItemDiscount(){
    final provider = ProviderController.of(context);
    if(provider.itemDiscount == 0){
      return Padding(
        padding: const EdgeInsets.only(top: 20,left: 15,),
        child: Text("${provider.stringItemPrice} EGP",style: Theme.of(context).textTheme.headline2),
        );
    }
    else{
      return Column(
        children: [
          Text("${provider.stringItemPrice} EGP",
          style: const TextStyle(fontFamily: "Lato",fontSize: 16,decoration: TextDecoration.lineThrough),),
          Text("${provider.priceOfDiscount} EGP",
          style: Theme.of(context).textTheme.headline2,),],);
    }
  }

  @override
  Widget build(BuildContext context) {
     final provider = ProviderController.of(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: InkWell(onTap: () {
            provider.itemImages.clear();
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_rounded),
          ),
          title:  Text(
            provider.itemName,
            style: const TextStyle(color: Colors.white, fontSize: 25,fontFamily: "Poppins",fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          //elevation: 0.0,
        ),
        backgroundColor:Theme.of(context).colorScheme.onPrimaryContainer,
        body:Stack(
          children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.7,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: provider.itemImages.length,
                        onPageChanged: (page) {
                          setState(() {
                            selectedPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                        return Image.asset("assets/images/${provider.itemImages[index]}",scale: 1,);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageViewDotIndicator(
                          size: const Size(10.5, 10.5),
                          unselectedSize: const Size(8, 8),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          currentItem: selectedPage,
                          count: provider.itemImages.length,
                          unselectedColor: Colors.black26,
                          selectedColor: const Color.fromRGBO(198, 48, 48, 1),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  child:provider.itemDiscount > 0 ?  Text(
                  " - ${provider.itemDiscount}%",
                  style:Theme.of(context).textTheme.subtitle1,
                  ):const SizedBox(width: 0,height: 0,)
                  ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.2,
                top: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.75,
                child: IconButton(onPressed: (() {
                  setState(() {
                    liked = !liked;
                    });
                    })
                    ,icon:Icon(liked == false? Icons.favorite_border_outlined:Icons.favorite,color
                    : const Color.fromRGBO(198, 48, 48, 1),size: 30,) ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                maxChildSize: 1,
                minChildSize: 0.6,
                builder: (context, scrollController) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    color: Theme.of(context).colorScheme.onPrimary
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    child:Column(children:[
                      /* Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 15,),
                            child: Text(provider.itemName,style: Theme.of(context).textTheme.headline2),
                          ),
                        ],
                      ), */
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,),
                        child: ListTile(
                          title: Text(provider.itemName,style: Theme.of(context).textTheme.headline2),
                          subtitle:Text(provider.itemDescription,style: const TextStyle(fontSize: 16),softWrap: true,),
                          trailing: checkItemDiscount(),
                        ),
                      ),
                      /* Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            color: const Color.fromARGB(40, 198, 48, 48),
                            child:provider.itemDiscount > 0 ?  Text(
                            " Off ${provider.itemDiscount}%",
                            style:Theme.of(context).textTheme.headline4,
                            ):Container()
                            ),
                        ),
                      ],), */
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left: 15,bottom: 5,top: 5),
                            child: provider.itemQuantity > 0 ? const Text("In Stock",
                            style: TextStyle(
                              color: Color.fromRGBO(198, 48, 48, 1),
                              fontFamily: "Poppins",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ))
                            :const Text("Out Of Stock",
                            style: TextStyle(
                              color: Color.fromRGBO(198, 48, 48, 1),
                              fontFamily: "Poppins",
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("(${provider.itemQuantity.toString()})"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        InkWell(
                          onTap: selectedQuantity == 1 ? null :() {
                            setState(() {
                              selectedQuantity --;
                            });
                          },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor:selectedQuantity == 1 ? Colors.grey:const Color.fromRGBO(198, 48, 48, 1),
                            child: const Center(child: Icon(Icons.remove,color: Colors.white,)),
                          ),
                        )),
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey)),
                          child: Center(child: Text("Qty: ${selectedQuantity.toString()}",style:Theme.of(context).textTheme.bodyText1))),
                        InkWell(
                          onTap: selectedQuantity == provider.itemQuantity ? null :() {
                            setState(() {
                              selectedQuantity ++;
                            });
                          },
                        child: Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor:selectedQuantity == provider.itemQuantity ? Colors.grey:const Color.fromRGBO(198, 48, 48, 1) ,
                            child: const Center(child: Icon(Icons.add,color: Colors.white,)),
                          ),
                        )),
                      ],),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 10,bottom: 5),
                            child: Text("Reviews",style: Theme.of(context).textTheme.headline2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 10),
                            child: Text("(${provider.totalReviews.toString()})"),
                          )
                        ],
                      ),
                      setRate(),
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: InkWell(onTap: provider.itemQuantity == 0 ? null :() {
                              //Add item to cart
                            },
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:provider.itemQuantity == 0 ? Colors.grey:const Color.fromRGBO(198, 48, 48, 1)),
                              child:Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    provider.itemQuantity == 0? const Icon(Icons.remove_shopping_cart_rounded,color: Colors.white,)
                                    :const Icon(Icons.add_shopping_cart_rounded,color: Colors.white,),
                                    const SizedBox(width: 8,),
                                    provider.itemQuantity == 0? const Text("Sold Out",
                                    style: TextStyle(fontFamily: "Poppins",fontSize: 17,color: Colors.white),)
                                    :const Text("Add to Cart",
                                    style: TextStyle(fontFamily: "Poppins",fontSize: 17,color: Colors.white),),
                                ],)
                              )
                            )
                            ),
                          )
                        ],),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 10,bottom: 5),
                            child: Text("Similar Items",style: Theme.of(context).textTheme.headline2),
                          ),
                        ],
                      ),
                      Container(
              margin: const EdgeInsets.only(left: 15, top: 1, right: 15),
              height: 290,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                for(int i = 0;i<5;i++){
                  similarItemsLiked.add(false);
                }
                return Row(children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).colorScheme.onPrimary,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    offset: const Offset(1.5, 1.5),
                                    spreadRadius: 0.5,
                                    color: Theme.of(context).shadowColor)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Chocolates.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "Description",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 5,bottom: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "EGP 0000",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                MaterialButton(onPressed: () {
                                
                              },
                              color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                              textColor: Colors.white,
                              child: const Text("Add to cart",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                              ),
                              const SizedBox(width: 10,),
                              IconButton(onPressed: (() {
                                setState(() {
                                  similarItemsLiked[index] = !similarItemsLiked[index];
                                });
                              })
                              , icon:Icon(similarItemsLiked[index] == false? Icons.favorite_border_outlined:Icons.favorite,color: const Color.fromRGBO(198, 48, 48, 1),size: 30,) )
                              ],)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 18,
                  )
                ]);
                },
              ))
                      ],)
                  ),
                );
              },)
            ],),  
    );
  }
}