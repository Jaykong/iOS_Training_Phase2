//Second App:
  render() {
    var movie = MOCKED_MOVIES_DATA[0];
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


