import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            InkWell(
              child: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F511%2F101611154647%2F111016154647-10-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1644588215&t=9a40338757751be9d2684f0d3c80ae31',
                    width: 100.0,
                  ),
                ),
              ),
              onTap: () {
                //打开B路由
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (
                      BuildContext context,
                      animation,
                      secondaryAnimation,
                      ) {
                    return FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  },
                ));
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("点击头像"),
            )
          ],
        ),
      ),
    );
  }
}


class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F511%2F101611154647%2F111016154647-10-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1644588215&t=9a40338757751be9d2684f0d3c80ae31'),
      ),
    );
  }
}