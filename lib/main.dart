import 'package:flutter/material.dart';
import 'data_service.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  String cityName = 'Paris';
  String day = 'Monday,July 18th,2022';
  String temp = '28';
  String desc = 'Partly cloudy';
  String icon= '119';

  //final tom = now.add(Duration(days:1));
  String day1 = 'Monday';
  String day2 = 'Tuesday';
  String day3 = 'Wednesday';
  String date1= 'July 18th,2022';
  String date2= 'July 19th,2022';
  String date3= 'July 20th,2022';
  String temp1 = '30';
  String temp2 = '20';
  String temp3='25';
  String icon1='113';
  String icon2='116';
  String icon3='119';

  //call back function for state management to reflect selected city in UI
  callback(varcityName,varday,vartemp,vardesc,varicon,varday1,varday2,varday3,vardate1,
      vardate2,vardate3,vartemp1,vartemp2,vartemp3,varicon1,varicon2,varicon3)
  {
    setState(() {
      cityName=varcityName;
      day=varday;
      temp=vartemp;
      desc= vardesc;
      icon = varicon;
      day1= varday1;
      day2=varday2;
      day3=varday3;
      date1=vardate1;
      date2=vardate2;
      date3=vardate3;
      temp1=vartemp1;
      temp2=vartemp2;
      temp3=vartemp3;
      icon1=varicon1;
      icon2=varicon2;
      icon3=varicon3;
    });
  }

