class Song{

  String _name;
  String _fileLocation;
  String _imageLocation;
  String _artist;

  Song({String name, String fileLocation, String imageLocation, String artist}){

    this._name = name;
    this._fileLocation = fileLocation;
    this._imageLocation = imageLocation;
    if(artist == null){
      _artist = "Unkown Artist";
    }else{this._artist = artist;}
    
  }

  String getName(){
    return _name;
  }

  String getFileLocation(){
    return _fileLocation;
  }

  String getImageLocation(){
    return _imageLocation;
  }

  String getArtist(){
    return _artist;
  }

  
}