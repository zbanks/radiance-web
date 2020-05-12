#property description Reduce number of colors

void main(void) {
    //float bins = 256. * pow(2, -8. * iIntensity);
    float bins = min(256., 1. / iIntensity);
    
    // bin in non-premultiplied space, then re-premultiply
    vec4 c = demultiply(texture(iInput, uv));
    c.rgb = round(c.rgb * bins) / bins;
    c.rgb = clamp(c.rgb, 0.0, 1.0);
    fragColor = premultiply(c);
}
