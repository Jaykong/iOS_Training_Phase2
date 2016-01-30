'use strict';

var React = require('react-native');

var {
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
        alignItems: 'center'
    }
});

class Featured extends Component {
    render() {
        return (
       <View style={styles.container}>
        <Text style={styles.description}>
           Featured Tab
        </Text>
    </View>
        );
    }
}

module.exports = Featured;



// 'use strict';
//
// var React = require('react-native');
// var BookList = require('./BookList');
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
// class Featured extends Component {
//     render() {
//         return (
//             <NavigatorIOS
//                 style={styles.container}
//                 initialRoute={{
//             title: 'Featured Books',
//             component: BookList
//             }}/>
//         );
//     }
// }
//
// module.exports = Featured;
