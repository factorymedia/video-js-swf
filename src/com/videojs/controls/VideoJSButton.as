package com.videojs.controls{
    
    import com.videojs.VideoJSView;
    import com.videojs.VideoJSModel;
    import com.videojs.events.*;
	  import com.videojs.controls.DefaultTheme;
	  
	  import flash.display.Sprite;
	  import flash.events.Event;
	  
	  import flash.events.Event;
	  import flash.events.MouseEvent;
	  	  
	  public class VideoJSButton extends Sprite {
	    
	    private var _player:VideoJSEmbedded;
	    private var _model:VideoJSModel;
      
      // Class Constructor
	    public function VideoJSButton(player:VideoJSEmbedded){
	      _player = player;
	      _model = VideoJSModel.getInstance();
	    }
	    
	    // Initialization defaults
	    public function init(_button:*):void{
        addChild(_button);
  	    addEventListener(MouseEvent.CLICK, onClicked);
        _button.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
        _model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);
      }
	    
    
	    // Model and player accessors
	    public function playerProperty(pPropertyName:String):*{
        return _player.getProperty(pPropertyName);
      }
      
      public function playerEvent(pType:String, pData:Object = null):Object{
        return dispatchEvent(new VideoUIEvent("vjs_" + pType, pData));
      }
      
      public function get model():VideoJSModel{
	      return _model;
	    }
	    
	    // Event Stubs
	    public function onClicked(e:MouseEvent):*{
	      return null;
	    }
      
	    public function onAddedToStage(e:Event):void{
        setPosition();
	    }
	    
	    public function onStageResize(e:Event):void{
        setPosition();
	    }
	    
	    public function setPosition():void{}
	  }
	  
}