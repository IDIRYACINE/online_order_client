import 'package:flutter/material.dart';
import 'package:online_order_client/HomeScreen.dart';
import 'package:online_order_client/Ui/Orders/CartScreen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

class CategoryproductsScreen extends StatefulWidget {
  const CategoryproductsScreen({Key? key}) : super(key: key);
  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  Future<void> ProductOrderDetail(BuildContext context) async{
   return await showDialog(context: context,
    builder: (context){
      return AlertDialog(
        content: Form(
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 150,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,),
                    child: Row(
                      children: [
                      Text("Hrissa",
                      style:TextStyle(
                          fontSize: 26
                        ),),
                        SizedBox(width: 60,),
                      IconButton(onPressed: (){
                      },icon: Icon(Icons.check_circle,
                      color: Colors.green)
                      ),
                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: 20,),
                    child: Row(
                      children: [
                      Text("Mayounez",
                      style:TextStyle(
                          fontSize: 23
                        ),),
                        SizedBox(width: 30,),
                      IconButton(onPressed: (){
                      },icon: Icon(Icons.check_circle,
                      color: Colors.green)
                      ),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left :20,
                    ),
                    child: Row(
                      children: [
                      Text("Unities",
                      style:TextStyle(
                        fontSize: 26
                      ),),
                      SizedBox(width: 10,),
                      IconButton(onPressed: (){
                        setState(() {
                          Unities--;
                        });
                      }, icon: Icon(Icons.remove_circle,color: Colors.red,)),
                      Text("$Unities"),
                      IconButton(onPressed: (){
                        setState(() {
                          Unities++;
                        });
                      }, icon: Icon(Icons.add_circle, color: Colors.green,)),
                      
                    ],),
                  ),
                  Container(
                  width: 90,
                  height: 30,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: parseColor("#FFB5A7"),
                    ),
                    label: Text('Confirme'),
                    icon: Icon(Icons.dinner_dining_rounded),
                    onPressed: () {
                      setState(() {
                        count++;

                      });
                    }
                  ),
                ),
                ]
                ),
            ),
          )
          ),
        actions: [],
      );
    }

   );
  }
  int Unities = 0;
  int currentindex = 0;
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Text(
            "THe House restaurante",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              backgroundColor: parseColor("#FCD5CE"),
              iconSize: 10,
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_return,
                    ),
                  ),
                  label: 'Return',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.home),
                    iconSize: 30,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: IconButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CartScreen()));
                    }, icon: CartIcon(count)),
                    label: 'Cart'),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElemTitle(context, "Pizza tunisian"),
              PicturesLV(),
              Divider(
                color: parseColor("#F9DCC4"),
                height: 10,
                thickness: 5,
              ),
              SizedBox(height: 15),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: ProductDescription()),
              const SizedBox(height: 10),
              PricesTabl(),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 180,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: parseColor("#FFB5A7"),
                    ),
                    label: const Text('ADD To Cart'),
                    icon: const Icon(Icons.dinner_dining_rounded),
                    onPressed: () {
                      setState(() async {
                        {
                      setState(() {
                      }
                      );
                       await ProductOrderDetail(context);
                    };
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: parseColor("#FFB5A7"),
                  ),
                  splashColor: parseColor("#FFB5A7"),
                ),
              ]),
            ],
          ),
        ));
  }
}
