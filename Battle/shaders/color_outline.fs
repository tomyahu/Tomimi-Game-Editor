uniform vec4 outline_color;
uniform float outline_size;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    vec4 texture_color = Texel(tex, texture_coords);

    float top_texture_color_alpha = Texel(tex, vec2(texture_coords.x, texture_coords.y - outline_size)).w;
    float bot_texture_color_alpha = Texel(tex, vec2(texture_coords.x, texture_coords.y + outline_size)).w;
    float left_texture_color_alpha = Texel(tex, vec2(texture_coords.x - outline_size, texture_coords.y)).w;
    float right_texture_color_alpha = Texel(tex, vec2(texture_coords.x + outline_size, texture_coords.y)).w;

    float top_left_texture_color_alpha = Texel(tex, vec2(texture_coords.x - outline_size, texture_coords.y - outline_size)).w;
    float bot_left_texture_color_alpha = Texel(tex, vec2(texture_coords.x - outline_size, texture_coords.y + outline_size)).w;
    float top_right_texture_color_alpha = Texel(tex, vec2(texture_coords.x + outline_size, texture_coords.y - outline_size)).w;
    float bot_right_texture_color_alpha = Texel(tex, vec2(texture_coords.x + outline_size, texture_coords.y + outline_size)).w;

    float max_outline_alpha_cross = max(
        max(top_texture_color_alpha, bot_texture_color_alpha),
        max(left_texture_color_alpha, right_texture_color_alpha)
        );

    float max_outline_alpha_x = max(
        max(top_left_texture_color_alpha, bot_left_texture_color_alpha),
        max(top_right_texture_color_alpha, bot_right_texture_color_alpha)
        );

    float max_outline_alpha = max(max_outline_alpha_cross, max_outline_alpha_x);

    if (texture_color.w == 0){
        texture_color = outline_color* vec4(1,1,1,max_outline_alpha);
    }

    return color*texture_color;
}