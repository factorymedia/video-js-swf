package com.videojs.controls{

  import com.greensock.TweenLite;

  import flash.events.Event;
  import flash.events.MouseEvent;

  public class VolumeButton extends VideoJSButton {
    
    protected var _button:VolumeButtonMC = new VolumeButtonMC();

    public function VolumeButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    protected override function setPosition():void{
      _button.x = 75;
      _button.y = _model.stageRect.height - _button.height - 45;
    }

    protected override function onClicked(e:MouseEvent):*{
      if(playerProperty("muted") == true){
        setPlayerProperty("muted", false);
      }else{ 
        setPlayerProperty("muted", true);
      }
    }
    
    protected override function onShow(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: 0});
    }
    
    protected override function onHide(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: (0 - _button.width - _button.x)});
    }

  }
	  
}