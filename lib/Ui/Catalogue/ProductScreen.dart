import 'package:flutter/material.dart';
import 'package:online_order_client/HomeScreen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
class CategoryproductsScreen extends StatefulWidget {
  const CategoryproductsScreen({ Key? key }) : super(key: key);
  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int currentindex=0;
 int count=0;
 void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text(
          "THe House restaurante",
          style: TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: parseColor("#FCD5CE"),
        centerTitle: false,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
          backgroundColor: parseColor("#FCD5CE"),
          iconSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_return,
                ),
              ),
              label: 'hile',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.home),
                iconSize: 40,
              ),
              label: 'hile',
            ),
            BottomNavigationBarItem(
                icon: IconButton(onPressed: () {}, icon: CartIcon(count)),
                label: 'hile'),
          ]),
      body: 
        SingleChildScrollView(
          child: Container(
            child: Column(
              children:[
                Container(
                  height: 60,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Pizza\'s",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Dancing' ,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                        width:10
                      ),
                      Image.asset('assets/images/PizzaLogo.png'),
                      ]
                    )
                  )
                  ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [Image.network('https://www.platetrecette.fr/wp-content/uploads/2020/06/Pizza-Margherita-sans-gluten.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                      vertical:10,                     
                      ),
                      child: Text('Margerita pizza',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily:'Dancing',
                      ),
                      ),
                    ),
                  ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Text('----Description----',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fruktur',
                      ),
                      ),
                      Text('olive,champinion,tomatos,potato,fromage,viond',
                      maxLines:3,
                      textWidthBasis: TextWidthBasis.longestLine,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Fruktur',
                      ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    Table(                 
                      border: TableBorder.all(
                      width: 2.7,
                      ), // Allows to add a border decoration around your table
          children: [ 
            TableRow(
              children :[
              Text('Size',
              style: TextStyle(
          fontSize: 20,
              ),
              ),
              Text('meduim',
              textAlign: TextAlign.center,
              style: TextStyle(
              ),
              ),
              Text('Larg',
              textAlign: TextAlign.center,
              ),
              Text('Too Larg',
              textAlign: TextAlign.center,
              ),
            ]
            ),
            TableRow(
              children :[
              Text('Prices',
              style: TextStyle(
          fontSize: 20,
              ),),
              Text('2500 DA',
              textAlign: TextAlign.center,
              ),
              Text('3000 DA',
              textAlign: TextAlign.center,
              ),
              Text('3500 DA',
              textAlign: TextAlign.center,
              ),
            ]),
          ]
        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                  ),
        Container(
                    width: 220,
                    height: 60,
                    child: ElevatedButton.icon(  
                      style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            label: Text('Give me !!'),
            icon: Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {
              setState(() {
                  count++;
              });
            },
          ),    
        )     
             ]
              ),
          ),
        ),
    );
  }
}