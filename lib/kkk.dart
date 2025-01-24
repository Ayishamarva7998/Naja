// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:naja/helpers/colors.dart';
// import 'package:naja/helpers/utils.dart';
// import 'package:naja/widgets/category_widget.dart';



// class HomeScreens extends StatefulWidget {

//   HomeScreens({super.key});

//   @override
//   State<HomeScreens> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreens> {
//   final carouselimges=[
//     'assets/carouselimg.png'
//   ];
//   //Always use Stateful widget
//   //follow the UI Correctly
//   //while creating custom widgets, create as a seperate file in widgets folder.
//   //make the code optimised.
//   //for responsiveness i already mention to use .h, .w, .sp, and .r along with height, width, fontsize and radius.

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       extendBody: true,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100.h),
//         child: AppBar(
//           leading: Icon(
//             Icons.arrow_back,
//             color: ColorUtils.bg_white,
//           ),
//           flexibleSpace: Padding(
//             padding: EdgeInsets.only(top: 50),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'LOGO',
//                   style: GoogleFonts.inter(
//                       fontSize: 13.sp,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.symmetric(
//                     horizontal: 10.h,
//                     vertical: 8.w,
//                   ),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white, width: 9.w),
//                       color: ColorUtils.primary_blue.withOpacity(0.02),
//                       borderRadius: BorderRadius.circular(4.r)),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         'assets/location.png',
//                         height: 12.h,
//                         width: 15.w,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         'Delivery to',
//                         style: TextStyle(fontSize: 11.sp),
//                       ),
//                       SizedBox(
//                         width: 5.w,
//                       ),
//                       Text(
//                         'AI Saif Garden',
//                         style: TextStyle(
//                             fontSize: 11.sp, fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.symmetric(
//                     horizontal: 10.h,
//                     vertical: 8.w,
//                   ),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white, width: 9.w),
//                       color: ColorUtils.primary_blue.withOpacity(0.02),
//                       borderRadius: BorderRadius.circular(4.r)),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         'assets/search.png',
//                         height: 12.h,
//                         width: 15.w,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         'Search for meat products',
//                         style: TextStyle(fontSize: 11.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           backgroundColor: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(children: [
//           Container(
//             color: Colors.white,
//             margin: EdgeInsets.symmetric(horizontal: 8.w),
//             child:
//              Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
          
//                 //   'FEATURED FESTIVE DEALS',
               
                
//               ],
//             ),
//           ),

//           Column(
//             children: [
//               Container(
//                 width: getWidth(context),
//                 height: 160.h,
                
//                 // color: Colors.amber,
//                 child: CarouselSlider(
//                   options: CarouselOptions(
//                     viewportFraction: 1,
//                     autoPlay: true,
//                   ),
//                   items: [
                    
//                     // width: 100,),
//                     'assets/carouselimg.png',
                    
                    
//                   ].map(
//                     (i) {
//                       return Builder(builder: (BuildContext context) {
//                         return Container(
                         
//                           // width: 410,
//                           width: MediaQuery.of(context).size.width,
//                           child: Row(
//                             children: [
//                               Image.asset(i,
//                               fit: BoxFit.cover,
//                               width: MediaQuery.of(context).size.width,),
//                             ],
//                           ),
//                         );
//                       });
//                     },
//                   ).toList(),
//                 ),
//               ),
//                 // child: ,),
             
//             ],
//           ),

//           // CategoryWidget(),
        

//           //deal of the day

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'DEAL OF THE DAY',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500, color: ColorUtils.font_grey),
//                 ),
//               ),
//               Text(
//                 'see all',
//                 style: GoogleFonts.inter(
//                     color: ColorUtils.primary_blue, fontSize: 10.sp),
//               ),
//             ],
//           ),
//           Row(
//             children: [
              
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 150.h,
//                   width: 340.w,
//                   color: Colors.white,
//                   child: Row(
//                     children: [
//                       deals(image: 'assets/beef.png',txt1: 'Tender Beef Chunks for',txt2:'Stews & Stir-Fries',qty: '500 g'),
//                       SizedBox(width: 10.w),
//                        deals(image: 'assets/chickenleg.png',txt1: 'Chicken Curry Cut-Small',txt2:'Pieces',qty: '500 g'),
                       
//                         deals(image: 'assets/tilapia.png',txt1: 'Fresh Cut Tilapia',txt2:'',qty: '300 g'),
                          
                          
                      
                          
                    
                      
//                     ],
//                   ),
//                 ),
//               ),
             
//             ],
            
//           ),
//           // add banner 
         

//          Row(
//           children: [
//             SizedBox(width: 10.w,),
//              Container(height: 80.h,width: 160.w,child: Image.asset('assets/banner1.png'),),
//              SizedBox(width: 20.w,),
//               Container(height: 80.h,width: 160.w,child: Image.asset('assets/banner2.png'),)


//           ],
//          ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             Text('FAST IN 15 MINUTES',style: TextStyle(fontSize: 12.sp,color: ColorUtils.font_grey,fontWeight: FontWeight.w400),),
//             Text(
//                     'see all',
//                     style: GoogleFonts.inter(
//                         color: ColorUtils.primary_blue, fontSize: 10.sp),
//                   )
          
//           ],),
//         ),
//         Row(children: [
//           deals(image: 'assets/frozenveg.png', txt1: '', txt2: '', qty: ''),
//            SizedBox(width: 10.w),
//           deals(image: 'assets/peanut.png', txt1: '', txt2: '', qty: ''),
//           //  SizedBox(width: 10.w),
//           deals(image: 'assets/curry.png', txt1: '', txt2: '', qty: '')
//         ],)
          
//         ],
        
//         ),

        


        
//       ),
      
      
//     );
//   }

//   Container deals({required String image, required String txt1 , required String txt2 , required String qty}) {
//     return Container(
//                       height: 150.h,
//                       width: 110.w,
//                       color: Colors.white,
//                       child: Column(children: [
//                              Image.asset(image,fit: BoxFit.cover,),
//                              Text(
//                             txt1,
//                             style: TextStyle(fontSize: 9.sp),
//                           ),
//                            Padding(
//                             padding: const EdgeInsets.only(right: 25),
//                             child: Text(
//                               txt2,
//                               style: TextStyle(fontSize: 9.sp),
//                             ),
//                           ),
//                            SizedBox(
//                             height: 4.h,
//                           ),
//                            Padding(
//                             padding: const EdgeInsets.only(right: 85),
//                             child: Text(
//                               qty,
//                               style: TextStyle(
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: ColorUtils.font_grey),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
                            
//                             Text('AED 23.75',style: TextStyle(fontSize: 9.sp),),

//                             Container(height: 20.h,width: 60.w,
//                             child: Center(child: Text('Add',style: TextStyle(fontSize: 11.sp,color: ColorUtils.bg_white),)),
//                             decoration: BoxDecoration(color: ColorUtils.secondary_green,
//                             borderRadius: BorderRadius.circular(5.sp))
//                             )
//                           ],)
                       
//                       ],)
                     
//                     );
//   }
// }