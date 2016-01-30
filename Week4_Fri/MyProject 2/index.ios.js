/* @flow */

'use strict';
var React = require('react-native');
var {
    AppRegistry,
    TabBarIOS,
    Component
   } = React;
var Featured = require('./Featured');
var Search = require('./Search');
class BookSearch extends Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedTab: 'featured'
        };
    }
    render() {
        return (
            <TabBarIOS selectedTab={this.state.selectedTab}>
                <TabBarIOS.Item
                    icon={{uri:'booklist'}}
                    title={'featured'} >
                <Featured />
                </TabBarIOS.Item>

                <TabBarIOS.Item
                    icon={{uri:'search'}}>
                <Search />
                </TabBarIOS.Item>
            </TabBarIOS>
        );
    }
}

AppRegistry.registerComponent('MyProject', () => BookSearch);
