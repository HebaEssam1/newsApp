import 'package:flutter/material.dart';
import 'package:news/HomeDrawer.dart';
import 'package:news/SourcesTab.dart';
import 'package:news/api_manager.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/model/source_Response.dart';
import 'package:news/my_theme.dart';

class HomePage extends StatelessWidget {

  static const routeName='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
        style: Theme.of(context).textTheme.headline1,),
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(),
        builder: (context, snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Try Again'))
              ],
            );
          }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Try Again'))
              ],
            );
          }

            var sourceList=snapshot.data?.sources ?? [];
            return SourcesTab(sources: sourceList);

        },

      ),
    );
  }
}
