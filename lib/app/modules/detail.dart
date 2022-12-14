import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_mobile/app/constants.dart';
import 'package:uas_mobile/app/models/topupmodel.dart';
import '../models/topupmodel.dart';

class DetailDress extends StatefulWidget {
  final TopupModel topup;
  const DetailDress({Key? key, required this.topup}) : super(key: key);

  @override
  State<DetailDress> createState() => _DetailDressState();
}

class _DetailDressState extends State<DetailDress> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Dress',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.topup.Poster),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.topup.Title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 91, 60),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),

                    Text(
                      widget.topup.Deskripsi,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.topup.Count,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 91, 60),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
