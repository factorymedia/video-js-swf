package com.videojs{
    
    import com.videojs.VideoJSView;
    import com.videojs.VideoJSModel;
    import com.videojs.events.VideoUIEvent;
    import com.videojs.events.VideoJSEvent;
    import com.videojs.events.VideoPlaybackEvent;
    import com.videojs.controls.DefaultTheme;
	  import com.videojs.controls.*;
	  
	  import flash.display.Sprite;
	  import flash.events.Event;
	  import flash.events.MouseEvent;
	  import flash.utils.*;
	  
	    
    public class VideoJSUIControls extends Sprite{
        
        private var _player:VideoJSEmbedded;
        private var _model:VideoJSModel;
        private var _controlsBackground:Sprite;
        private var _controlsList:Array = new Array();
        private var _uiList:Array = new Array();
        private var _hoverTimeout:uint;
        private var _hideUIDelay:int = 5000;
        
        public function VideoJSUIControls(player:*){
           _player = player;
           _model = VideoJSModel.getInstance(); 
           _model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);
        
           initControlsBackground();
           
           _controlsList.push(initPlayButton());
           _controlsList.push(initFullScreenButton());
           _controlsList.push(initVolumeButton());
           _controlsList.push(initShareButton());
           _uiList.push(initWatermark());
           
           initHoverEvents();
        }
        
        private function initHoverEvents():void{
          addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        }
        
        public function showControls():Boolean{
          for each(var control in _controlsList){
            control.dispatchEvent(new VideoUIEvent(VideoUIEvent.ON_SHOW_CONTROLS));
          }
          return true;
        }
        
        public function hideControls():Boolean{
          for each(var control in _controlsList){
            control.dispatchEvent(new VideoUIEvent(VideoUIEvent.ON_HIDE_CONTROLS));
          }
          return true;
        }
        
        private function onStageResize(e:Event):void{
            _controlsBackground.hitArea.width = _model.stageRect.width;
          _controlsBackground.hitArea.height = _model.stageRect.height;
        }
        
        private function onMouseMove(e:MouseEvent):void{
          showControls();
          clearTimeout(_hoverTimeout);
          _hoverTimeout = setTimeout(hideControls, _hideUIDelay);
        }
        
        private function initControlsBackground():Sprite{
           _controlsBackground = new Sprite();
           _controlsBackground.name = "uicontrols"
           _controlsBackground.alpha = 1.0;
           
           // Add hit area
           var _controlsHitArea:Sprite = new Sprite();
           _controlsHitArea.name = "controlsHitArea";
           _controlsHitArea.graphics.beginFill(0xFFFFFF);
           _controlsHitArea.graphics.drawRect(0,0,_model.stageRect.width, _model.stageRect.height);
           _controlsHitArea.mouseEnabled = false;
           _controlsHitArea.visible = false;
           _controlsHitArea.x = _controlsBackground.x;
           _controlsHitArea.y = _controlsBackground.y;
           _controlsBackground.hitArea = _controlsHitArea;
           
           // Add controls base and hit area
           addChild(_controlsBackground);
           addChild(_controlsHitArea);
          
           return _controlsBackground;
        }
        
        private function initPlayButton():PlayButton{
           var _playButton:PlayButton = new PlayButton(_player);
           _controlsBackground.addChild(_playButton);
           return _playButton;
        }
        
        private function initVolumeButton():VolumeButton{
           var _volumeButton:VolumeButton = new VolumeButton(_player);
           _controlsBackground.addChild(_volumeButton);
           return _volumeButton;
        }
        
        private function initShareButton():ShareButton{
           var _shareButton:ShareButton = new ShareButton(_player);
           _controlsBackground.addChild(_shareButton);
           return _shareButton;
        }
        
        private function initFullScreenButton():FullScreenButton{
          var _fullScreenButton:FullScreenButton = new FullScreenButton(_player);
          _controlsBackground.addChild(_fullScreenButton);
          return _fullScreenButton;
        }
        
        private function initWatermark():Watermark{
          var _watermark:Watermark = new Watermark(_player, DefaultTheme.DEFAULT_WATERMARK, DefaultTheme.DEFAULT_WATERMARK_URL);
          _controlsBackground.addChild(_watermark);
          return _watermark;
        }
        
    }
}