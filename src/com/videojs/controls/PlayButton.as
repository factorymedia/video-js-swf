package com.videojs.controls{

  import com.greensock.TweenLite;

  import flash.events.Event;
  import flash.events.MouseEvent;

  public class PlayButton extends VideoJSButton {
    
    protected var _button:PlayButtonMC = new PlayButtonMC();

    public function PlayButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    protected override function setPosition():void{
      _button.x = -10;
      _button.y = _model.stageRect.height - _button.height - 40;
    }

    protected override function onClicked(e:MouseEvent):*{
      if(playerProperty("paused") == true){
        playerEvent("play");
      }else{ 
        playerEvent("pause");
      }
    }
    
    protected override function onShow(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: 0});
    }
    
    protected override function onHide(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: (0 - _button.width)});
    }

  }
	  
}