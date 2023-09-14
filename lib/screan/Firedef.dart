import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Disease extends StatelessWidget {
  Disease({Key? key}) : super(key: key);

  final number = '+66946785969';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'การป้องกัน',
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'การป้องกันนั้นสามารถทำได้หลายวิธี \nเริ่มจากดับไฟที่เคยจุดไว้,เข้าไปดับกองไฟที่ไม่ใหญ่มากด้วยการนำผ้าไปชุบน้ำและกลบบนลงกองไฟนั้น \nเมื่อเห็นควันไฟที่เราไม่สามารถทำอะไรได้ให้โทรแจ้ง "1362" และให้หลีกเลี่ยงจากควันไฟนั้นอย่างน้อย1กิโลเมตร',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.camera_alt_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(width: 10),
              Text(
                'โทรด่วน',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 254, 254), fontSize: 18),
              ),
            ],
          ),
          GestureDetector(
            onLongPress: () async {
              final Uri url = Uri(
                scheme: 'tel',
                path: "+66946785969",
              );
            },
          )
        ],
      ),
    );
  }
}
