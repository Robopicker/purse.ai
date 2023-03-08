import 'package:flutter/material.dart';

 showPayBillPopup(BuildContext context) {
  Widget _billContent() {
   return  SizedBox(height: 400, child: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(5, (index) {
    return GestureDetector(onTap: () => {
      print(index)
    }, child: Center(
      child: Container(
        height: 140,
        padding: EdgeInsets.only(top: 16, left: 20, right: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.white, border: Border.all(width: 1, color: Color.fromARGB(255, 225, 224, 224), )),
        child: Column(
          children: [Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Color.fromARGB(255, 232, 230, 230),
            borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.wallet)),
          SizedBox(height: 12),
          Text('E-wallet', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
          SizedBox(height: 4),
          Text('lorgdfgbdg svdrfv', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 12),)
          ],


      ),)
    ));
  }),
));
  }
  return (
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(height:500, child: Container(
            padding: EdgeInsets.only(top: 24, left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [GestureDetector(
                    onTap: () => {
                      Navigator.pop(context)
                    },
                    child: Icon(Icons.cancel),
                  ), Expanded(flex: 1, child:  Center(child: Text('Pay Bill', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),))),
                  ],),
                  SizedBox(height: 35,),
                   _billContent()    
                ]
              )),
        )))
    );

}