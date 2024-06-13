import 'package:ecommerce/common/widgets/Review/bar.dart';
import 'package:ecommerce/common/widgets/Review/comment.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back,
          color: dark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Reviews & Ratings",
          style: TextStyle(
            color: dark ? Colors.white : Colors.black,
            fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(flex:3,child:Text('5.0',style: Theme.of(context).textTheme.displayLarge,)),
                  const Expanded(
                    flex:7, 
                    child: Column(
                      children: [
                        BarReview(value: '5', percentage: 1),
                        SizedBox(height: 5,),
                        BarReview(value: '4', percentage: 0.8),
                        SizedBox(height: 5,),
                        BarReview(value: '3', percentage: 0.6),
                        SizedBox(height: 5,),
                        BarReview(value: '2', percentage: 0.4),
                        SizedBox(height: 5,),
                        BarReview(value: '1', percentage: 0.3),  
                      ],
                      ),
              )],
            ),
            RatingBarIndicator(
              rating:4.5,
              itemSize:20,
              unratedColor: Colors.grey,
              itemBuilder:(_,__)=>const Icon(Icons.star,color: ecolor.primary,),
            ),
            Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height:32),

            //User Reviews List
             const Comment(),
             const Comment(),
             const Comment(),
             const Comment(),
            ],
            
            
          ),
          )
      ),
    );
  }
}

