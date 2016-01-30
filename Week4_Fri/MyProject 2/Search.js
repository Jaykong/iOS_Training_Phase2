'use strict';

var React = require('react-native');

var {
  AppRegistry,
    StyleSheet,
    View,
    Text,
    Component
   } = React;

var styles = StyleSheet.create({
    description: {
        fontSize: 20,
        backgroundColor: 'white'
    },
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    }
});

class Search extends Component {
    render() {
        return (
          <View style={styles.container}>
            <Text style={styles.description}>
              Search Tab
            </Text>
        </View>
        );
    }
}

module.exports = Search;
AppRegistry.registerComponent('MyProject', () => Search)

// 'use strict';
//
// var React = require('react-native');
// var SearchBooks = require('./SearchBooks');
//
// var {
//     StyleSheet,
//     NavigatorIOS,
//     Component
//    } = React;
//
// var styles = StyleSheet.create({
//     container: {
//         flex: 1
//     }
// });
//
// class Search extends Component {
//     render() {
//         return (
//             <NavigatorIOS
//                 style={styles.container}
//                 initialRoute={{
//             title: 'Search Books',
//             component: SearchBooks
//         }}/>
//         );
//     }
// }
//
// module.exports = Search;
