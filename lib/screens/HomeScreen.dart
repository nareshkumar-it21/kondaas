import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kondaas/models/basic_model.dart';
import 'package:kondaas/services/Basic_service.dart';

class HomeScreen extends StatefulWidget {
  final dynamic plantid;
  const HomeScreen({super.key, required this.plantid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BasicService service = BasicService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: service.sendRequest(widget.plantid),
        builder: ((context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }else {
            final models =snapshot.data;
            DateTime datetime = DateTime.fromMillisecondsSinceEpoch((models!.lastUpdateTime * 1000).toInt());
            String lastupdatetime = DateFormat('h:mm a').format(datetime);
            return Stack(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 130,
                    maxWidth: 2000,
                  ),


                  // padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      /*gradient: LinearGradient(
                        colors: [
                          Color(0xFF41436A),
                          Color(0xFF1976D2)
                        ], // Teal to Darker Green
                      ),*/
                    color: Color(0xFFA2D5AB),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.cyan.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)
                        )
                      ]
                  ),
                ),

                Container(
                  //color: Colors.blue,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 64,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/kondaasLogo.png',
                                  height: 50,
                                ),
                                SizedBox(width: 120,),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CircleAvatar(
                                      radius: 28,
                                      backgroundImage: AssetImage(
                                        'assets/images/profile.png',
                                      ),
                                    ),
                                  ),
                                ),
                                /*SizedBox(width: 16,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "User",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white
                                      ),
                                    ),

                                  ],
                                )*/
                              ],
                            ),
                          ),
                          SizedBox(height: 60,),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              primary: false,
                              children: <Widget>[
                                Card(
                                  elevation: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/electricity.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        "Consumption Power",
                                        style: GoogleFonts.aBeeZee(),
                                      ),
                                      Text(
                                        '${models!.usePower.toString()} W',
                                        style: GoogleFonts.aBeeZee(),
                                      ),

                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/electric-power.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        "Generation Power",
                                        style: GoogleFonts.aBeeZee(),
                                      ),
                                      Text(
                                        '${models!.generationPower.toString()} W', style: GoogleFonts.aBeeZee(),)

                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/chronometer.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                      SizedBox(height: 15 ,),
                                      Text(
                                        'Last time update',
                                        style: GoogleFonts.aBeeZee(),
                                      ),
                                      Text(
                                        lastupdatetime, style: GoogleFonts.aBeeZee(),)

                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/transmission-tower.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        "Generation Total",
                                        style: GoogleFonts.aBeeZee(),
                                      ),
                                      Text(
                                        '${models!.generationTotal.toString()} Wh', style: GoogleFonts.aBeeZee(),)

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        }
        ),
      ),
    );
  }
}
