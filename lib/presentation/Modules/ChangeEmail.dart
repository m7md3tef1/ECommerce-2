import 'package:flutter/material.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';
class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label:const Center(child: Text('Change Email',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
                      prefixIcon: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:const Icon(Icons.west_outlined,color: Colors.black,
                          size: 20,),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    hintText: '  New Email',
                    hintStyle: TextStyle(color: Colors.grey,fontSize:18),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    hintText: '  New Password ',
                    hintStyle: TextStyle(color: Colors.grey,fontSize:18),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    hintText: '  Confirm New Password ',
                    hintStyle: TextStyle(color: Colors.grey,fontSize:18),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    hintText: '  Current Password',
                    hintStyle: TextStyle(color: Colors.grey,fontSize:18),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton1(
                name:'Submit'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
