package com.videojs.controls{

  import com.greensock.TweenLite;

  import flash.events.Event;
  import flash.events.MouseEvent;

  public class ShareButton extends VideoJSButton {
    
    protected var _button:ShareButtonMC = new ShareButtonMC();

    public function ShareButton(player:VideoJSEmbedded){
      super(player);
      init(_button);
    }
    
    protected override function setPosition():void{
      _button.x = _model.stageRect.width - 38;
      _button.y = 75;
    }

    protected override function onClicked(e:MouseEvent):*{
      
    }
    
    protected override function onMouseOver(e:MouseEvent):void{
      _player.log("mousover");
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: 200});
    }
    
    protected override function onShow(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: 0});
    }
    
    protected override function onHide(e:Event):void{
      TweenLite.to(this, DefaultTheme.UI_SPEED, {x: (0 + _button.width)});
    }

  }
	  
}