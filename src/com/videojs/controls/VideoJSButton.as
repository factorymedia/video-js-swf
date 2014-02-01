package com.videojs.controls{
    
    import com.videojs.VideoJSView;
    import com.videojs.VideoJSModel;
    import com.videojs.events.VideoUIEvent;
	  import com.videojs.controls.DefaultTheme;
	  
	  import flash.display.Sprite;
	  import flash.events.MouseEvent;
	  	  
	  public class VideoJSButton extends Sprite {
	    
	    private var _player:VideoJSEmbedded;
	    private var _model:VideoJSModel;
	    
	    
	    public function VideoJSButton(player:VideoJSEmbedded){
	      _player = player;
	      _model = VideoJSModel.getInstance();
	      addEventListener(MouseEvent.CLICK, onClicked);
	    }
	    
	    public function onClicked(e:MouseEvent):*{
	      return null;
	    }
	    
	    public function playerProperty(pPropertyName:String):*{
        return _player.getProperty(pPropertyName);
      }
      
      public function playerEvent(pType:String, pData:Object = null):Object{
        return dispatchEvent(new VideoUIEvent("vjs_" + pType, pData));
      }
	  }
	  
}