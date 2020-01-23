uniform vec2 screen;
uniform float current_time;

uniform vec2 initial_pos;
uniform float width;
uniform float height;


float rand(float n){return fract(sin(n) * 43758.5453123);}
vec2 rand(vec2 v){return vec2(rand(v.x), rand(v.y));}

float noise(float p){
	float fl = floor(p);
  float fc = fract(p);
	return mix(rand(fl), rand(fl + 1.0), fc);
}

float noise(vec2 n) {
	const vec2 d = vec2(0.0, 1.0);
    vec2 b = floor(n), f = smoothstep(vec2(0.0), vec2(1.0), fract(n));
	return length(mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y));
}

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){

    vec2 coords = screen_coords / screen;
    vec2 norm_initial_pos = initial_pos / screen;
    coords = (coords - norm_initial_pos) * (screen / vec2(width, height));

    float t = current_time/4;

    float final_color = coords.y;
    float effect1 = final_color + noise((vec2(coords.x*0.5, coords.y) + vec2(t,t*2))*2)*0.4;
    effect1 = pow(min(effect1, 0.9), 0.7);

    effect1 = (1 + effect1*2.6)/3;

    return color*vec4(1,1,1, effect1);

}