#property description First order (expontential) hold to the beat

void main(void) {
    vec4 prev = texture(iChannel[0], uv);
    vec4 next = texture(iChannel[1], uv);

    fragColor = mix(next, prev, pow(iIntensity, 0.4));
    fragColor = clamp(fragColor, 0., 1.);
}

#buffershader
void main(void) {
    float t = pow(2., round(6. * iIntensity - 4.));
    if (iIntensity < 0.09 || mod(iTime, t) < 0.1)
        fragColor = texture(iInput, uv);
    else
        fragColor = texture(iChannel[1], uv);
}
