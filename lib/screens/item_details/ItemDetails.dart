import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/models/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;
  const ItemDetailsScreen({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;

    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.8)),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/heart.svg',color: Colors.black.withOpacity(0.8) ,))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                    Center(
                      child: Hero(
                        tag: item.name,
                        child: Container(
                          width: size.width/2.5,
                          height: size.width/2.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(item.img),
                                  fit: BoxFit.cover
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 32,
                                    offset: const Offset(0, 16)
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32,),
                    Center(child: Text(item.name,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 26),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )),
                    const SizedBox(height: 8,),
                    Center(child: Text(item.price,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,color: SolidColors.primaryColor))),
                    const SizedBox(height: 32,),
                    Text('Delivery info',style: Theme.of(context).textTheme.bodyText1,),
                    const SizedBox(height: 8,),
                    Text(item.deliveryInfo,style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey)),
                    const SizedBox(height: 32,),
                    Text('Return policy',style: Theme.of(context).textTheme.bodyText1,),
                    const SizedBox(height: 8,),
                    Text(item.returnPolicy,style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey)),

                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: bodyMargin,
              right: bodyMargin,

              child: SizedBox(
                height: 64,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                  child: const Text('Add to cart',),
                  style: ElevatedButton.styleFrom(
                      primary: SolidColors.primaryColor,
                      onPrimary: SolidColors.buttonTextColorWhite
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
