'use strict';
var FAKE_BOOK_DATA = [
    {volumeInfo: {title: 'The Catcher in the Rye', authors: "J. D. Salinger", imageLinks: {thumbnail: 'http://books.google.com/books/content?id=PCDengEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'}}}
];
var React = require('react-native');
var API_KEY = '7waqfqbprs7pajbz28mqf6vz';
var API_URL = 'http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json';
var PAGE_SIZE = 25;
var PARAMS = '?apikey=' + API_KEY + '&page_limit=' + PAGE_SIZE;
//var REQUEST_URL = API_URL + PARAMS;
var REQUEST_URL = 'https://www.googleapis.com/books/v1/volumes?q=subject:fiction';
//var REQUEST_URL = 'https://raw.githubusercontent.com/facebook/react-native/master/docs/MoviesExample.json';
var {
    Image,
    StyleSheet,
    Text,
    View,
    Component,
    ListView,
    TouchableHighlight,
    ActivityIndicatorIOS
   } = React;

   var styles = StyleSheet.create({
       container: {
           flex: 1,
           flexDirection: 'row',
           justifyContent: 'center',
           alignItems: 'center',
           backgroundColor: '#F5FCFF',
           padding: 10
       },
       thumbnail: {
           width: 53,
           height: 81,
           marginRight: 10
       },
       rightContainer: {
           flex: 1
       },
       title: {
           fontSize: 20,
           marginBottom: 8
       },
       author: {
           color: '#656565'
       },
       listView: {
       backgroundColor: '#F5FCFF'
   },
   loading: {
       flex: 1,
       alignItems: 'center',
       justifyContent: 'center'
   }
   });

   var styles = StyleSheet.create({
       container: {
           flex: 1,
           flexDirection: 'row',
           justifyContent: 'center',
           alignItems: 'center',
           backgroundColor: '#F5FCFF',
           padding: 10
       },
       thumbnail: {
           width: 53,
           height: 81,
           marginRight: 10
       },
       rightContainer: {
           flex: 1
       },
       title: {
           fontSize: 20,
           marginBottom: 8
       },
       author: {
           color: '#656565'
       },
separator: {
       height: 1,
       backgroundColor: '#dddddd'
   }
   });
   class BookList extends Component {
     constructor(props) {
        super(props);
        this.state = {

            dataSource: new ListView.DataSource({
                rowHasChanged: (row1, row2) => row1 !== row2
            }),
            loaded:false
        };
    }

    componentDidMount() {
   this.fetchData();
}
fetchData() {
       fetch(REQUEST_URL)
       .then((response) => response.json())
       .then((responseData) => {
           this.setState({
               dataSource: this.state.dataSource.cloneWithRows(responseData.items),
               loaded: true
           });
       })
       .done();
   }


   render() {
    if (this.state.loaded) {
        return this.renderLoadingView();
    }

    return (
         <ListView
             dataSource={this.state.dataSource}
             renderRow={this.renderBook.bind(this)}
             style={styles.listView}
             />
     );
}

renderLoadingView() {
return (
<View style={styles.loading}>
    <ActivityIndicatorIOS
        size='large'/>
    <Text>
        Loading books...
    </Text>
</View>
);
}


   }
module.exports = BookList;
