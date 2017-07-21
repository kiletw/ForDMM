#ifdef GL_ES
precision mediump float;

#endif

varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

uniform sampler2D	u_texture;

uniform vec2 u_resolution;		//	img size
uniform float u_cell_size;		//	mosaic cell size

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

		float dx = u_cell_size * (1.0 / u_resolution.x);
		float dy = u_cell_size * (1.0 / u_resolution.y);

		vec2 coord = vec2(floor(u / dx) * dx + (dx / 2.0), floor(v / dy) * dy + (dy / 2.0));
		color = texture2D(CC_Texture0, coord);
	}

	gl_FragColor = color;
    
    
}

