import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body:SingleChildScrollView(
        child:Padding(padding: const EdgeInsets.all(10),
        child: ListView.separated(separatorBuilder: (_,__)=>const SizedBox(height:32), itemCount: 4,itemBuilder: (_,index)=>const Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/Images/Products/tennis_racket.png"),
                    width: 60,
                    height: 60,
                    
                    ),
                )
              ],
            )
          ],
        ), ),
        ),
        )
    );
  }
}








