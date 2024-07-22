import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Disease extends StatelessWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = '0946785969';
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          const Padding(padding: EdgeInsets.all(5)),
          Center(
            child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'การป้องกันนั้นสามารถทำได้หลายวิธี เริ่มจากดับไฟที่เคยจุดไว้,เข้าไปดับกองไฟที่ไม่ใหญ่มากด้วยการนำผ้าไปชุบน้ำและกลบบนลงกองไฟนั้น เมื่อเห็นควันไฟที่เราไม่สามารถทำอะไรได้ให้โทรแจ้ง 1362 และให้หลีกเลี่ยงจากควันไฟนั้นอย่างน้อย1กิโลเมตร',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                )),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
                alignment: const Alignment(0, -15),
                child: ElevatedButton(
                  onPressed: () async {
                    // ignore: deprecated_member_use
                    launch('tel://$number');
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 255, 255, 255)),
                  child: const Text(
                    'โทรด่วน',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
