package com.videojs.controls{
  
  import com.videojs.VideoJSModel;
  import com.videojs.events.VideoJSEvent;
  
  import flash.display.Sprite;
  import flash.display.DisplayObject;
  import flash.display.Loader;
  import flash.system.LoaderContext;
  import flash.system.ApplicationDomain;
  import flash.net.URLRequest;
  import flash.events.Event;
  import flash.events.MouseEvent;
  
  
  public class Watermark extends Sprite{
    
    private var _player:VideoJSEmbedded;
    private var _model:VideoJSModel;
    private var _url:String;
    private var _position:String;
    private var _image:DisplayObject;
    
    public function Watermark(player:VideoJSEmbedded, url:String, position:String = 'topleft'){
      _player = player;
      _model = VideoJSModel.getInstance();
      _model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);
      _url = url;
      _position = position;
      _player.log("Watermark constructed");
      init();
    }
    
    private function init():void{
      var loader:Loader = new Loader();
      var url:URLRequest = new URLRequest(_url);
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
      loader.load(url);
      _image = addChild(loader);
    }
    
    private function onLoaded(e:Event):void{
      setPosition();
    }
    
    
    
    private function onClicked(e:MouseEvent):void{
      
    }
    
    private function onStageResize(e:Event):void{
      setPosition();
    }
    
    private function setPosition():void{
      _image.x = _model.stageRect.width - _image.width - 10;
      _image.y = 10;
    }
    

  }
  
}