package com.videojs.controls{
  
  import com.videojs.VideoJSModel;
  import com.videojs.events.VideoJSEvent;
  
  import flash.display.Sprite;
  import flash.display.DisplayObject;
  import flash.display.Loader;
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  import flash.events.Event;
  import flash.events.MouseEvent;
  
  
  public class Watermark extends Sprite{
    
    private var _player:VideoJSEmbedded;
    private var _model:VideoJSModel;
    private var _imageURL:String;
    private var _url:String;
    private var _position:String;
    private var _image:DisplayObject;
    private var _imageLayer:Sprite;
    
    public function Watermark(player:VideoJSEmbedded, imageURL:String, url = undefined, position:String = 'topleft'){
      _player = player;
      _model = VideoJSModel.getInstance();
      _model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);
      _imageURL = imageURL;
      _url = url
      _position = position;
      init();
    }
    
    private function init():void{
      // Load Image
      var loader:Loader = new Loader();
      var url:URLRequest = new URLRequest(_imageURL);
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
      loader.load(url);
      
      // Attach image
      _image = addChild(loader);
      _image.addEventListener(MouseEvent.CLICK, onClicked);
      
      // Create button layer
      _imageLayer = new Sprite();
      _imageLayer.name = "watermarkLayer";
      _imageLayer.addChild(_image);
      _imageLayer.buttonMode = true;
      
      // Attach button to the displaylist
      addChild(_imageLayer);
    }
    
    private function onLoaded(e:Event):void{
      setPosition();
    }
    
    private function onClicked(e:MouseEvent):void{
      if(_url != undefined){
        var url:URLRequest = new URLRequest(_url);
        navigateToURL(url, "_blank");
      }
    }
    
    private function onStageResize(e:Event):void{
      setPosition();
    }
    
    // TODO: Haven't handled different watermark positions yet
    private function setPosition():void{
      switch(_position){
        default:
          _image.x = _model.stageRect.width - _image.width - 10;
          _image.y = 10;
          break;
      }
    }
    

  }
  
}