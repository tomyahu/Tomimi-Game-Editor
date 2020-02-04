uniform vec4 silhouette_color;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    vec4 texture_color = Texel(tex, texture_coords);

    float alpha = 0;
    if (texture_color.w > 0){
        alpha = 1;
    }

    return color*silhouette_color* vec4(1,1,1,alpha);
}