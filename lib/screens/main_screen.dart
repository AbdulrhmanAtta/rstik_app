import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rstikapp/models/language.dart';
import 'package:rstikapp/screens/cartScreen.dart';
import 'package:rstikapp/screens/favorite_screen.dart';
import 'package:rstikapp/screens/home.dart';
import 'package:rstikapp/screens/notifications.dart';
import 'package:rstikapp/screens/profile.dart';
import 'package:rstikapp/screens/search.dart';
import 'package:rstikapp/util/const.dart';
import 'package:rstikapp/widgets/badge.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        appBar: AppBar(
             leading: IconButton(icon: Icon(Icons.search, color: Colors.red[400]), onPressed: null),
             automaticallyImplyLeading: false,
                            centerTitle: true,
                            title: Text(
                              Constants.appName,
                            ),
                            elevation: 0.0,
                            actions: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,8.0,15.0,0.0),
                      child: DropdownButton(
                      onChanged: (Language language){
                      _changedLanguage(language);
                            },
                            underline: SizedBox(),
                            icon: Icon(
                            Icons.language,
                            size: 22.0,
                          
                          ),
                          items:  
                            Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                            value: lang,
                            child: Row(children: [
                              Text(lang.flag),
                              Text(lang.name), 
                          ],)
                          )
                          ).toList(),
                  ),
                    ),
                        
                              // IconButton(
                              //   icon: IconBadge(
                              //     icon: Icons.turned_in,
                              //     size: 22.0,
                              //   ),
                  
                              //   onPressed: (){
                              //     Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //         builder: (BuildContext context){
                              //           return Notifications();
                              //         },
                              //       ),
                              //     );
                              //   },
                              //   tooltip: "Notifications",
                              // ),
                            ],
                          ),
                  
                          body: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: onPageChanged,
                            children: <Widget>[
                              Home(),
                              FavoriteScreen(),
                              SearchScreen(),
                              CartScreen(),
                              Profile(),
                            ],
                          ),
                  
                          bottomNavigationBar: BottomAppBar(
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(width:7),
                                IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    size: 24.0,
                                  ),
                                  color: _page == 0
                                      ? Theme.of(context).accentColor
                                      : Theme
                                      .of(context)
                                      .textTheme.caption.color,
                                  onPressed: ()=>_pageController.jumpToPage(0),
                                ),
                  
                                IconButton(
                                  icon:Icon(
                                    Icons.favorite,
                                    size: 24.0,
                                  ),
                                  color: _page == 1
                                      ? Theme.of(context).accentColor
                                      : Theme
                                      .of(context)
                                      .textTheme.caption.color,
                                  onPressed: ()=>_pageController.jumpToPage(1),
                                ),
                  
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.search,
                                //     size: 24.0,
                                //     color: Theme.of(context).primaryColor,
                                //   ),
                                //   color: _page == 2
                                //       ? Theme.of(context).accentColor
                                //       : Theme
                                //       .of(context)
                                //       .textTheme.caption.color,
                                //   onPressed: ()=>_pageController.jumpToPage(2),
                                // ),
                  
                                IconButton(
                                  icon: IconBadge(
                                    icon: Icons.shopping_cart,
                                    size: 24.0,
                                  ),
                                  color: _page == 3
                                      ? Theme.of(context).accentColor
                                      : Theme
                                      .of(context)
                                      .textTheme.caption.color,
                                  onPressed: ()=>_pageController.jumpToPage(3),
                                ),
                  
                                IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    size: 24.0,
                                  ),
                                  color: _page == 4
                                      ? Theme.of(context).accentColor
                                      : Theme
                                      .of(context)
                                      .textTheme.caption.color,
                                  onPressed: ()=>_pageController.jumpToPage(4),
                                ),
                  
                                SizedBox(width:7),
                              ],
                            ),
                            color: Theme.of(context).primaryColor,
                            shape: CircularNotchedRectangle(),
                          ),
                          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
                          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                          // floatingActionButton: FloatingActionButton(
                          //   elevation: 4.0,
                          //   child: Icon(
                          //     Icons.search,
                          //   ),
                          //   onPressed: ()=>_pageController.jumpToPage(2),
                          // ),
                  
                        ),
                      );
                    }
                  
                    void navigationTapped(int page) {
                      _pageController.jumpToPage(page);
                    }
                  
                    @override
                    void initState() {
                      super.initState();
                      _pageController = PageController();
                    }
                  
                    @override
                    void dispose() {
                      super.dispose();
                      _pageController.dispose();
                    }
                  
                    void onPageChanged(int page) {
                      setState(() {
                        this._page = page;
                      });
                    }
                  }
                  
                  void _changedLanguage(Language language) {
                    print(language.languageCode);
                    }
