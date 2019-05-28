

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget switchLoginTypeWidget(){
  return CustomScrollView(
    
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    // 内容
    slivers: <Widget>[
        new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                    <Widget>[
                        const Text('Add'),
                        const Text('Badasda'),
                        const Text('Cdasd'),
                        const Text('DasdasdaDasdasdaDasdasdaDasdasdaDasdasdaDasdasdaDasdasdaDasdasdaDasdasda'),
                    ],
                ),
            ),
        ),
        SliverAppBar(
          
        )
    ],
);
}

Widget loginTopChangeLoginTypeWidget(){
  return SingleChildScrollView(
    
    child: Row(
      children: <Widget>[
        Container(
          height: 200,
          width: 375,
          color: Colors.red,
        ),
        Container(
          height: 200,
          width: 375,
          color: Colors.yellow,
        ),
        Container(
          height: 200,
          width: 375,
          color: Colors.green,
        ),
      ],
    ),
    scrollDirection: Axis.horizontal,
  );
}

// Widget loginMainWidget(BuildContext context,TextEditingController controller){

//   return Container(
//     child: Column(
//       children: <Widget>[
//         Container(
//           // child: Image.asset(''),
//           // child: 200,
//             height: 200,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.green,
//         ),
//         Container(
//           padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
//           child: lwTextField(controller, '手机号'),
//         ),
//         Container(
//           padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//           child: lwTextField(controller, '密码'),
//         ),
//         Container(
//           child: FlatButton(
//             child: Text('登录'),
//             onPressed: (){
//               print('--------点击了登录');
//               print('-------------${controller.text}');
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }

