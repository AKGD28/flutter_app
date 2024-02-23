import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ConnexionPage(),
    );
  }
}

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Image(image: AssetImage("images/image-connexion.pnd"),),
          Flexible(
            flex: 5,
            child: Stack(
              children: [
                Image(
                  image: AssetImage("images/image-connexion.png"),
                ),
                Positioned(
                  bottom: 10,
                  left: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Shopline",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text(
                        "One best app for all your needs",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  btn_connexion("Continue with email",
                      FontAwesomeIcons.envelope, context),
                  btn_connexion(
                      "Continue with Google", FontAwesomeIcons.google, context),
                  btn_connexion("Continue with Apple", Icons.apple, context),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<IconData> _icons = [
    Icons.home_filled,
    Icons.search,
    Icons.favorite_border,
    Icons.shopping_bag_outlined,
    Icons.person_4_outlined,
  ];

  static const List<String> _labels = [
    'Accueil',
    'Recherche',
    'Favoris',
    'Bag',
    'Compte',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Shopline",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconBtnWithCounter(
            svgPath: 'images/message.svg',
            counter: 3,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconBtnWithCounter(
              svgPath: 'images/notif.svg',
              counter: 3,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: HomeBodyContenue(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _icons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_icons[index]),
            label: _labels[index],
          ),
        ),
      ),
    );
  }
}

class HomeBodyContenue extends StatefulWidget {
  const HomeBodyContenue({super.key});

  @override
  State<HomeBodyContenue> createState() => _HomeBodyContenueState();
}

class _HomeBodyContenueState extends State<HomeBodyContenue> {
  bool valueIconFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //------------------------------------------------------------------------------------
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cathegories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          //------------------------------------------------------------------------------------

          SizedBox(
            // color: Color(0xFF2196F3),
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listeCathegoriesProduit.length,
              itemBuilder: (BuildContext context, int index) {
                final listCathP = listeCathegoriesProduit[index];
                return EmplacementCathegorieProduit(
                  nom: listCathP.nom,
                  image: listCathP.image,
                );
              },
            ),
          ),
          //------------------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Flash Sale",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "02:04:56",
                            style: TextStyle(color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          //------------------------------------------------------------------------------------
          SizedBox(
            // color: Colors.pink,
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: liste_flashSaleCathegories.length,
              itemBuilder: (context, index) {
                final flashSale = liste_flashSaleCathegories[index];
                return FlashSaleCathegoriesPositionnement(
                  flashSale: flashSale,
                  onFavoriteChanged: (isFavorite) {
                    setState(() {
                      liste_flashSaleCathegories[index].isFavorite = isFavorite;
                    });
                  },
                );
              },
            ),
          ),
          //-----------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 237, 210),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Color Hoodie",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sale up to 40% off",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 180,
                  top: -20,
                  child: Image(
                    image: AssetImage("images/preview.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlashSaleCathegoriesPositionnement extends StatefulWidget {
  final FlashSaleCathegories flashSale;
  final Function(bool) onFavoriteChanged;

  const FlashSaleCathegoriesPositionnement({
    Key? key,
    required this.flashSale,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _FlashSaleCathegoriesPositionnementState createState() =>
      _FlashSaleCathegoriesPositionnementState();
}

class _FlashSaleCathegoriesPositionnementState
    extends State<FlashSaleCathegoriesPositionnement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 210,
                width: 200,
                decoration: BoxDecoration(
                  color: widget.flashSale.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image(
                    height: 90,
                    width: 90,
                    image: AssetImage(widget.flashSale.image),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 30,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      "${widget.flashSale.reduction}%",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  icon: widget.flashSale.isFavorite
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      widget.onFavoriteChanged(!widget.flashSale.isFavorite);
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              widget.flashSale.nom,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${widget.flashSale.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(width: 3),
              Text(
                "\$${widget.flashSale.exPrice}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough,
                  color: Color.fromARGB(255, 125, 121, 151),
                ),
              ),
              SizedBox(width: 23),
              Text(
                "${widget.flashSale.sold} Sold",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 125, 121, 151),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<FlashSaleCathegories> liste_flashSaleCathegories = [
  FlashSaleCathegories(
    nom: "Hoodie Vert Rose",
    price: 59.00,
    exPrice: 100.00,
    sold: 235,
    isFavorite: false,
    reduction: 50,
    backgroundColor: Color.fromARGB(255, 255, 228, 247),
    image: 'images/removebg-preview.png',
  ),
  FlashSaleCathegories(
    nom: "iPhone 12",
    price: 776.00,
    exPrice: 610.00,
    sold: 50,
    isFavorite: true,
    reduction: 35,
    backgroundColor: Color.fromARGB(255, 223, 211, 255),
    image: 'images/electronics.jpg',
  ),
];

class FlashSaleCathegories {
  String nom;
  String image;
  double price;
  double exPrice;
  int sold;
  bool isFavorite;
  int reduction;
  Color backgroundColor;

  FlashSaleCathegories(
      {required this.nom,
      required this.image,
      required this.price,
      required this.exPrice,
      required this.sold,
      required this.isFavorite,
      required this.reduction,
      required this.backgroundColor});
}

Widget btn_connexion(String title, IconData icon, BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(ctx)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      },
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black87,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(130),
          side: const BorderSide(
            color: Color.fromARGB(70, 0, 0, 0),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  );
}

class EmplacementCathegorieProduit extends StatelessWidget {
  final String nom;
  final String image;

  const EmplacementCathegorieProduit({
    required this.nom,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 216, 216),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 80,
            width: 80,
            child: Center(
              child: Image(
                height: 50,
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            nom,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

List<CathegoriesProduit> listeCathegoriesProduit = [
  CathegoriesProduit(nom: "Fashion", image: "images/fashion.jpg"),
  CathegoriesProduit(nom: "Electronics", image: "images/electronics.jpg"),
  CathegoriesProduit(nom: "Sports", image: "images/sports.jpg"),
  CathegoriesProduit(nom: "Automobile", image: "images/automobile.jpg"),
];

class CathegoriesProduit {
  String nom;
  String image;

  CathegoriesProduit({required this.nom, required this.image});
}

class IconBtnWithCounter extends StatelessWidget {
  final String svgPath;
  final int counter;
  final VoidCallback onPressed;

  const IconBtnWithCounter({
    super.key,
    required this.svgPath,
    required this.counter,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          SvgPicture.asset(
            svgPath,
            width: 24,
            height: 24,
          ),
          if (counter > 0)
            Positioned(
              bottom: 8,
              right: -1,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
