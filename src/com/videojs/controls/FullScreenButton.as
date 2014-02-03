package com.videojs.controls {
    
  import com.greensock.TweenLite;
    
  import flash.display.StageDisplayState;
	import flash.events.Event;  
  import flash.events.MouseEvent;
  
  public class FullScreenButton extends VideoJSButton {
    
    protected var _button:FullScreenButtonMC = new FullScreenButtonMC();
    private var _offsetY:int = 40;

    public function FullScreenButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    protected override function onClicked(e:MouseEvent):*{
      if (stage.displayState == StageDisplayState.NORMAL) {
        stage.displayState = StageDisplayState.FULL_SCREEN;
      } else {
        stage.displayState = StageDisplayState.NORMAL;
      }
    }
    
    protected override function setPosition():void{
      _button.x = _model.stageRect.width - _button.width;
      _button.y = _model.stageRect.height - _button.height - _offsetY;
    }
    
    protected override function onShow(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: 0});
    }
    
    protected override function onHide(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: (0 + _button.width)});
    }
    
  }
  
}