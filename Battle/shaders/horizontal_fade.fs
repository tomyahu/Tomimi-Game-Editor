uniform float horizontal_fade_start;
uniform float horizontal_fade_end;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    vec4 texture_color = Texel(tex, texture_coords);

    float alpha = 1;
    if (texture_coords.x < horizontal_fade_end){
        alpha = 0;
    }
    else if (texture_coords.x < horizontal_fade_start){
        alpha = (texture_coords.x - horizontal_fade_end)/(horizontal_fade_start - horizontal_fade_end);
    }

    return color*texture_color*vec4(1,1,1,alpha);
}