package com.videojs{
    
    import com.videojs.VideoJSView;
    import com.videojs.VideoJSModel;
    import com.videojs.events.VideoUIEvent;
    import com.videojs.controls.DefaultTheme;
	  import com.videojs.controls.*;
	  import flash.display.Sprite;
	  import flash.events.Event;
	  import flash.events.MouseEvent;
	  
	  import VideoJS;
	  import VideoJSEmbedded;
	    
    public class VideoJSUIControls extends Sprite{
        
        private var _player:VideoJSEmbedded;
        private var _model:VideoJSModel;
        private var _controlsBackground:Sprite;
        
        public function VideoJSUIControls(player:*){
           _player = player;
           _model = VideoJSModel.getInstance(); 
           initControlsBackground();
           initPlayButton();
           initFullScreenButton();
           initWatermark();
        }
        
        private function initControlsBackground():Sprite{
           _controlsBackground = new Sprite();
           _controlsBackground.alpha = 1.0;
           addChild(_controlsBackground);
           return _controlsBackground;
        }
        
        private function initPlayButton():PlayButton{      
           var _playButton:PlayButton = new PlayButton(_player);
           _controlsBackground.addChild(_playButton);
           return _playButton;
        }
        
        private function initFullScreenButton():FullScreenButton{
          var _fullScreenButton:FullScreenButton = new FullScreenButton(_player);
          _controlsBackground.addChild(_fullScreenButton);
          return _fullScreenButton;
        }
        
        private function initWatermark():Watermark{
          var _watermark:Watermark = new Watermark(_player, DefaultTheme.DEFAULT_WATERMARK);
          _controlsBackground.addChild(_watermark);
          return _watermark;
        }
        
    }
}