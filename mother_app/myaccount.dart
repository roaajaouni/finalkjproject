// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_childhood/config/get_it.dart';
// import 'package:flutter_childhood/view/screen/auth/mother_login.dart';
// import 'package:flutter_childhood/view/screen/mother_app/edit_my_account.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../core/constant/color.dart';


// class MyAccount extends StatefulWidget {
//   const MyAccount({super.key});

//   @override
//   State<MyAccount> createState() => _NotificationsPageState();
// }

// class _NotificationsPageState extends State<MyAccount> {



//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
    
//  backgroundColor: Colors.white,
// body: Column(
//   children: [
//     Container(height: 250,width: 600, color: AppColor.terqaz,
//    child: const  Icon(Icons.settings,size: 200,color: AppColor.fairuz,),
//     ),
//     Container(
      
//       padding:  const EdgeInsets.all(20),
//       child:   Column(
//         children:[
//        ListTile(
//    onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>   MotherEdittingMyAccount(),
//                       ),
//                     );
//                   },
//         leading:const Text('Edit Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
//         trailing:const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.fairuz,),


//        ),
//     const SizedBox(height: 50,),
//     const Divider(thickness: 2,color: AppColor.terqaz,),
//      const SizedBox(height: 50,),
//         ListTile(
//             onTap: () {
//               getIt.get<SharedPreferences>().remove('token');
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>  MotherLogin(),
//                       ),
//                     );
//                   },
//         leading: const Text('LogOut',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
//         trailing:const  Icon(Icons.logout,color: AppColor.fairuz,), 

//        ),
//         ] 
//       ),
//     ),
//   ],
// ),
           
     
     
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/view/screen/auth/mother_login.dart';
import 'package:flutter_childhood/view/screen/mother_app/edit_my_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/color.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: AppColor.terqaz,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 100, color: AppColor.fairuz),
                SizedBox(height: 10),
                Text(
                  'My Account',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.fairuz,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MotherEdittingMyAccount(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.edit, color: AppColor.fairuz),
                    title: const Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColor.fairuz),
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 1, color: Colors.grey),
                  const SizedBox(height: 20),
                  ListTile(
                    onTap: () {
                      getIt.get<SharedPreferences>().remove('token');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MotherLogin(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.logout, color: AppColor.fairuz),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColor.fairuz),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
