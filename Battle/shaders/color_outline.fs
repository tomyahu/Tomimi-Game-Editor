uniform vec4 outline_color;
uniform int outline_size;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    vec4 texture_color = Texel(tex, texture_coords);

    int i;
    int j;

    float max_outline_alpha = 0;
    for(i = -outline_size; i <= outline_size; i++){
        for(j = -outline_size; j <= outline_size; j++){
              max_outline_alpha = max(max_outline_alpha, Texel(tex, vec2(texture_coords.x + i/love_ScreenSize.x, texture_coords.y + j/love_ScreenSize.y)).w);
        }
    }

    if (texture_color.w == 0){
        texture_color = outline_color* vec4(1,1,1,max_outline_alpha);
    }

    return color*texture_color;
}