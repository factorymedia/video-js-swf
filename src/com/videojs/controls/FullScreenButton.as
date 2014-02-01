package com.videojs.controls {
  
  import com.videojs.VideoJSView;
  import com.videojs.VideoJSModel;
  import com.videojs.controls.VideoJSButton;
  import com.videojs.events.*;
  import com.videojs.controls.DefaultTheme;
  import com.videojs.VideoJSUIUtils;
  
  import flash.display.Sprite;
  import flash.display.MovieClip;
  import flash.display.StageDisplayState;
  import flash.display.Shape;
  
	import flash.events.Event;  
  import flash.events.MouseEvent;
  	  
  
  public class FullScreenButton extends VideoJSButton {
    
    private var _button:FullScreenButtonMC = new FullScreenButtonMC();

    public function FullScreenButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    public override function onClicked(e:MouseEvent):*{
      if (stage.displayState == StageDisplayState.NORMAL) {
        stage.displayState = StageDisplayState.FULL_SCREEN;
      } else {
        stage.displayState = StageDisplayState.NORMAL;
      }
    }
    
    public override function setPosition():void{
      _button.x = model.stageRect.width - _button.width;
      _button.y = model.stageRect.height - _button.height - 40;
    }
    
  }
  
}