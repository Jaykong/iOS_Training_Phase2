

'use strict';


import React, {
  AppRegistry,
  Component,
  Image,
  ListView,
  StyleSheet,
  Text,
  View,
} from 'react-native';

var MOCKED_MOVIES_DATA = [
{title:'title',year:'2015',posters:{thumbnail:
  'http://i.imgur.com/UePbdph.jpg'
}}];

// var API_KEY = '7waqfqbprs7pajbz28mqf6vz';
// var API_URL = 'http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json';
// var PAGE_SIZE = 25;
// var PARAMS = '?apikey=' + API_KEY + '&page_limit=' + PAGE_SIZE;
// var REQUEST_URL = API_URL + PARAMS;

var REQUEST_URL = 'https://raw.githubusercontent.com/facebook/react-native/master/docs/MoviesExample.json';

class otherProject extends Component {
 
//App 3:显示一个Movie
  // constructor(props) {
  //   super(props); 
  //   this.state = {
  //     movies: null,
  //   };
  // }

constructor(props) {
    super(props);
    this.state = {
      dataSource: new ListView.DataSource({
        rowHasChanged: (row1, row2) => row1 !== row2,
      }),
      loaded: false,
    };
  }

  componentDidMount() {
    this.fetchData();
  }

// App 3: 显示一个Movie
  // fetchData() {
  //   fetch(REQUEST_URL)
  //     .then((response) => response.json())
  //     .then((responseData) => {
  //       this.setState({
  //         movies: responseData.movies,
  //       });
  //     })
  //     .done();
  // }

fetchData() {
    fetch(REQUEST_URL)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({
          dataSource: this.state.dataSource.cloneWithRows(responseData.movies),
          loaded: true,
        });
      })
      .done();
  }

// render() {
//     if (!this.state.movies) {
//       return this.renderLoadingView();
//     }
// //App 3:只返回一个电影内容
//     var movie = this.state.movies[0];
//     return this.renderMovie(movie);

//   }

//App 4:用ListView返回一系列电影
 render() {
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }

    return (
      <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderMovie}
        style={styles.listView}
      />
    );
  }

  renderLoadingView() {
    return (
      <View style={styles.container}>
        <Text>
          Loading movies...
        </Text>
      </View>
    );
  }

  renderMovie(movie) {
    return (
      <View style={styles.container}>
        <Image
          source={{uri: movie.posters.thumbnail}}
          style={styles.thumbnail}
        />
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{movie.title}</Text>
          <Text style={styles.year}>{movie.year}</Text>
        </View>
      </View>
    );
  }
}
//Second App:
  // render() {
  //   var movie = MOCKED_MOVIES_DATA[0];
  //   return (
  //       <View style={styles.container}>
  //         <Image
  //           source={{uri: movie.posters.thumbnail}}
  //           style={styles.thumbnail}
  //         />
  //         <View style={styles.rightContainer}>
  //           <Text style={styles.title}>{movie.title}</Text>
  //           <Text style={styles.year}>{movie.year}</Text>
  //         </View>
  //       </View>
  //     );



var styles = StyleSheet.create({
  container:{
    flex:1,
    flexDirection:'row',
    justifyContent:'center',
    alignItems:'center',
    backgroundColor:'#F5FCFF',

  },
  rightContainer:{
    flex:1,
    backgroundColor:'FFFFFF',
  },
  title:{
    fontSize:20,
    marginBottom:8,
    textAlign:'center'
  },
  year:{
    textAlign:'center'
  },
  thumbnail:{
    width:100,
    height:100,
  },
  listView:{
    paddingTop: 20,
    backgroundColor: '#F5FCFF',
  },

});


//First App
// class otherProject extends Component 
// {
// render() 
//  {
//   var movie = MOCKED_MOVIES_DATA[0];
// 	return (
// 		<View style={styles.container}>
// 			<Text>{movie.title} </Text>
// 			<Text>{movie.year} </Text>
// 			<Image 
//       source={{uri:movie.posters.thumbnail}} 
//       style={styles.thumbnail}
//       />
// 		</View>
//     );
//  }
// }
 
// const styles = StyleSheet.create({
//   container:{
//     flex:1,
//   	justifyContent:'center',
//   	alignItems:'center',
//   	backgroundColor:'#F5FCFF',
//   },
//   thumbnail: {
//     width: 53,
//     height: 81,
//   },
//    });

AppRegistry.registerComponent('otherProject', () => otherProject);