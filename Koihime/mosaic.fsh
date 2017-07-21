#ifdef GL_ES
precision mediump float;

#endif

varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

uniform sampler2D	u_texture;

uniform float u_cols;		//	cols count
uniform float u_rows;	//	rows count


void main()
{
    vec4 color = texture2D(CC_Texture0, v_texCoord);
	if(1==1)
	{
		color = texture2D(CC_Texture0, v_texCoord);
		gl_FragColor = color;
	}
	else
	{
		float u = v_texCoord.x;
		float v = v_texCoord.y;

		int iX = int(u * u_cols);
		int iY = int(v * u_rows);
        
		float x = float(iX) / u_cols;
		float y = float(iY) / u_rows;

		vec2 coord = vec2(x, y);
		color = texture2D(CC_Texture0, coord);
	}

	gl_FragColor = color;
    
    
}

