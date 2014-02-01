package com.videojs.controls{
    
    import com.videojs.VideoJSView;
    import com.videojs.VideoJSModel;
    import com.videojs.controls.VideoJSButton;
    import com.videojs.events.VideoUIEvent;
	  import com.videojs.controls.DefaultTheme;
	  import com.videojs.VideoJSUIUtils;
	  
	  import flash.display.Sprite;
	  import flash.display.MovieClip;
	  import flash.display.Shape;
	  import flash.events.MouseEvent;
	  	  
	  import PlayButtonMC;
	  
	  public class PlayButton extends VideoJSButton {
	    
	    var _playButton:Sprite;

	    public function PlayButton(player){
        super(player);
        init();
	    }
	    
	    private function init():void{
        _playButton:MovieClip = new PlayButtonMC();
        _playButton.graphics.beginFill(DefaultTheme.BUTTON_COLOR, 1);
        addChild(_playButton);
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