//Material app is the root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (context) =>  Scaffold(
              resizeToAvoidBottomInset: false,    //to stop bottom overflow when on-click of textfield
              backgroundColor: Colors.blueAccent,  //sets entire home page to blue
              body:Column(        //homepage is in column layout widget
                children: [       //inside column layout all containers are children
                  // ignore: prefer_const_constructors
                  SizedBox(     //blue sized box inside topmost
                    height:43,
                    width:double.infinity,
                  ),
                  SizedBox(
                    height:50,
                    width:double.infinity,
                   child: TextField(
                     style: const TextStyle(fontSize: 20),
                     controller: _cityTextController, decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          setState(() {
                            _search();
                          });
                          FocusManager.instance.primaryFocus?.unfocus(); //to dismiss keyboard on click of searchicon
                        },
                        icon:
                        const Icon(Icons.search, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Search ..',
                     fillColor:  Colors.white,
                     filled: true,
                    ),),
                  ),
                  const SizedBox(        //for Gap
                    height:70,
                  ),
                  SizedBox(          //Body for current weather Info
                    height:150,
                    width:double.infinity,
                    child:SizedBox(    //Body container
                      width:double.infinity,
                      child:Center(
                          child:Column(
                            children:[
                              Text(cityName,style: GoogleFonts.cabin(textStyle:const TextStyle(fontSize: 28,color:Colors.white))),
                              const SizedBox(height:8),
                              Text(day,style: GoogleFonts.cabin(textStyle:const TextStyle(fontSize: 20,color:Colors.white)),),
                              const SizedBox(height:8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Image.asset("assets/images/$icon.png",width:40,height:40),
                                  Text('$temp° C',style: GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 22,color:Colors.white))),
                                ],
                              ),
                              const SizedBox(height:5),
                              Text(desc,style:GoogleFonts.cabin(textStyle: const TextStyle(fontSize:20,color: Colors.white)),)
                            ],
                          )
                      ),
                    ),
                  ),
                  const SizedBox(        //for Gap
                    height:8,
                  ),
                  Container(    //white container  for forecast Info
                      decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                              color: Colors.blue
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                      width:380,
                      height:356,
                      margin: const EdgeInsets.only(top:120),
                      //padding: EdgeInsets.only(top: 100),
                      //alignment: Alignment.bottomCenter,
                      child:Stack(
                        children: [
                          Positioned(top:24,child:  Container(          //1st grey container
                            padding: const EdgeInsets.only(left:25),
                            decoration: BoxDecoration(
                                color:Colors.grey,
                                border: Border.all(
                                    color: Colors.white
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(30))
                            ),
                            margin: const EdgeInsets.only(left:4),
                            alignment: Alignment.center,
                            width:370,
                            height:90,
                            child:Row(
                                children:[
                                  Container(                             //left data(1stcontainer)
                                      padding: const EdgeInsets.only(left: 3, right: 3),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text(day1,style: GoogleFonts.cabin(textStyle:const TextStyle(fontSize: 19,color:Colors.black))),
                                            const SizedBox(height:5),
                                            Text(date1,style:GoogleFonts.cabin(textStyle:  const TextStyle(fontSize: 15,color:Colors.black))),
                                          ],
                                        ),
                                      )
                                  ),
                                  Container(                           //right data(1st container)
                                      padding: const EdgeInsets.only(left: 150),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text('$temp1° C',style: GoogleFonts.cabin(textStyle:const TextStyle(fontSize: 15,color:Colors.black))),
                                            const SizedBox(height:1),
                                            Image.asset("assets/images/$icon1.png",width:40,height:40),
                                          ],
                                        ),
                                      )
                                  ),
                                ]
                            ),
                          ),),
                          Positioned(top:142,child:  Container(   //2nd grey container
                            padding: const EdgeInsets.only(left:25),
                            decoration: BoxDecoration(
                                color:Colors.grey,
                                border: Border.all(
                                    color: Colors.white
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(30))
                            ),
                            margin: const EdgeInsets.only(left:4),
                            alignment: Alignment.center,
                            width:370,
                            height:90,
                            child:Row(
                                children:[
                                  Container(
                                      padding: const EdgeInsets.only(left: 1, right: 1),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text(day2,style: GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 19,color:Colors.black))),
                                            const SizedBox(height:2),
                                            Text(date2,style: GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 15,color:Colors.black))),
                                          ],
                                        ),
                                      )
                                  ),
                                  Container(
                                      padding:const EdgeInsets.only(left: 150),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text('$temp2° C',style:GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 15,color:Colors.black))),
                                            const SizedBox(height:1),
                                            Image.asset("assets/images/$icon2.png",width:40,height:40),
                                          ],
                                        ),
                                      )
                                  ),
                                ]
                            ),
                          ),),
                          Positioned(top:260,child:  Container(             //3rd grey container
                            padding: const EdgeInsets.only(left:25),
                            decoration: BoxDecoration(
                                color:Colors.grey,
                                border: Border.all(
                                    color: Colors.white
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(30))
                            ),
                            margin: const EdgeInsets.only(left:4),
                            alignment: Alignment.center,
                            width:370,
                            height:90,
                            child:Row(
                                children:[
                                  Container(
                                      padding: const EdgeInsets.only(left: 1, right: 1),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text(day3,style: GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 19,color:Colors.black))),
                                            const SizedBox(height:5),
                                            Text(date3,style: GoogleFonts.cabin(textStyle: const TextStyle(fontSize: 15,color:Colors.black))),
                                          ],
                                        ),
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 150),
                                      child:Center(
                                        child:Column(
                                          children:[
                                            const SizedBox(height:23),
                                            Text('$temp3° C',style: GoogleFonts.cabin(textStyle:const TextStyle(fontSize: 15,color:Colors.black))),
                                            const SizedBox(height:2),
                                            Image.asset("assets/images/$icon3.png",width:40,height:40),
                                          ],
                                        ),
                                      )
                                  ),
                                ]
                            ),
                          ),)
                        ],
                      )
                  ),
                ],
              )
          )
      ),
    );
  }

  void _search() async{
    //function used to send requested query to data service class

    final DateTime now = DateTime.now();
    final DateFormat formatter =DateFormat('E,MMMM,d y');
    final String currentDay= formatter.format(now);
    final DateFormat formatter2 =DateFormat('EEEE');
    final DateFormat formatter3 =DateFormat('MMMM,d y');
    final DateTime tom = now.add(const Duration(days:1));
    final DateTime dayAfter = now.add(const Duration(days:2));
    final DateTime dayAfterTom = now.add(const Duration(days: 3));
    final String day1= formatter2.format(tom);
    final String day2= formatter2.format(dayAfter);
    final String day3 =formatter2.format(dayAfterTom);
    final String date1= formatter3.format(tom);
    final String date2= formatter3.format(dayAfter);
    final String date3 =formatter3.format(dayAfterTom);

    final response = await _dataService.getWeather(_cityTextController.text);

    String icon=response.icon.icon.substring(response.icon.icon.length-7).substring(0,3);
    String icon1=response.icon1.icon.substring(response.icon1.icon.length-7).substring(0,3);
    String icon2=response.icon2.icon.substring(response.icon2.icon.length-7).substring(0,3);
    String icon3=response.icon3.icon.substring(response.icon3.icon.length-7).substring(0,3);

    callback(response.cityName.cityName,currentDay,response.tempInfo.temperature.toString(),response.desc.desc,icon,
        day1,day2,day3,date1,date2,date3,response.avgTemp.temperature1.toString(),response.avgTemp.temperature2.toString(),
        response.avgTemp.temperature3.toString(),icon1,icon2,icon3);
  }

}