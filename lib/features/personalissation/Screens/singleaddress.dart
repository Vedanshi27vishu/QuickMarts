import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: selectedAddress?Colors.transparent:dark?ecolor.darkgrey:Colors.grey),
      color: selectedAddress?ecolor.primary.withOpacity(0.5):Colors.transparent),
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top:0,
            child: Icon(
              selectedAddress?Icons.check_circle_rounded:null,
              color: selectedAddress?dark?ecolor.light:ecolor.dark:null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Vedanshi Aggarwal",
            maxLines: 1,
            overflow:TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 8,),
            const Text("(+91) 9910542811",maxLines:1,overflow:TextOverflow.ellipsis),
            const SizedBox(height: 8,),
            Text("House no. 1347, sector-5, Sai Kripa Niwas,Vasundhara,Ghaziabad",
            maxLines:2,
            overflow: TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.titleLarge,softWrap: true,),
          ],)
        ],
      ),

    );
  }
}
