import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_api_and_ui/controller/home_screen_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getCategories();
        await context.read<HomeScreenController>().getProductList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provWatch = context.watch<HomeScreenController>();
    final provRead = context.read<HomeScreenController>();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "11 : 11 Shopping App",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorWidth: 3,
                        cursorColor: Colors.grey,
                        cursorHeight: 22,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                          fillColor: Colors.grey,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 13),
                    Container(
                      height: 62,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        Icons.card_travel_outlined,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 28),
              itemCount: provWatch.categoriesList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provWatch.categoriesList[index].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.all(14),
            itemCount: provWatch.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              mainAxisExtent: 330,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 270,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(provWatch.productList[index].image
                                  .toString()), //imageadding
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(4, 3),
                                  blurRadius: 5,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      provWatch.productList[index].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      provWatch.productList[index].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        ]));
  }
}
