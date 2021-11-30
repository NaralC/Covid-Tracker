import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utility/constants.dart';
import '../utility/fetch_data.dart';
import '../utility/my_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? infected = '0';
  String? deaths = '0';
  String? recovered = '0';
  var numberOfCases = [];
  bool isWaiting = false;

  void getData() async {
    setState(() {
      isWaiting = true;
    });

    try {
      var covidData = await DataFromApi().fetchData();
      numberOfCases = covidData;

      setState(() {
        infected = numberOfCases[0];
        deaths = numberOfCases[1];
        recovered = numberOfCases[2];
      });

      isWaiting = false;
    } catch (exception) {
      throw "Failed to retrieve data";
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 30, top: 50, right: 20),
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF84FFFF),
                    Color(0xFF11249F),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/icons/virus.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/Drcorona.svg",
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            "Stay home,\nsave the world.",
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "Live Update",
            textAlign: TextAlign.left,
            style: kTitleTextStyle,
          ),
          Spacer(flex: 1),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kInfectedColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Infected: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      isWaiting ? 'Fetching Data...' : infected!,
                      style: kNumberTextStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDeathColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Deaths: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      isWaiting ? 'Fetching Data...' : deaths!,
                      style: kNumberTextStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kRecovercolor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Recovered: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      isWaiting ? 'Fetching Data...' : recovered!,
                      style: kNumberTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isWaiting ? Colors.grey : Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: () => getData(),
            child: Icon(Icons.refresh),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
