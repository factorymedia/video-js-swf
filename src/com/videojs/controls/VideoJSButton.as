package com.videojs.controls{
    
  import com.videojs.VideoJSModel;
  import com.videojs.events.VideoJSEvent;
  import com.videojs.events.VideoUIEvent;
  import com.videojs.controls.DefaultTheme;
  
  import flash.display.Sprite;
  
  import flash.events.Event;
  import flash.events.MouseEvent;
      
  public class VideoJSButton extends Sprite {
    
    protected var _player:VideoJSEmbedded;
    protected var _model:VideoJSModel;
    
    // Class Constructor
    public function VideoJSButton(player:VideoJSEmbedded){
      _player = player;
      _model = VideoJSModel.getInstance();
    }
    
    // Initialization defaults
    protected function init(_button:*):void{
      _model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);

      addChild(_button);
      addEventListener(MouseEvent.CLICK, onClicked);
      addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
      addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);

      addEventListener(VideoUIEvent.ON_SHOW_CONTROLS, onShow);
      addEventListener(VideoUIEvent.ON_HIDE_CONTROLS, onHide);

      _button.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
      _button.buttonMode = true;
    }

    // Model and player accessors
    protected function playerProperty(pPropertyName:String):*{
      return _player.getProperty(pPropertyName);
    }
    
    protected function setPlayerProperty(pPropertyName:String, pPropertyValue:*){
      return _player.setProperty(pPropertyName, pPropertyValue);
    }
    
    protected function playerEvent(pType:String, pData:Object = null):Object{
      return dispatchEvent(new VideoUIEvent("vjs_" + pType, pData));
    }
    
    // Event Stubs
    protected function onClicked(e:MouseEvent):*{
      return null;
    }
    
    protected function onMouseOver(e:MouseEvent):void{}
    
    protected function onMouseOut(e:MouseEvent):void{}
    
    protected function onAddedToStage(e:Event):void{
      setPosition();
    }
    
    protected function onStageResize(e:Event):void{
      setPosition();
    }
    
    protected function setPosition():void{}
    
    protected function onHide(e:Event):void{}
    
    protected function onShow(e:Event):void{}
  }
    
}