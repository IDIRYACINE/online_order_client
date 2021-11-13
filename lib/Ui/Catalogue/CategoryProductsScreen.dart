import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/shared/components.dart';
class CategoryproductsScreen extends StatefulWidget {
  const CategoryproductsScreen({ Key? key }) : super(key: key);
  
  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        
        leading: Icon(Icons.perm_identity_sharp),
        title: Text('Mi Amore Restaurante',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Dancing',
          ),
        ),
        actions: [
        Icon(Icons.settings),
        SizedBox(
          width: 20
        ),
        Icon(Icons.favorite),
        ],
      ),
       bottomNavigationBar: 
      BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentindex,
        onTap: (index){
          setState(() {
            currentindex= index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_sharp,
            color: Colors.white,
            ),
            label: 'list',
            backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
            color: Colors.white,
            ),
            label: 'Home',

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu,
            color: Colors.white,
            ),
            label: 'archive'
            )
        ],
        ),
      body: 
        Container(
          color: Colors.red.withOpacity(0.4),
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
      print('Pressed');
    },
  ),    
)     
     ]
            ),
        ),
    );
  }
}