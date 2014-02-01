package com.videojs {
  
  
  public class VideoJSUIUtils {

    import flash.display.Shape;

    
    public static function drawTriangle(x:Number, y:Number, height:Number, color:uint):Shape{
      var triangle:Shape = new Shape;
      triangle.graphics.beginFill(color);
      triangle.graphics.moveTo(height/2, y);
      triangle.graphics.lineTo(height, height+y);
      triangle.graphics.lineTo(x, height+y);
      triangle.graphics.lineTo(height/2, y);
      return triangle;
    }
  }
}

