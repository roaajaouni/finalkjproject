import 'package:flutter/material.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/view/screen/auth/teacher_login.dart';
import 'package:flutter_childhood/view/screen/teacher_app/edit_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherAccountPage extends StatelessWidget {
  const TeacherAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
 backgroundColor: Colors.white,
body: Column(
  children: [
    Container(height: 250,width: 600, color: AppColor.terqaz,
   child: const  Icon(Icons.settings,size: 200,color: AppColor.fairuz,),
    ),
    Container(
      
      padding:  const EdgeInsets.all(20),
      child:   Column(
        children:[
       ListTile(
   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   TeacherAccountEdittingPage(),
                      ),
                    );
                  },
        leading:const Text('Edit Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        trailing:const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.fairuz,),


       ),
    const SizedBox(height: 50,),
    const Divider(thickness: 2,color: AppColor.terqaz,),
     const SizedBox(height: 50,),
        ListTile(
            onTap: () {
              getIt.get<SharedPreferences>().remove('teacher_token');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TeacherLogin(),
                      ),
                    );
                  },
        leading: const Text('LogOut',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        trailing:const  Icon(Icons.logout,color: AppColor.fairuz,), 

       ),
        ] 
      ),
    ),
  ],
),
           
     
     
    );
  }
}