import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:ecommerce/utils/constants/colors.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/Images/reviews/review_profile_image_1.jpg"),
                ),
                const SizedBox(width: 8),
                Text(
                  "Malini Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: 8),

        //Reviews
        Row(children: [
          RatingBarIndicator(
            rating: 5,
            itemSize: 20,
            unratedColor: Colors.grey,
            itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: ecolor.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text('01 Nov,2023', style: Theme.of(context).textTheme.bodyMedium),
        ]),
        const SizedBox(
          height: 8,
        ),
        const ReadMoreText(
            "The user interface of the app is quite intuitive. I eas able to navigate and make purchases seamlessly. Great job!.",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'Show Less',
            trimCollapsedText: 'Show More',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ecolor.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ecolor.primary)),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration:
              BoxDecoration(color: dark ? ecolor.darkgrey : Colors.grey,borderRadius: BorderRadius.circular(10)),
              
              child: Padding(padding: EdgeInsets.all(8),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("V's Store", style:Theme.of(context).textTheme.titleMedium),
                   Text("02 Nov,2023", style:Theme.of(context).textTheme.bodyMedium),
                  ],),
                   const ReadMoreText(
            "The user interface of the app is quite intuitive. I eas able to navigate and make purchases seamlessly. Great job!.",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'Show Less',
            trimCollapsedText: 'Show More',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ecolor.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ecolor.primary)),
              ],),),
        ),
        SizedBox(height: 20,),

      ],
    );
  }
}
