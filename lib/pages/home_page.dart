import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: ShopDrawer(),
        backgroundColor: Color(0xFFEEF0F3),
        body: const HomePageBody());
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Row(
          children: [SideBar(), ShoppingPage()],
        ),
        Positioned(
            bottom: 50,
            right: 50,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ))))
      ],
    );
  }
}

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final products = [
    Product(
      title: "麦娅月沙发 实木沙发客厅家具 组合套装冬夏两用 小户型经济型木质沙发 配套长茶几【或茶水位】 普通海绵坐垫",
      price: 1580.00,
      image:
          "https://img12.360buyimg.com/n7/jfs/t1/206715/31/40848/131664/672817deF152bc765/a6deb0400d1e431f.jpg",
    ),
    Product(
      title: "【已售百万+】商务腕表石英运动手表休闲皮带男士手表 黑色",
      price: 7.90,
      image:
          "https://img13.360buyimg.com/jdcms/s460x460_jfs/t1/244923/20/20140/134761/67097ba7Ffff2592e/1a61cccf69a4ffc2.jpg",
    ),
    Product(
      title: "华为HUAWEI  Pura 70  二手手机 羽砂黑 12G+512G",
      price: 4399.00,
      image:
          "https://img30.360buyimg.com/jdcms/s460x460_jfs/t1/183571/14/44136/252723/662db7a9F09017346/ee50b5e22dd49354.png",
    ),
    Product(
      title: "美的电水壶热水壶大容量 家用烧水壶304不锈钢 双层防烫无缝内胆电热水壶 快速烧水 1.5L 1566",
      price: 59.00,
      image:
          "https://img11.360buyimg.com/jdcms/s460x460_jfs/t1/180294/13/48977/127421/6705d921F3dc0b133/33b02070a97d85aa.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 商品列表
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width - 200,
        height: size.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 85,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  )),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Sell Item",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
            GridView.extent(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 300,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(products.length * 3, (index) {
                index = index % products.length;
                return Container(
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: Offset(5, 5),
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                image: DecorationImage(
                                  image: NetworkImage(products[index].image),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].title,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                "￥${products[index].price}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
              }),
            )
          ],
        ));
  }
}

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  List items = [
    "Home",
    "Messages",
    "Favorites",
    "Categories",
    "Person",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TradeHub",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: List.generate(items.length, (index) {
              return Container(
                width: 150,
                height: 40,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: index == currentIndex ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        color:
                            index == currentIndex ? Colors.white : Colors.black,
                      ),
                    )),
              );
            }),
          )

          // SizedBox(height: 100)
        ],
      ),
    );
  }
}

class ShopDrawer extends StatefulWidget {
  const ShopDrawer({super.key});

  @override
  State<ShopDrawer> createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.remove_circle_outline_rounded),
          title: SizedBox(
            width: 80,
            child: Row(
              children: [
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://img11.360buyimg.com/jdcms/s460x460_jfs/t1/180294/13/48977/127421/6705d921F3dc0b133/33b02070a97d85aa.jpg"),
                          fit: BoxFit.cover,
                        ))),
                Text("水壶")
              ],
            ),
          ),
        )
      ],
    ));
  }
}
