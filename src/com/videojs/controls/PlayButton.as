package com.videojs.controls{
    
  import com.videojs.VideoJSView;
  import com.videojs.VideoJSModel;
  import com.videojs.controls.VideoJSButton;
  import com.videojs.events.*;
  import com.videojs.controls.DefaultTheme;
  import com.videojs.VideoJSUIUtils;
  
  import flash.display.Sprite;
  import flash.display.MovieClip;
  import flash.display.Shape;
  import flash.events.Event;
  import flash.events.MouseEvent;

  public class PlayButton extends VideoJSButton {
    
    private var _button:PlayButtonMC = new PlayButtonMC();

    public function PlayButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    public override function setPosition():void{
      _button.x = -10;
      _button.y = model.stageRect.height - _button.height - 40;
    }

    public override function onClicked(e:MouseEvent):*{
      if(playerProperty("paused") == true){
        playerEvent("play");
      }else{ 
        playerEvent("pause");
      }
    }
  }
	  
}